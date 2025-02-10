import 'package:dotted_border/dotted_border.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/controllers/SignUpController.dart';
import 'package:event_planner_light/view/screens/cms/CmsScreen.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/TextConstant.dart';
import '../../../constants/colors_constants.dart';

class SignUpScreen extends GetView<Signupcontroller> {
  SignUpScreen({super.key});

  static const routeName = "SignUpScreen";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.kScaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "welcome to Invites App",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Obx(() {
            return controller.isloading.value
                ? const Center(child: CircularProgressIndicator())
                : SingleChildScrollView(
                    child: Form(
                      key: formKey,
                      child: Column(
                        children: [
                          Text(
                            "Create your account and get access to events in Kuwait",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          // TextFormField(
                          //     controller: controller.fullNameController,
                          //     validator: (value) {
                          //       if (value == null || value.isEmpty)
                          //         return 'Full Name cannot be empty';
                          //       return null;
                          //     },
                          //     decoration: const InputDecoration(
                          //       hintText: "Full Name",
                          //       prefixIcon: Icon(Icons.person_2_outlined),
                          //     )),
                          // SizedBox(
                          //   height: 2.h,
                          // ),
                          TextFormField(
                              controller: controller.fullNameController,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Full Name cannot be empty';
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: "Full Name",
                                prefixIcon: Icon(Icons.person_2_outlined),
                              )),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextFormField(
                              controller: controller.phoneNumberController,
                              keyboardType: TextInputType.phone,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Phone Number cannot be empty';
                                if (!GetUtils.isPhoneNumber(value))
                                  return 'Enter a valid phone number';
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: "Phone Number",
                                prefixIcon: Icon(Icons.phone_android_sharp),
                              )),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextFormField(
                              controller: controller.emailController,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Email cannot be empty';
                                if (!GetUtils.isEmail(value))
                                  return 'Enter a valid Email';
                                return null;
                              },
                              decoration: const InputDecoration(
                                hintText: "Email",
                                prefixIcon: Icon(Icons.email_outlined),
                              )),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextFormField(
                              controller: controller.passwordController,
                              validator: (value) {
                                if (value == null || value.isEmpty)
                                  return 'Password cannot be empty';

                                return null;
                              },
                              obscureText: !controller.isPasswordVisible.value,
                              decoration: InputDecoration(
                                  hintText: "password",
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(
                                        controller.isPasswordVisible.value
                                            ? Icons.visibility_outlined
                                            : Icons.visibility_off_outlined),
                                    onPressed: () {
                                      controller.isPasswordVisible.value =
                                          !controller.isPasswordVisible.value;
                                    },
                                  ))),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextFormField(
                              controller: controller.confirmPasswordController,
                              validator: (value) {
                                if (value == null || value.isEmpty) {
                                  return 'Password cannot be empty';
                                } else if (value !=
                                    controller.passwordController.text) {
                                  return 'Password does not match';
                                } else {
                                  return null;
                                }
                              },
                              obscureText:
                                  !controller.isConfirmPasswordVisible.value,
                              decoration: InputDecoration(
                                  hintText: "Confirm password",
                                  prefixIcon: Icon(
                                    Icons.lock_outline,
                                  ),
                                  suffixIcon: IconButton(
                                    icon: Icon(controller
                                            .isConfirmPasswordVisible.value
                                        ? Icons.visibility_outlined
                                        : Icons.visibility_off_outlined),
                                    onPressed: () {
                                      controller
                                              .isConfirmPasswordVisible.value =
                                          !controller
                                              .isConfirmPasswordVisible.value;
                                    },
                                  ))),
                          k1hSizedBox,
                          Row(
                            children: [
                              Obx(() {
                                return Switch(
                                    activeColor: Colors.green,
                                    value: controller.isEvetPlanner.value,
                                    onChanged: (value) {
                                      controller.isEvetPlanner.value = value;
                                    });
                              }),
                              Text(
                                "Register as Event Planner",
                                style: TextStyle(
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                          Obx(() {
                            return controller.isEvetPlanner.value
                                ? Column(
                                    children: [
                                      k1hSizedBox,
                                      SizedBox(
                                        height: 20.h,
                                        child: TextFormField(
                                          controller: controller.bioController,
                                          validator: (value) {
                                            if (value == null || value.isEmpty)
                                              return 'Bio cannot be empty';
                                            return null;
                                          },
                                          keyboardType: TextInputType.multiline,
                                          textAlignVertical:
                                              TextAlignVertical.top,

                                          maxLines: null,
                                          // Set this
                                          expands: true,
                                          decoration:
                                              InputDecoration(hintText: "Bio"),
                                        ),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            "Verification Document",
                                            style: TextConstants
                                                .bodyLargeBlackBold(context),
                                          ),
                                          controller.pickedFiles.length < 4
                                              ? IconButton(
                                                  onPressed: () {
                                                    controller.pickADocument();
                                                  },
                                                  icon: Icon(Icons.add))
                                              : SizedBox()
                                        ],
                                      ),
                                      controller.pickedFiles.isEmpty
                                          ? Align(
                                              alignment: Alignment.centerLeft,
                                              child: InkWell(
                                                onTap: () {
                                                  controller.pickADocument();
                                                },
                                                child: DottedBorder(
                                                  dashPattern: [5],
                                                  color:
                                                      AppColors.kBluedarkShade,
                                                  borderType: BorderType.RRect,
                                                  radius: Radius.circular(5),
                                                  child: SizedBox(
                                                    height: 10.h,
                                                    width: double.infinity,
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Icon(
                                                          size: 5.h,
                                                          Icons.image_outlined,
                                                          color: AppColors
                                                              .kBluedarkShade,
                                                        ),
                                                        Text(
                                                          "Upload Document",
                                                          style: TextStyle(
                                                            fontSize: 14.sp,
                                                            color: AppColors
                                                                .kBluedarkShade,
                                                            decoration:
                                                                TextDecoration
                                                                    .underline,
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            )
                                          : ListView.builder(
                                              shrinkWrap: true,
                                              physics:
                                                  const NeverScrollableScrollPhysics(),
                                              itemCount:
                                                  controller.pickedFiles.length,
                                              itemBuilder: (context, index) {
                                                final file = controller
                                                    .pickedFiles[index];
                                                return Stack(
                                                  children: [
                                                    Container(
                                                      margin:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.h),
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            k5BorderRadius,
                                                        color: AppColors
                                                            .kBluedarkShade,
                                                      ),
                                                      width: double.infinity,
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 2.h,
                                                              horizontal: 4.w),
                                                      child: ClipRRect(
                                                          borderRadius:
                                                              k5BorderRadius,
                                                          child: Text(controller
                                                              .pickedFiles[
                                                                  index]
                                                              .path
                                                              .split('/')
                                                              .last)),
                                                    ),
                                                    Positioned(
                                                        right: 0,
                                                        top: 0,
                                                        bottom: 0,
                                                        child: IconButton(
                                                            icon: const Icon(
                                                              Icons.cancel,
                                                              color:
                                                                  Colors.white,
                                                            ),
                                                            onPressed: () {
                                                              controller
                                                                  .removeFile(
                                                                      file);
                                                            }))
                                                  ],
                                                );
                                              },
                                            ),
                                    ],
                                  )
                                : SizedBox();
                          }),

                          SizedBox(
                            height: 3.h,
                          ),
                          InkWell(
                            onTap: () {
                              FocusScope.of(context).unfocus();
                              if (formKey.currentState!.validate()) {
                                controller.signup();
                              }
                            },
                            child: Container(
                              height: 7.h,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: AppColors.kPrimaryColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: const Center(
                                child: Text(
                                  "Sign Up",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ),

                          SizedBox(
                            height: 2.h,
                          ),
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
                                      Get.toNamed(CmsScreen.routeName,
                                          arguments: true);
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
                  );
          }),
        ),
      ),
    );
  }

//   signupSuccessfull(BuildContext context) {
//     showModalBottomSheet(
//       context: context,
//       shape: const RoundedRectangleBorder(
//         borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
//       ),
//       backgroundColor: AppColors.kBluedarkShade,
//       builder: (BuildContext context) {
//         return SafeArea(
//           child: Padding(
//               padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
//               child: Column(
//                 children: [
//                   // const Spacer(),
//                   Text(
//                     'Congratulations!',
//                     textAlign: TextAlign.center,
//                     style: TextConstants.bodyMedium_white_bold(context),
//                   ),
//                   SizedBox(height: 2.h),
//                   SvgPicture.asset(SvgAssets.clapping),
//                   SizedBox(height: 2.h),
//                   Text(
//                     'Your account has been created successfully',
//                     textAlign: TextAlign.center,
//                     style: TextConstants.bodysmall_white_normal(context),
//                   ),
//                   SizedBox(height: 2.h),
//                   ElevatedButton(
//                     onPressed: () {
//                       controller.signup();
//                       // Get.toNamed(Confirmaccountscreen.routeName);
//                     },
//                     style: ElevatedButton.styleFrom(
//                       shape: RoundedRectangleBorder(
//                           borderRadius: BorderRadius.circular(5)),
//                       minimumSize: Size(double.infinity, 6.h),
//                       // primary: Colors.blueAccent, // Background color
//                     ),
//                     child: const Text('Sign In'),
//                   ),
//                 ],
//               )),
//         );
//       },
//     );
//   }
}
