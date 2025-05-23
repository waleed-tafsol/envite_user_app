import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/view/screens/SignIn/ForgotMyPasswordScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors_constants.dart';
import '../../../controllers/SigninController.dart';
import '../cms/CmsScreen.dart';

class SigninScreen extends GetView<SignInController> {
  SigninScreen({super.key});

  static const routeName = "SigninScreen";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: true,
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          automaticallyImplyLeading: true,
          centerTitle: true,
          title: Text(
            "Welcome to Invites App",
            style: Theme.of(context).textTheme.headlineMedium,
          ),
        ),
        body: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Text(
                          "Login to your account and get access to events in Kuwait",
                          style: Theme.of(context).textTheme.bodySmall,
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        TextFormField(
                            controller: controller.emailController,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please enter your email";
                              } else if (!GetUtils.isEmail(value)) {
                                return "Please enter a valid email";
                              } else {
                                return null;
                              }
                            },
                            keyboardType: TextInputType.emailAddress,
                            decoration: const InputDecoration(
                              hintText: "Email",
                              prefixIcon: Icon(Icons.email_outlined),
                            )),
                        SizedBox(
                          height: 2.h,
                        ),
                        Obx(() {
                          return TextFormField(
                              controller: controller.passwordController,
                              obscureText: !controller.isPasswordVisible.value,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter a Password";
                                } else if (value.length < 6) {
                                  return "Password must be at least 6 characters long";
                                } else {
                                  return null;
                                }
                              },
                              decoration: InputDecoration(
                                  hintText: "password",
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                  ),
                                  suffixIcon: IconButton(
                                      onPressed: () {
                                        controller.isPasswordVisible.value =
                                            !controller.isPasswordVisible.value;
                                      },
                                      icon: Icon(controller
                                              .isPasswordVisible.value
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined))));
                        }),
                        k2hSizedBox,
                        Row(
                          children: [
                            Obx(() {
                              return Transform.scale(
                                scale: 0.7,
                                child: Switch(
                                    activeColor: Colors.green,
                                    value: controller.isEvetPlanner.value,
                                    onChanged: (value) {
                                      controller.isEvetPlanner.value = value;
                                    }),
                              );
                            }),
                            Text(
                              "I am an Event Planner",
                              style: TextStyle(
                                color: Colors.black,
                              ),
                            ),
                          ],
                        ),
                        k2hSizedBox,
                        Align(
                          alignment: Alignment.centerRight,
                          child: GestureDetector(
                            onTap: () {
                              Get.toNamed(
                                  ForgotMyPasswordEmailScreen.routeName);
                            },
                            child: Text(
                              "Forgot your password?",
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                    color: AppColors.kBluedarkShade,
                                    decoration: TextDecoration.underline,
                                  ),
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        InkWell(
                          onTap: () {
                            FocusScope.of(context).unfocus();
                            if (formKey.currentState!.validate()) {
                              controller.callLogin();
                              // Get.toNamed(DrawerScreen.routeName);
                            }
                          },
                          child: Container(
                            height: 7.h,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: AppColors.kPrimaryColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Center(
                              child: Obx(() {
                                return controller.isloading.value
                                    ? CircularProgressIndicator(
                                        color: Colors.white,
                                      )
                                    : Text(
                                        "Sign In",
                                        style: TextStyle(
                                            fontSize: 15,
                                            fontWeight: FontWeight.bold),
                                      );
                              }),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  // Spacer(),
                  RichText(
                    text: TextSpan(
                      text: 'By Sign In, I accept the ',
                      style: TextStyle(
                        color: AppColors.kBluedarkShade,
                        fontSize: 14.sp,
                      ),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'Terms of Service',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration
                                .underline, // Underline for visibility
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(CmsScreen.routeName,
                                  arguments: false);
                            },
                        ),
                        TextSpan(
                          text: ' and have read ',
                          style: TextStyle(
                            color: AppColors.kBluedarkShade,
                          ),
                        ),
                        TextSpan(
                          text: 'Privacy Policy',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            decoration: TextDecoration.underline,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Get.toNamed(CmsScreen.routeName, arguments: true);
                            },
                        ),
                        TextSpan(
                          text: '.',
                          style: TextStyle(color: Colors.black),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
