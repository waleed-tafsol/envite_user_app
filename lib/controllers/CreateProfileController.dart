import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class Createprofilecontroller extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController bioController = TextEditingController();
  TextEditingController priceController = TextEditingController();
  TextEditingController specialityController = TextEditingController();
  TextEditingController imageTitleController = TextEditingController();

  final ImagePicker _picker = ImagePicker();
  var pickedFiles = <File>[].obs;
  RxList<String> spacialities = <String>[].obs;

  Future<void> pickImageOrVideo() async {
    try {
      final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        pickedFiles.add(File(file.path));
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image or video: $e');
    }
  }

  Future<void> takePhotoOrVideo() async {
    try {
      final XFile? file = await _picker.pickImage(source: ImageSource.camera);
      if (file != null) {
        pickedFiles.add(File(file.path));
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to take photo or video: $e');
    }
  }

  void removeFile(File file) {
    pickedFiles.remove(file);
    print("function ontap");
  }
}
