import 'dart:io';

import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:event_planner_light/view/screens/OtpScreen.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Signupcontroller extends GetxController {
  @override
  void onInit() async {
    phoneNumberController.text = '+965';
    super.onInit();
  }

  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final bioController = TextEditingController();
  RxBool isEvetPlanner = false.obs;

  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  RxDouble lat = 0.0.obs;
  RxDouble lng = 0.0.obs;

  RxBool isloading = false.obs;
  // final ImagePicker _picker = ImagePicker();
  var pickedFiles = <File>[].obs;

  //  Future<void> pickImage() async {
  //   try {
  //     final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
  //     if (file != null) {
  //       pickedImages.add(File(file.path));
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to pick image or video: $e');
  //   }
  // }

  Future<void> pickADocument() async {
    try {
      pickedFiles.length >= 4
          ? throw Exception('You can only pick 4 files')
          : null;
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'doc'],
      );
      if (result != null) {
        PlatformFile file = result.files.first;
        pickedFiles.add(File(file.path!));
      } else {
        Get.snackbar('No file selected', 'No document was picked.');
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick document: $e');
    }
  }

  // Future<void> updateDocumentName(int index, String newName) async {
  //   File file = pickedFiles[index];

  //   // Construct the new file path by keeping the parent directory same
  //   String newPath = file.parent.path + '/' + newName;

  //   try {
  //     // Rename the file on the filesystem
  //     File renamedFile = await file.rename(newPath);

  //     // Update the file in the pickedFiles list
  //     pickedFiles[index] = renamedFile;

  //     // Refresh the observable list to notify listeners
  //     pickedFiles.refresh();
  //   } catch (e) {
  //     print('Error renaming file: $e');
  //   }
  // }

  // Future<void> takePhotoOrVideo() async {
  //   try {
  //     final XFile? file = await _picker.pickImage(source: ImageSource.camera);
  //     if (file != null) {
  //       pickedFiles.add(File(file.path));
  //     }
  //   } catch (e) {
  //     Get.snackbar('Error', 'Failed to take photo or video: $e');
  //   }
  // }

  void removeFile(File file) {
    pickedFiles.remove(file);
  }

  // void removeimage(File file) {
  //   pickedImages.remove(file);
  // }

  void signup() async {
    isloading.value = true;
    try {
      final response = await authService.signup(
        isEventPlanner: isEvetPlanner.value,
        fullName: fullNameController.value.text,
        email: emailController.value.text,
        bio: bioController.value.text,
        phoneNumber: phoneNumberController.value.text,
        documents: pickedFiles,
        passCnfrm: confirmPasswordController.value.text,
        password: passwordController.value.text,
      );

      if (response != null) {
        isloading.value = false;
        CustomSnackbar.showSuccess(
            'Success', 'Signup successful Please Verify OTP');
        Get.offAllNamed(OtpScreen.routeName, arguments: {
          'email': emailController.value.text,
          // "isForgotPassword": false
        });
      } else {
        isloading.value = false;
      }
    } catch (e) {
      isloading.value = false;
      CustomSnackbar.showError('Error', e.toString());
    }
  }

  @override
  void onClose() {
    fullNameController.dispose();
    emailController.dispose();
    phoneNumberController.dispose();
    passwordController.dispose();
    bioController.dispose();

    confirmPasswordController.dispose();
    super.onClose();
  }
}
