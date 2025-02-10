import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:event_planner_light/view/screens/NavBar/NavBarScreen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../view/screens/OtpScreen.dart';

class SignInController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isEvetPlanner = true.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isloading = false.obs;

  // Login
  Future<void> callLogin() async {
    isloading.value = true;
    try {
      final response = await authService.login(
        email: emailController.value.text,
        password: passwordController.value.text,
        isEvetPlanner: isEvetPlanner.value,
      );
      if (response["data"]["user"]["isVerified"] == true) {
        await authService.setToken(response["data"]["token"]);
      } else {
        Get.toNamed(OtpScreen.routeName, arguments: {
          'email': emailController.text,
        });
        throw Exception("Please verify your email to login");
      }
      CustomSnackbar.showSuccess('Success', 'Login successful');
      Get.offAllNamed(NavBarScreen.routeName);
    } catch (e) {
      CustomSnackbar.showError('Error', e.toString());
    } finally {
      isloading.value = false;
    }
  }

  @override
  void onClose() {
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
