import 'package:dotted_border/dotted_border.dart';
import 'package:event_planner_light/controllers/SignUpController.dart';
import 'package:event_planner_light/model/CatagoryModel.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../constants/TextConstant.dart';
import '../../../constants/colors_constants.dart';
import '../../../constants/constants.dart';
import 'Widgets/Terms_of_services_dailog.dart';

class SignUpScreen extends GetView<Signupcontroller> {
  SignUpScreen({super.key});
  static const routeName = "SignUpScreen";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        forceMaterialTransparency: true,
        backgroundColor: AppColors.kScaffoldBackgroundColor,
        elevation: 0,
        centerTitle: true,
        title: Text(
          "welcome to Invites App",
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 31.w, vertical: 10.h),
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
                              style: TextStyle(
                                  fontSize: 11.sp,
                                  color: AppColors.kBerkeleyBlue),
                            ),
                            SizedBox(
                              height: 48.h,
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
                                  if (value == null || value.isEmpty) {
                                    return 'Full Name cannot be empty';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Full Name",
                                  prefixIcon: Icon(Icons.person_2_outlined),
                                )),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextFormField(
                                controller: controller.phoneNumberController,
                                keyboardType: TextInputType.phone,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Phone Number cannot be empty';
                                  }
                                  if (!GetUtils.isPhoneNumber(value)) {
                                    return 'Enter a valid phone number';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Phone Number",
                                  prefixIcon: Icon(Icons.phone_android_sharp),
                                )),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextFormField(
                                controller: controller.emailController,
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Email cannot be empty';
                                  }
                                  if (!GetUtils.isEmail(value)) {
                                    return 'Enter a valid Email';
                                  }
                                  return null;
                                },
                                decoration: const InputDecoration(
                                  hintText: "Email",
                                  prefixIcon: Icon(Icons.email_outlined),
                                )),
                            SizedBox(
                              height: 10.h,
                            ),
                            TextFormField(
                                controller: controller.passwordController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Password cannot be empty';
                                  }

                                  return null;
                                },
                                obscureText:
                                    !controller.isPasswordVisible.value,
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
                              height: 10.h,
                            ),
                            TextFormField(
                                controller:
                                    controller.confirmPasswordController,
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
                                        controller.isConfirmPasswordVisible
                                                .value =
                                            !controller
                                                .isConfirmPasswordVisible.value;
                                      },
                                    ))),

                            SizedBox(
                              height: 10.h,
                            ),
                            ListTile(
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                              tileColor: AppColors.kTextfieldColor,
                              leading: const Icon(
                                Icons.group_work_outlined,
                                color: AppColors.kPrimaryColor,
                              ),
                              trailing: const Icon(Icons.arrow_downward_rounded,
                                  color: AppColors.kPrimaryColor),
                              title: DropdownButton<CatagoryModel?>(
                                // value: controller.selectedCategory.value,
                                hint: Text("Select Category",
                                    style:
                                        Theme.of(context).textTheme.bodySmall!),
                                items: controller.categories.map((category) {
                                  return DropdownMenuItem<CatagoryModel>(
                                    value: category,
                                    onTap: () {
                                      controller.selectedCategory.add(category);
                                    },
                                    child: Text(
                                      category.name?.en ?? 'Unknown',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodySmall!,
                                    ),
                                  );
                                }).toList(),

                                onChanged: (CatagoryModel? newValue) {
                                  // controller.selectedCategory.value = newValue;
                                },
                              ),
                            ),
                            Obx(
                              () => Wrap(
                                spacing: 8,
                                runSpacing: 8,
                                children: controller.selectedCategory
                                    .map(
                                      (category) => Chip(
                                        label: Text(category.name?.en ?? ""),
                                        // deleteIcon: const Icon(Icons.close),
                                        onDeleted: () {
                                          // Remove the category from the selected list
                                          controller.selectedCategory
                                              .remove(category);
                                        },
                                      ),
                                    )
                                    .toList(),
                              ),
                            ),

                            SizedBox(
                              height: 30.h,
                            ),
                            SizedBox(
                              height: 150.h,
                              child: TextFormField(
                                controller: controller.bioController,
                                validator: (value) {
                                  if (value == null || value.isEmpty) {
                                    return 'Bio cannot be empty';
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.multiline,
                                textAlignVertical: TextAlignVertical.top,

                                maxLines: null, // Set this
                                expands: true,
                                decoration: InputDecoration(hintText: "Bio"),
                              ),
                            ),
                            SizedBox(
                              height: 10.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  "Verification Document",
                                  style:
                                      TextConstants.bodyLargeBlackBold(context),
                                ),
                                IconButton(
                                    onPressed: () {
                                      controller.pickADocument();
                                    },
                                    icon: Icon(Icons.add))
                              ],
                            ),

                            Obx(() {
                              if (controller.pickedFiles.isEmpty) {
                                return const SizedBox();
                              }
                              return ListView.builder(
                                shrinkWrap: true,
                                physics: const NeverScrollableScrollPhysics(),
                                itemCount: controller.pickedFiles.length,
                                itemBuilder: (context, index) {
                                  final file = controller.pickedFiles[index];
                                  return Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      Stack(
                                        children: [
                                          Container(
                                            height: 50.h,
                                            decoration: BoxDecoration(
                                              borderRadius: k5BorderRadius,
                                              color: AppColors.kBlueLightShade,
                                            ),
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 22.h,
                                                horizontal: 30.w),
                                            child: Text(
                                              file.path.split('/').last,
                                              style: TextStyle(
                                                  color: Colors.black),
                                            ),
                                          ),
                                          Positioned(
                                              right: 0,
                                              top: 0,
                                              child: InkWell(
                                                onTap: () {
                                                  controller.removeFile(file);
                                                },
                                                child: Icon(
                                                  Icons.cancel,
                                                  color: Colors.black,
                                                ),
                                              )

                                              // IconButton(
                                              //     icon: const Icon(
                                              //       Icons.cancel,
                                              //       color: Colors.black,
                                              //     ),
                                              //     onPressed: () {
                                              //       controller.removeFile(file);
                                              //     })
                                              )
                                        ],
                                      ),
                                      SizedBox(
                                        height: 10.h,
                                      ),
                                      TextFormField(
                                        decoration: InputDecoration(
                                            hintText: "Description"),
                                      ),
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                    ],
                                  );
                                },
                              );
                            }),
                            SizedBox(
                              height: 1.h,
                            ),
                            Align(
                              alignment: Alignment.centerLeft,
                              child: InkWell(
                                onTap: () {
                                  controller.pickADocument();
                                },
                                child: DottedBorder(
                                  dashPattern: [5],
                                  color: AppColors.kBluedarkShade,
                                  borderType: BorderType.RRect,
                                  radius: Radius.circular(5),
                                  child: SizedBox(
                                    height: 100.h,
                                    width: double.infinity,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          size: 40.h,
                                          Icons.image_outlined,
                                          color: AppColors.kBluedarkShade,
                                        ),
                                        Text(
                                          "Upload Document",
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: AppColors.kBluedarkShade,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),

                            SizedBox(
                              height: 15.h,
                            ),
                            InkWell(
                              onTap: () {
                                if (formKey.currentState!.validate()) {
                                  if (controller.selectedCategory.isEmpty) {
                                    CustomSnackbar.showError(
                                        'Error', 'Select a category');
                                  } else {
                                    controller.signup();
                                  }
                                }
                              },
                              child: Container(
                                height: 60.h,
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
                              height: 10.h,
                            ),
                            InkWell(
                              onTap: () => terms_0f_services_Dialog(context),
                              child: RichText(
                                text: TextSpan(
                                  text: 'By Sign In, I accept the ',
                                  style: TextStyle(
                                      color: AppColors.kBluedarkShade,
                                      fontSize: 14.sp),
                                  children: const <TextSpan>[
                                    TextSpan(
                                      text: 'Terms of Service',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: ' and have read ',
                                      style: TextStyle(

                                          // fontSize: 10.sp,
                                          ),
                                    ),
                                    TextSpan(
                                      text: 'Privacy Policy',
                                      style: TextStyle(
                                          fontWeight: FontWeight.bold),
                                    ),
                                    TextSpan(
                                      text: '.',
                                      style: TextStyle(color: Colors.black),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    );
            }),
          ),
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
