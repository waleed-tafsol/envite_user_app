import 'dart:convert';
import 'dart:io';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/services/customPrint.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:event_planner_light/utills/aws_utills.dart';
import 'package:event_planner_light/utills/enums.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/AddEventsScreen/ConfirmOrAddMoreEvents.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places_sdk/flutter_google_places_sdk.dart';
import 'package:get/get.dart';
import 'package:get_thumbnail_video/index.dart';
import 'package:get_thumbnail_video/video_thumbnail.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:intl/intl.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';

import '../constants/ApiConstant.dart';
import '../model/CatagoryModel.dart';
import '../utills/ConvertDateTime.dart';
import '../view/widgets/BottomModelSheet.dart';

class AddEventController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    isAddPastEvents.value = Get.arguments["isAddPastEvents"] ?? false;
    //  isloading.value = true;
    // await getcatagories();
    //  isloading.value = false;
  }

  final googlePlaces = FlutterGooglePlacesSdk(ApiConstants.googleAPIKey);

  RxBool isPredictionsLoading = false.obs;
  String placeName = "";
  LatLng? placeLatLang;

  void onPlaceSelected(String name, LatLng? latLang) async {
    placeLatLang = latLang;
    placeName = name;
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController avnueController = TextEditingController();
  List<TextEditingController> emailController =
      <TextEditingController>[TextEditingController()].obs;
  List<TextEditingController> socialLinkController =
      <TextEditingController>[TextEditingController()].obs;
  TextEditingController descriptionController = TextEditingController();
//  RxList<CatagoryModel> categories = <CatagoryModel>[].obs;
  Rx<CategoryModel?> selectedCategory = Rx<CategoryModel?>(null);
  final ImagePicker _picker = ImagePicker();
  RxBool isAddPastEvents = false.obs;
  RxBool isloading = false.obs;
  List<String> options = ['public', 'private', 'exclusive'];
  Rx<String?> selectedOption = Rx<String?>(null);
  RxList<File> pickedImages = <File>[].obs;
  RxList<File> pickedVideo = <File>[].obs;
  Rx<DateTime?> selectedStartDate = Rx<DateTime?>(null);
  Rx<DateTime?> selectedEndDate = Rx<DateTime?>(null);

  // final TextEditingController avenuePlaceController = TextEditingController();
  // String? avenueLat;
  // String? avenueLng;

  Rx<String?> selectedStartTime = Rx<String?>(null);
  Rx<String?> selectedEndTime = Rx<String?>(null);

  void removeImage(File file) {
    pickedImages.remove(file);
  }

  Future<void> pickImage() async {
    try {
      pickedImages.length > 3 ? ('Cannot Upload Videos more than 3') : null;

      final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        pickedImages.add(File(file.path));
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image or video: $e');
    }
  }

  void setStartTime(String time) {
    if (selectedEndTime.value != null) {
      DateFormat format = DateFormat("HH:mm");
      DateTime startTime = format.parse(time);
      DateTime endTime = format.parse(selectedEndTime.value!);

      if (time == selectedEndTime.value) {
        CustomSnackbar.showError(
            "Error", "Start time and end time cannot be the same");
        return;
      }

      if (startTime.isAfter(endTime)) {
        CustomSnackbar.showError(
            "Error", "Start time cannot be after end time");
        return;
      }
    }

    selectedStartTime.value = time;
  }

  void setEndTime(String time) {
    if (selectedStartTime.value != null) {
      DateFormat format = DateFormat("HH:mm");
      // DateTime startTime = format.parse(selectedStartTime.value!);
      // DateTime endTime = format.parse(time);

      if (selectedStartTime.value == time) {
        CustomSnackbar.showError(
            "Error", "End time and start time cannot be the same");
        return;
      }

      // if (endTime.isBefore(startTime)) {
      //   CustomSnackbar.showError(
      //       "Error", "End time cannot be before start time");
      //   return;
      // }
    }

    selectedEndTime.value = time;
  }

  void setStartDate(DateTime date) {
    if (isAddPastEvents.value && date.isAfter(DateTime.now())) {
      CustomSnackbar.showError(
        "Invalid Date",
        "For past events, the start date must be in the past.",
      );
    } else {
      selectedStartDate.value = date;
    }
  }

  void setEndDate(DateTime date) {
    if (isAddPastEvents.value && date.isAfter(DateTime.now())) {
      CustomSnackbar.showError(
        "Invalid Date",
        "For past events, the end date must be in the past.",
      );
    } else {
      selectedEndDate.value = date;
    }
  }

  verifyUserPackageAndSetEventType(String eventType, BuildContext context) {
    if (isAddPastEvents.value) {
      setSelectedOption(eventType);
      return;
    }
    final int publicIndex = authService.me.value!.subscriptions!
        .where((element) => element.eventType == Events.public.text)
        .length;
    if (eventType == "public") {
      final user = authService.me.value;
      if (user!.role!.contains(UserRoles.eventPlanner.text)) {
        if (user.subscriptions!.isEmpty) {
          BottomSheetManager.buySubscriptionForPublic(context);
        } else if (publicIndex == -1) {
          BottomSheetManager.upgradEvent(context);
        } else {
          setSelectedOption(eventType);
        }
      }
    } else {
      setSelectedOption(eventType);
    }
  }

  bool validateEventForm(GlobalKey<FormState> formKey) {
    if (!formKey.currentState!.validate()) {
      return false;
    }

    if (selectedCategory.value == null) {
      CustomSnackbar.showError("Error", "Please select the category of event");
      return false;
    }

    if (selectedStartDate.value == null || selectedEndDate.value == null) {
      CustomSnackbar.showError(
          "Error", "Please select the start and end date of event");
      return false;
    }

    if (selectedStartTime.value == null || selectedEndTime.value == null) {
      CustomSnackbar.showError(
          "Error", "Please select the start and end time of event");
      return false;
    }
    if (placeLatLang == null) {
      CustomSnackbar.showError("Error", "Please Enter the location of event");
      return false;
    }

    return true;
  }

/*
  Future<void> getcatagories() async {
    try {
      final response =
          await http.get(Uri.parse(ApiConstants.getMyCatagories), headers: {
        'Authorization': 'Bearer ${authService.authToken}',
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['data'];
        categories.value = data.map((e) => CatagoryModel.fromJson(e)).toList();
        isloading.value = false;
      } else {
        isloading.value = false;
        final errorData = jsonDecode(response.body);
        throw (
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      isloading.value = false;
      CustomSnackbar.showError('Error', e.toString());
    }
  }
*/

  Future<void> pickVideo() async {
    try {
      final XFile? file = await _picker.pickVideo(source: ImageSource.gallery);
      if (file != null) {
        pickedVideo.add(File(file.path));
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image or video: $e');
    }
  }

  Future<String> getThumbnail(String videoPath) async {
    final uint8List = await VideoThumbnail.thumbnailData(
      video: videoPath,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 200,
      quality: 75,
    );
    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/thumbnail.jpg';
    final file = File(filePath);
    await file.writeAsBytes(uint8List);
    return filePath;
  }

// Method to play the video
  void playVideo(String videoPath) {
    final videoPlayerController = VideoPlayerController.file(File(videoPath));
    videoPlayerController.initialize().then((_) {
      videoPlayerController.play();
    });
  }

  void setSelectedOption(String option) {
    selectedOption.value = option;
  }

  Future<void> addEvent() async {
    final url = Uri.parse(ApiConstants.addEvent);

    try {
      isloading.value = true;

      final request = http.MultipartRequest('POST', url);

      // Add text fields
      request.fields['name'] = nameController.value.text;
      request.fields['isPastEvent'] = isAddPastEvents.value.toString();
      request.fields['eventType'] =
          authService.me.value?.role?.first == UserRoles.user.text
              ? "private"
              : selectedOption.value ?? "";
      request.fields['address'] = placeName;
      request.fields['latitude'] = placeLatLang!.lat.toString();
      request.fields['longitude'] = placeLatLang!.lng.toString();
      if (emailController.first.text.isNotEmpty || emailController.length > 1) {
        for (int i = 0; i < emailController.length; i++) {
          emailController[i].text.isNotEmpty
              ? request.fields['emails[$i]'] = emailController[i].text
              : null;
        }
      }

      for (int i = 0; i < pickedImages.length; i++) {
        final file = pickedImages[i];
        final mimeType = lookupMimeType(file.path);
        final mediaType = mimeType != null
            ? MediaType.parse(mimeType)
            : MediaType('image', 'jpeg');

        var multipartFile = await http.MultipartFile.fromPath(
          'images',
          file.path,
          contentType: mediaType,
        );
        request.files.add(multipartFile);
      }

      if (socialLinkController.first.text.isNotEmpty ||
          socialLinkController.length > 1) {
        for (int i = 0; i < socialLinkController.length; i++) {
          socialLinkController[i].text.isNotEmpty
              ? request.fields['socialLinks[$i]'] = socialLinkController[i].text
              : null;
        }
      }

      request.fields['description'] = descriptionController.value.text;

      request.fields['videosCount'] = pickedVideo.length.toString();
      request.fields['avenue'] = avnueController.value.text;
      request.fields['categorySlug'] = selectedCategory.value?.slug ?? "";
      request.fields['startDate'] = selectedStartDate.value!.toUtc().toString();
      request.fields['endDate'] = selectedEndDate.value!.toUtc().toString();
      request.fields['startTime'] = selectedStartTime.value ?? "";
      request.fields['endTime'] = selectedEndTime.value ?? "";
      // request.fields['endTime'] = selectedEndTime.value;

      // Add headers
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ${authService.authToken}',
      });

      // Send the request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      // Handle the response
      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        List<String> videoUrls =
            List<String>.from(responseData["data"]["videoUrls"]);
        await uploadFilesToS3(
            presignedUrls: videoUrls,
            filePaths: pickedVideo.map((file) => file.path).toList());

        // CustomSnackbar.showSuccess(
        //     'Success', responseData["message"] ?? "Event created successfully");

        isloading.value = false;
        isAddPastEvents.value
            ? Get.until((route) => route.isFirst)
            : Get.offAndToNamed(ConfirmorAddMoreEvents.routeName);
        // Get.offAndToNamed(ConfirmorAddMoreEvents.routeName);
      } else {
        final errorData = jsonDecode(response.body);
        throw errorData["message"]["error"][0] ?? "An error occurred";
      }
    } catch (e) {
      isloading.value = false;
      CustomSnackbar.showError("Error", e.toString());
      ColoredPrint.red(e.toString());
    }
  }
}
