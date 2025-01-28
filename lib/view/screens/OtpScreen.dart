import 'dart:convert';

import 'package:event_planner_light/constants/ApiConstant.dart';
import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/controllers/otp_controller.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:event_planner_light/view/screens/SignIn/SignInScreen.dart';
import 'package:event_planner_light/view/screens/SignUp/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/StyleConstants.dart';

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
                      'Please enter the 6-digit OTP sent to your Email',
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
                              isForgotPassword:
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
                                            isForgotPassword: Get
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
