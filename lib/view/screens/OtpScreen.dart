import 'dart:convert';
import 'package:event_planner_light/constants/ApiConstant.dart';
import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:event_planner_light/view/screens/SignIn/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../constants/StyleConstants.dart';
import 'SignIn/ForgotMyPasswordScreen.dart';

class OtpController extends GetxController {
  var otpCode = ''.obs;
  var isResendEnabled = true.obs;
  var isLoading = false.obs;
  var isResendOtpLoading = false.obs;
  var resendCooldown = 30.obs;
  var timerActive = false.obs;

  void updateOtp(String value) {
    otpCode.value = value;
  }

  Future<void> submitOtp({String? email, bool? isforgotpassword}) async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.verifyOtp),
        body: jsonEncode({
          "email": email ?? "",
          "code": otpCode.value,
          "fromForgotPassword": isforgotpassword ?? false
        }),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 201) {
        CustomSnackbar.showSuccess('Success', 'OTP Verified');
        if (isforgotpassword ?? false) {
          Get.offAllNamed(ForgotMyPasswordConfirmScreen.routeName, arguments: {
            "email": email,
            "otp": otpCode.value,
          });
        } else {
          Get.offAllNamed(SigninScreen.routeName);
        }
      } else {
        final errorData = jsonDecode(response.body);
        isLoading.value = false;
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      CustomSnackbar.showError(e.toString(), 'Failed to verify OTP: $e');
    }
  }

  Future<void> resendOtp({String? email, bool? isforgotpassword}) async {
    isLoading.value = true;
    if (isResendEnabled.value) {
      try {
        final response = await http.post(
          Uri.parse(ApiConstants.resendOtp),
          body: jsonEncode({
            "email": email ?? "",
            "fromForgotPassword": isforgotpassword ?? false
          }),
          headers: {
            "Content-Type": "application/json",
          },
        );
        if (response.statusCode == 201) {
          CustomSnackbar.showSuccess(
              'OTP Resent', 'A new OTP has been sent to your Email.');
        } else {
          isLoading.value = false;
          final errorData = jsonDecode(response.body);
          throw Exception(
              errorData["message"]["error"][0] ?? "An error occurred");
        }
        isLoading.value = false;
      } catch (e) {
        isLoading.value = false;
        CustomSnackbar.showError(e.toString(), 'Failed to verify OTP: $e');
      }

      // Start the cooldown timer
      startCooldown();
    }
  }

  void startCooldown() {
    isResendEnabled.value = false;
    resendCooldown.value = 30; // Reset cooldown to 30 seconds
    timerActive.value = true;

    // Start a timer to count down the cooldown
    Future.delayed(Duration(seconds: 1), countdown);
  }

  void countdown() {
    if (resendCooldown.value > 0) {
      resendCooldown.value--;
      Future.delayed(Duration(seconds: 1), countdown);
    } else {
      isResendEnabled.value = true;
      timerActive.value = false;
    }
  }
}

class OtpScreen extends GetView<OtpController> {
  static const routeName = "OtpScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        elevation: 0,
        automaticallyImplyLeading: true,
        title: Text(
          "Enter OTP",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Obx(() {
          return controller.isLoading.value
              ? Center(
                  child: CircularProgressIndicator(),
                )
              : Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      'Please enter the 6-digit OTP sent to your phone',
                      textAlign: TextAlign.center,
                      style: TextConstants.bodySmall_black_bold(context),
                    ),
                    SizedBox(height: 6.h),
                    TextField(
                      onChanged: controller.updateOtp,
                      maxLength: 6,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        labelText: 'OTP Code',
                        counterText: '',
                      ),
                    ),
                    SizedBox(height: 4.h),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ElevatedButton(
                          style: StylesConstants.elevated_b_redBack_whiteFore,
                          onPressed: () => controller.submitOtp(
                              email: Get.arguments['email'],
                              isforgotpassword:
                                  Get.arguments["isForgotPassword"]),
                          child: Text('Submit'),
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Obx(() {
                          return controller.isResendOtpLoading.value
                              ? Center(
                                  child: CircularProgressIndicator(),
                                )
                              : ElevatedButton(
                                  style: StylesConstants
                                      .elevated_b_redBack_whiteFore,
                                  onPressed: () {
                                    controller.isResendEnabled.value
                                        ? controller.resendOtp(
                                            email: Get.arguments['email'],
                                            isforgotpassword: Get
                                                .arguments["isForgotPassword"])
                                        : null;
                                  },
                                  child: Text(controller.isResendEnabled.value
                                      ? 'Resend OTP'
                                      : 'Resend in ${controller.resendCooldown.value}s'),
                                );
                        }),
                      ],
                    ),
                  ],
                );
        }),
      ),
    );
  }
}
