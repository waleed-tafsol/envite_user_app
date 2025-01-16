import 'dart:convert';
import 'dart:io';
import 'package:event_planner_light/model/UserModel.dart';
import 'package:http/http.dart' as http;
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../constants/ApiConstant.dart';
import 'Auth_services.dart';

class EditProfileController extends GetxController {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  Rx<File?> pickedImage = Rx<File?>(null);
  Rx<File?> pickedFile = Rx<File?>(null);

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

  Future<void> pickADocument() async {
    // try {
    //   FilePickerResult? result = await FilePicker.platform.pickFiles(
    //       // allowedExtensions: ['pdf', 'docx', 'txt'],
    //       );
    //   if (result != null) {
    //     PlatformFile file = result.files.first;
    //     pickedFiles.add(File(file.path!));
    //   } else {
    //     Get.snackbar('No file selected', 'No document was picked.');
    //   }
    // } catch (e) {
    //   Get.snackbar('Error', 'Failed to pick document: $e');
    // }
  }

  Future<void> updateProfile() async {
    if (verifyfields()) {
      try {
        isloading.value = true;

        final request =
            http.MultipartRequest('PATCH', Uri.parse(ApiConstants.updateMe));

        request.fields['fullName'] = fullNameController.value.text;
        request.headers.addAll({
          'Content-Type': 'multipart/form-data',
          'Authorization': 'Bearer ${authService.authToken}',
        });
        final streamedResponse = await request.send();
        final response = await http.Response.fromStream(streamedResponse);

        if (response.statusCode == 200) {
          final jsonResponse = json.decode(response.body);
          final Map<String, dynamic> data = jsonResponse['data']["user"];
          authService.me.value = UserModel.fromJson(data);
          CustomSnackbar.showSuccess('Success', 'Profile Updated Successfully');
        } else {
          throw Exception('Failed to Update Profile');
        }
      } catch (e) {
        CustomSnackbar.showError('Error', e.toString());
      } finally {
        isloading.value = false;
      }
    }
  }

  bool verifyfields() {
    if (fullNameController.text.isEmpty &&
        phoneNumberController.text.isEmpty &&
        bioController.text.isEmpty) {
      CustomSnackbar.showError('Error', 'Please Enter SomeThing');
      return false;
    } else {
      return true;
    }
  }

  void removeFile() {
    pickedFile.value = null;
  }

  void removeimage() {
    pickedImage.value = null;
  }
}
