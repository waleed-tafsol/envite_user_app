import 'dart:convert';
import 'dart:io';

import 'package:event_planner_light/model/AdsModel.dart';
import 'package:event_planner_light/model/ads_list_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get_thumbnail_video/video_thumbnail.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

import '../constants/ApiConstant.dart';
import '../services/customPrint.dart';
import '../utills/ConvertDateTime.dart';
import '../utills/CustomSnackbar.dart';
import '../utills/aws_utills.dart';
import 'Auth_services.dart';

class AdsController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await getAllAds();
  }

  RxBool isLoading = true.obs;
  final ImagePicker _picker = ImagePicker();
  TextEditingController titleController = TextEditingController();
  Rx<DateTime?> selectedStartDate = Rx<DateTime?>(null);
  Rx<DateTime?> selectedEndDate = Rx<DateTime?>(null);
  List<TextEditingController> tagsController =
      <TextEditingController>[TextEditingController()].obs;
  Rx<File?> selectedImage = Rx<File?>(null);

  clearData() {
    selectedImage.value = null;
    selectedEndDate.value = null;
    selectedStartDate.value = null;
    titleController.clear();
    tagsController = <TextEditingController>[TextEditingController()].obs;
  }

  bool validateCreateAds() {
    if (selectedImage.value == null) {
      CustomSnackbar.showError('Error', 'Kindly insert Image');
      return false;
    } else if (titleController.text.isEmpty) {
      CustomSnackbar.showError('Error', 'Kindly insert Ad Title');
      return false;
    } else if (tagsController[0].value.text == '') {
      CustomSnackbar.showError('Error', 'Kindly insert Tags');
      return false;
    } else if (selectedStartDate.value == null) {
      CustomSnackbar.showError('Error', 'Kindly insert Start Date');
      return false;
    } else if (selectedEndDate.value == null) {
      CustomSnackbar.showError('Error', 'Kindly insert End Date');
      return false;
    } else {
      return true;
    }
  }

  final List<String> chipLabels = [
    'all',
    'approved',
    'pending',
    'rejected',
    'completed'
  ];
  RxString selectedChip = 'all'.obs;
  RxList<AdsModel> adsList = <AdsModel>[].obs;
  Rx<AdsListResponse> adsListResponse = Rx<AdsListResponse>(AdsListResponse());

  setAddList(AdsListResponse adsListData) {
    adsList.clear();
    adsList.addAll(adsListData.data!);
  }

  Future<void> pickImage() async {
    try {
      final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        selectedImage.value = File(file.path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image or video: $e');
    }
  }

  Future<void> getAllAds() async {
    isLoading.value = true;

    try {
      final response = await http.post(Uri.parse(ApiConstants.getMyAds), body: {
        "status": selectedChip.value
        // "search": "event"
      }, headers: {
        'Authorization': 'Bearer ${authService.authToken}',
        // 'Content-Type': 'application/json',
      });
      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        // final List<dynamic> data = jsonResponse['data'];
        adsListResponse.value = AdsListResponse.fromJson(jsonResponse);
        setAddList(adsListResponse.value);
        isLoading.value = false;
      } else {
        isLoading.value = false;

        final errorData = jsonDecode(response.body);
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      isLoading.value = false;

      CustomSnackbar.showError('Error', e.toString());
    }
  }

  Future<void> createAdds() async {
    final url = Uri.parse(ApiConstants.addAds);

    try {
      isLoading.value = true;

      final request = http.MultipartRequest('POST', url);

      final mimeType = lookupMimeType(selectedImage.value!.path);
      final mediaType = mimeType != null
          ? MediaType.parse(mimeType)
          : MediaType('image', 'jpeg');

      var multipartFile = await http.MultipartFile.fromPath(
        'image',
        selectedImage.value!.path,
        contentType: mediaType,
      );
      request.files.add(multipartFile);

      if (tagsController.first.text.isNotEmpty || tagsController.length > 1) {
        for (int i = 0; i < tagsController.length; i++) {
          tagsController[i].text.isNotEmpty
              ? request.fields['tags[$i]'] = tagsController[i].text
              : null;
        }
      }

      request.fields['name'] = titleController.text;

      request.fields['startDate'] =
          formatToIso8601WithTimezone(selectedStartDate.value!);
      request.fields['endDate'] =
          formatToIso8601WithTimezone(selectedEndDate.value!);

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
        final AdsModel adsData = AdsModel.fromJson(responseData['data']);
        adsList.insert(0, adsData);
        print(adsList[0].name);
        isLoading.value = false;
        Get.back();
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      isLoading.value = false;
      CustomSnackbar.showError("Error", e.toString());
      ColoredPrint.red(e.toString());
    }
  }
}
