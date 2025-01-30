import 'dart:convert';
import 'dart:io';
import 'package:event_planner_light/services/customPrint.dart';
import 'package:event_planner_light/utills/aws_utills.dart';
import 'package:http/http.dart' as http;
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/AddEventsScreen/ConfirmOrAddMoreEvents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_thumbnail_video/index.dart';
import 'package:get_thumbnail_video/video_thumbnail.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import '../constants/ApiConstant.dart';
import '../main.dart';
import '../model/CatagoryModel.dart';
import '../model/event_detail_response.dart';
import '../utills/ConvertDateTime.dart';
import 'package:http_parser/http_parser.dart';

import 'HomeScreenController.dart';

class EditEventDetailController extends GetxController {
  late EventDetailData eventDetail;
  late HomeScreenController homeScreenController;

  @override
  void onInit() async {
    super.onInit();
    homeScreenController = Get.find<HomeScreenController>();

    //  isloading.value = true;
    // await getcatagories();
    //  isloading.value = false;
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController avnueController = TextEditingController();
  List<TextEditingController> emailController =
      <TextEditingController>[TextEditingController()].obs;
  List<TextEditingController> socialLinkController =
      <TextEditingController>[TextEditingController()].obs;
  TextEditingController descriptionController = TextEditingController();
//  RxList<CatagoryModel> categories = <CatagoryModel>[].obs;
  Rx<CategoryModel?> selectedCategory = CategoryModel().obs;
  final ImagePicker _picker = ImagePicker();
  RxBool isAddPastEvents = false.obs;
  RxBool isloading = false.obs;
  List<String> options = ['public', 'private', 'exclusive'];
  Rx<String?> selectedOption = Rx<String?>(null);
  RxList<File> pickedImages = <File>[].obs;
  RxList<String> existingImages = <String>[].obs;
  RxList<File> pickedVideo = <File>[].obs;
  Rx<String> existingVideo = "".obs;
  Rx<DateTime> selectedStartDate = DateTime.now().add(Duration(days: 1)).obs;
  Rx<DateTime> selectedEndDate = DateTime.now().add(Duration(days: 1)).obs;

  final TextEditingController avenuePlaceController = TextEditingController();
  String? avenueLat;
  String? avenueLng;

  Rx<String> selectedStartTime =
      TimeOfDay.now().format(navigatorKey.currentContext!).obs;
  Rx<String> selectedEndTime =
      TimeOfDay.now().format(navigatorKey.currentContext!).obs;

  void removeImage(File file) {
    pickedImages.remove(file);
  }

  Future<void> pickImage() async {
    try {
      pickedImages.length > 3
          ? Exception('Cannot Upload Videos more than 3')
          : null;

      final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        pickedImages.add(File(file.path));
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image or video: $e');
    }
  }

  void setStartTime(String time) {
    selectedStartTime.value = time;
  }

  void setEndTime(String time) {
    selectedEndTime.value = time;
  }

  void setStartDate(DateTime date) {
    selectedStartDate.value = date;
  }

  void setEndDate(DateTime date) {
    selectedEndDate.value = date;
  }

  void setEditValues(EventDetailData eventDetailData) {
    eventDetail = eventDetailData;
    nameController.text = eventDetail.name ?? "";
    avnueController.text = eventDetail.avenue ?? "";
    avenuePlaceController.text = eventDetail.address ?? "";
    avenueLat = eventDetail.location?.coordinates?[0].toString();

    avenueLng = eventDetail.location?.coordinates?[1].toString() ?? "";
    emailController.clear();
    if (eventDetail.emails?.isEmpty ?? true) {
      emailController.add(TextEditingController());
    } else {
      eventDetail.emails?.forEach((element) {
        emailController.add(TextEditingController(text: element));
      });
    }

    socialLinkController.clear();
    if (eventDetail.socialLinks?.isEmpty ?? true) {
      socialLinkController.add(TextEditingController());
    } else {
      eventDetail.socialLinks?.forEach((element) {
        socialLinkController.add(TextEditingController(text: element));
      });
    }
    descriptionController.text = eventDetail.description ?? "";
    selectedCategory.value = homeScreenController.categories
        .firstWhereOrNull((category) => category.sId == eventDetail.category);
    selectedOption.value = eventDetail.eventType;
    selectedStartDate.value = DateTime.parse(eventDetail.startDate ?? "");
    selectedEndDate.value = DateTime.parse(eventDetail.endDate ?? "");
    selectedStartTime.value = eventDetail.startTime ?? "";
    selectedEndTime.value = eventDetail.endTime ?? "";
    eventDetail.images?.forEach((element) {
      existingImages.add(element);
    });
    eventDetail.videos?.forEach((element) {
      existingVideo.value = element;
    });
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
        throw Exception(
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
    await file.writeAsBytes(uint8List!);
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
    final url = Uri.parse(ApiConstants.updateEvent + eventDetail.slug!);

    try {
      isloading.value = true;

      final request = http.MultipartRequest('PATCH', url);

      request.fields['name'] = nameController.value.text;
      request.fields['isPastEvent'] = isAddPastEvents.value.toString();
      request.fields['eventType'] = selectedOption.value ?? "";
      request.fields['address'] = avenuePlaceController.text;
      request.fields['latitude'] = avenueLat.toString();
      request.fields['longitude'] = avenueLng.toString();
      if (emailController.first.text.isNotEmpty || emailController.length > 1) {
        for (int i = 0; i < emailController.length; i++) {
          emailController[i].text.isNotEmpty
              ? request.fields['emails[$i]'] = emailController[i].text
              : null;
        }
      }
      if (existingImages.isNotEmpty) {
        for (var i = 0; i < existingImages.length; i++) {
          String imagePath =
              existingImages[i].replaceFirst(ApiConstants.s3bucket, "");
          request.fields['keepImages[$i]'] = imagePath;
        }
      }
      if (existingVideo.isNotEmpty) {
        request.fields['keepVideos[0]'] = existingVideo.value;
      }

      if (pickedImages.isNotEmpty) {
        for (int i = 0; i < pickedImages.length; i++) {
          final file = pickedImages[i];
          final mimeType = lookupMimeType(file.path);
          final mediaType = mimeType != null
              ? MediaType.parse(mimeType)
              : MediaType('image', 'jpeg');

          var multipartFile = await http.MultipartFile.fromPath(
            'images',
            file.path,
            // filename: file.uri.pathSegments.last,
            contentType: mediaType,
          );
          request.files.add(multipartFile);
        }
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

      pickedVideo.isNotEmpty
          ? request.fields['videosCount'] = pickedVideo.length.toString()
          : null;
      request.fields['avenue'] = avnueController.value.text;
      request.fields['categorySlug'] = selectedCategory.value?.slug ?? "";
      request.fields['startDate'] =
          formatToIso8601WithTimezone(selectedStartDate.value);
      request.fields['endDate'] =
          formatToIso8601WithTimezone(selectedEndDate.value);
      request.fields['startTime'] = selectedStartTime.value;
      request.fields['endTime'] = selectedEndTime.value;

      // Add headers
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ${authService.authToken}',
      });

      // Send the request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      // Handle the response
      if (response.statusCode == 200) {
        final responseData = jsonDecode(response.body);

        if (pickedVideo.isNotEmpty) {
          List<String> videoUrls =
              List<String>.from(responseData["data"]["videoUrls"]);

          await uploadFilesToS3(
              presignedUrls: videoUrls,
              filePaths: pickedVideo.map((file) => file.path).toList());
          // ColoredPrint.green(
          //     "Event Slug : ${responseData["data"]["videoUrls"]}");

          // CustomSnackbar.showSuccess('Success',
          //     responseData["message"] ?? "Event created successfully");
        }
        CustomSnackbar.showSuccess(
            'Success', responseData["message"] ?? "Event created successfully");

        Get.until((route) => route.isFirst);

        isloading.value = false;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      isloading.value = false;
      CustomSnackbar.showError("Error", e.toString());
      ColoredPrint.red(e.toString());
    }
  }

  @override
  void onClose() {
    nameController.dispose();
    avnueController.dispose();
    emailController.forEach((element) {
      element.dispose();
    });
    socialLinkController.forEach((element) {
      element.dispose();
    });
    descriptionController.dispose();
    avenuePlaceController.dispose();
    pickedImages.forEach((element) {
      element.delete();
    });
    pickedVideo.forEach((element) {
      element.delete();
    });
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // nameController.dispose();
    // avnueController.dispose();
    // addressController.dispose();
    // emailController.forEach((element) {
    //   element.dispose();
    // });
    // socialLinkController.forEach((element) {
    //   element.dispose();
    // });
    // descriptionController.dispose();
    // googlemapfieldController.dispose();
    // pickedImages.forEach((element) {
    //   element.delete();
    // });
    // pickedVideo.forEach((element) {
    //   element.delete();
    // });
    super.dispose();
  }
}
