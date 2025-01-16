import 'package:event_planner_light/controllers/Auth_services.dart';

import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:event_planner_light/view/screens/Drawer/DrawerScreen.dart';
import 'package:event_planner_light/view/screens/NavBar/NavBarScreen.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

class SignIncontroller extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  RxBool isEventPlanner = true.obs;
  RxBool isPasswordVisible = false.obs;
  RxBool isloading = false.obs;

  // Login
  Future<void> login() async {
    isloading.value = true;
    try {
      await authService.login(
        email: emailController.value.text,
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
    emailController.dispose();
    passwordController.dispose();
    super.onClose();
  }
}
