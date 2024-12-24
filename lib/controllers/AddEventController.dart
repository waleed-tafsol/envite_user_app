import 'dart:convert';
import 'dart:io';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/AddEventsScreen/ConfirmOrAddMoreEvents.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_thumbnail_video/index.dart';
import 'package:get_thumbnail_video/video_thumbnail.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:path_provider/path_provider.dart';
import 'package:video_player/video_player.dart';
import '../constants/ApiConstant.dart';
import '../main.dart';
import '../model/CatagoryModel.dart';
import '../utills/ConvertDateTime.dart';

class AddEventController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    isloading.value = true;
    await getcatagories();
    isloading.value = false;
  }

  TextEditingController nameController = TextEditingController();
  TextEditingController avnueController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  List<TextEditingController> emailController =
      <TextEditingController>[TextEditingController()].obs;
  List<TextEditingController> socialLinkController =
      <TextEditingController>[TextEditingController()].obs;
  TextEditingController descriptionController = TextEditingController();
  RxList<CatagoryModel> categories = <CatagoryModel>[].obs;
  Rx<CatagoryModel?> selectedCategory = CatagoryModel().obs;
  final ImagePicker _picker = ImagePicker();
  RxBool isAddPastEvents = false.obs;
  RxBool isloading = true.obs;
  List<String> options = ['public', 'private', 'exclusive'];
  Rx<String?> selectedOption = Rx<String?>(null);
  RxList pickedImages = <File>[].obs;
  Rx<File?> pickedVideo = Rx<File?>(null);

  Rx<DateTime> selectedStartDate = DateTime.now().obs;
  Rx<DateTime> selectedEndDate = DateTime.now().obs;

  Rx<String> selectedStartTime = TimeOfDay.now().format(navigatorKey.currentContext!).obs;
  Rx<String> selectedEndTime = TimeOfDay.now().format(navigatorKey.currentContext!).obs;

  void removeImage(File file) {
    pickedImages.remove(file);
  }

  Future<void> pickImage() async {
    try {
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

  final TextEditingController googlemapfieldController =
      TextEditingController();
  String? lat;
  String? lng;

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

  Future<void> pickVideo() async {
    try {
      final XFile? file = await _picker.pickVideo(source: ImageSource.gallery);
      if (file != null) {
        pickedVideo.value = File(file.path);
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
    final url = Uri.parse(ApiConstants.addEvent);

    try {
      isloading.value = true;

      final request = http.MultipartRequest('POST', url);

      request.fields['name'] = nameController.value.text;
      request.fields['isPastEvent'] = isAddPastEvents.value.toString();
      request.fields['eventType'] = selectedOption.value ?? "";

      request.fields['latitude'] = lat.toString();
      request.fields['longitude'] = lng.toString();
      for (int i = 0; i < emailController.length; i++) {
        request.fields['email[$i]'] = emailController[i].text;
      }
      for (int i = 0; i < socialLinkController.length; i++) {
        request.fields['socialLinks[$i]'] = socialLinkController[i].text;
      }
      request.fields['description'] = descriptionController.value.text;
      request.fields['avenue'] = avnueController.value.text;
      request.fields['address'] = addressController.value.text;
      request.fields['categorySlug'] = selectedCategory.value?.slug ?? "";

      request.fields['startDate'] =
          formatToIso8601WithTimezone(selectedStartDate.value);
      request.fields['endDate'] =
          formatToIso8601WithTimezone(selectedEndDate.value);

      request.fields['startTime'] = selectedStartTime.value;
      request.fields['endTime'] = selectedEndTime.value;

      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ${authService.authToken}',
      });
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        CustomSnackbar.showSuccess(
            'Success', responseData["message"] ?? "event created successfully");
        isloading.value = false;
        Get.offAndToNamed(ConfirmorAddMoreEvents.routeName);

        return responseData;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      isloading.value = false;
      CustomSnackbar.showError("Error", e.toString());
    }
  }
}
