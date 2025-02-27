import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/controllers/otp_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/StyleConstants.dart';

class OtpScreen extends GetView<OtpController> {
  static const routeName = "OtpScreen";
  final _formKey = GlobalKey<FormState>();

  OtpScreen({super.key});

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
              : Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Please enter the 6-digit OTP sent to your Email',
                        textAlign: TextAlign.center,
                        style: TextConstants.bodySmall_black_bold(context),
                      ),
                      SizedBox(height: 6.h),
                      TextFormField(
                        // key: _formKey,
                        validator: (value) {
                          if (value!.isEmpty) {
                            return 'Please enter OTP';
                          } else if (value.length < 6) {
                            return 'Please enter valid OTP';
                          }
                          return null;
                        },
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
                            onPressed: () {
                              if (_formKey.currentState!.validate()) {
                                controller.isForgotPassword
                                    ? controller.submitOtpFromForgotPassword(
                                        email: Get.arguments['email'],
                                      )
                                    : controller.submitOtp(
                                        email: Get.arguments['email'],
                                      );
                              }
                            },
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
                                      if (controller.isResendEnabled.value) {
                                        controller.resendOtp(
                                          email: Get.arguments['email'],
                                        );
                                      }
                                    },
                                    child: Text(controller.isResendEnabled.value
                                        ? 'Resend OTP'
                                        : 'Resend in ${controller.resendCooldown.value}s'),
                                  );
                          }),
                        ],
                      ),
                    ],
                  ),
                );
        }),
      ),
    );
  }
}
