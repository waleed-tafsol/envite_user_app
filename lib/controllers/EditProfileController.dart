import 'dart:convert';
import 'dart:io';
import 'package:event_planner_light/model/UserModel.dart';
import 'package:http/http.dart' as http;
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:http_parser/http_parser.dart';
import 'package:mime/mime.dart';
import '../constants/ApiConstant.dart';
import '../utills/enums.dart';
import 'Auth_services.dart';

class EditProfileController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  Rx<File?> pickedImage = Rx<File?>(null);

  @override
  void onInit() async {
    fullNameController.text = authService.me.value?.fullName ?? "";
    phoneNumberController.text = authService.me.value?.phoneNumber ?? "";
    bioController.text = authService.me.value?.description ?? "";

    super.onInit();
  }

  RxBool isloading = false.obs;
  Future<void> pickImage() async {
    try {
      final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        pickedImage.value = File(file.path);
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image or video: $e');
    }
  }

  Future<void> updateProfile() async {
    if (verifyfields()) {
      try {
        isloading.value = true;

        final request =
            http.MultipartRequest('PATCH', Uri.parse(ApiConstants.updateMe));

        request.fields['fullName'] = fullNameController.value.text;
        request.fields['phoneNumber'] = phoneNumberController.value.text;
        authService.me.value!.role?.first == UserRoles.user.text
            ? null
            : request.fields['description'] = bioController.value.text;
        if (pickedImage.value != null) {
          final mimeType = lookupMimeType(pickedImage
              .value!.path); // Get MIME type based on the file extension
          final mediaType = mimeType != null
              ? MediaType.parse(mimeType)
              : MediaType('image', 'jpeg');

          var multipartFile = await http.MultipartFile.fromPath(
            'photo',
            pickedImage.value!.path,
            contentType: mediaType,
          );
          request.files.add(multipartFile);
        }
        request.headers.addAll({
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer ${authService.authToken}',
        });
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);

        final jsonResponse = json.decode(response.body);
        if (response.statusCode == 200) {
          final Map<String, dynamic> data = jsonResponse['data']["user"];
          authService.me.value = UserModel.fromJson(data);
          Get.back();
          CustomSnackbar.showSuccess('Success', 'Profile Updated Successfully');
        } else {
          throw Exception(jsonResponse['message']['error'][0]);
        }
      } catch (e) {
        CustomSnackbar.showError('Error', e.toString());
      } finally {
        isloading.value = false;
      }
    }
  }

  bool verifyfields() {
    if (fullNameController.text.isEmpty && phoneNumberController.text.isEmpty) {
      CustomSnackbar.showError('Error', 'Please Enter SomeThing');
      return false;
    } else {
      return true;
    }
  }

  // void removeFile() {
  //   pickedFile.value = null;
  // }

  void removeimage() {
    pickedImage.value = null;
  }
}
