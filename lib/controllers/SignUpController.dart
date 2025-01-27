import 'dart:convert';
import 'dart:io';
import 'package:event_planner_light/constants/ApiConstant.dart';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/model/CatagoryModel.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:event_planner_light/view/screens/NavBar/NavBarScreen.dart';
import 'package:event_planner_light/view/screens/OtpScreen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class Signupcontroller extends GetxController {
  @override
  void onInit() async {
    await getcatagories();
    super.onInit();
  }

  // TextEditingControllers
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final bioController = TextEditingController();

  RxBool isEventPlanner = true.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  final ImagePicker _picker = ImagePicker();
  var pickedFiles = <File>[].obs;
  var pickedImages = <File>[].obs;

  // Additional variables
  RxDouble lat = 0.0.obs;
  RxDouble lng = 0.0.obs;
  RxList<CatagoryModel> categories = <CatagoryModel>[].obs;
  RxList<CatagoryModel> selectedCategory = <CatagoryModel>[].obs;

  RxBool isloading = false.obs;
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

  Future<void> pickADocument() async {
    try {
      FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['pdf', 'docx', 'txt', 'xlsx'],
      );

      if (result != null) {
        File pickedFile = File(result.files.single.path!);
        pickedFiles.add(pickedFile);
      } else {
        throw Exception('No file selected Please select a document');
      }
    } catch (e) {
      CustomSnackbar.showError('Error', 'Failed to pick document: $e');
    }
  }

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

  void removeimage(File file) {
    pickedImages.remove(file);
  }

  getcatagories() async {
    isloading.value = true;
    try {
      final response = await http.get(Uri.parse(ApiConstants.categories));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['data'];
        categories.value = data.map((e) => CatagoryModel.fromJson(e)).toList();
        isloading.value = false;
      } else {
        isloading.value = false;
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      isloading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  // signup
  void signup() async {
    isloading.value = true;
    try {
      final response = await authService.signup(
        fullName: fullNameController.value.text,
        email: emailController.value.text,
        bio: bioController.value.text,
        phoneNumber: phoneNumberController.value.text,
        selectedCategories: selectedCategory.map((e) => e.slug).toList(),
        passCnfrm: confirmPasswordController.value.text,
        password: passwordController.value.text,
      );

      if (response != null) {
        isloading.value = false;
        CustomSnackbar.showSuccess('Success', 'Signup successful');
        Get.offAllNamed(OtpScreen.routeName, arguments: {
          'email': emailController.value.text,
        });
      } else {
        isloading.value = false;
      }
    } catch (e) {
      isloading.value = false;
      CustomSnackbar.showError('Error', e.toString());
    }
  }

  // Login
  void login() async {
    isloading.value = true;
    try {
      await authService.login(
        email: fullNameController.value.text,
        password: passwordController.value.text,
      );
      isloading.value = false;
      CustomSnackbar.showSuccess('Success', 'Signup successful');
      Get.offAllNamed(NavBarScreen.routeName);
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
