import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:event_planner_light/view/screens/OtpScreen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class Signupcontroller extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }
  final fullNameController = TextEditingController();
  final emailController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final passwordController = TextEditingController();
  final confirmPasswordController = TextEditingController();
  final bioController = TextEditingController();
  RxBool isEventPlanner = true.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isConfirmPasswordVisible = false.obs;
  RxDouble lat = 0.0.obs;
  RxDouble lng = 0.0.obs;

  RxBool isloading = false.obs;
  void signup() async {
    isloading.value = true;
    try {
      final response = await authService.signup(
        fullName: fullNameController.value.text,
        email: emailController.value.text,
        // bio: bioController.value.text,
        phoneNumber: phoneNumberController.value.text,
        // documents: pickedFiles,
        // selectedCategories: selectedCategory.map((e) => e.slug).toList(),
        passCnfrm: confirmPasswordController.value.text,
        password: passwordController.value.text,
      );

      if (response != null) {
        isloading.value = false;
        CustomSnackbar.showSuccess('Success', 'Signup successful');
        Get.offAllNamed(OtpScreen.routeName, arguments: {
          'email': emailController.value.text,
          "isForgotPassword": false
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
