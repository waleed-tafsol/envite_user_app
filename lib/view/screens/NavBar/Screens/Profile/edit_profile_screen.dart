import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constants/colors_constants.dart';
import '../../../../../controllers/EditProfileController.dart';
import '../../../../../utills/enums.dart';

class EditProfileScreen extends GetView<EditProfileController> {
  static const routeName = 'EditProfileScreen';
  EditProfileScreen({super.key});

  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile '),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 1.h,
              ),
              Stack(children: [
                ClipOval(child: Obx(() {
                  return controller.pickedImage.value == null
                      ? Image.network(
                          authService.me.value?.photo ?? "",
                          height: 30.w,
                          width: 30.w,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) =>
                              Icon(Icons.error_outline),
                        )
                      : Image.file(
                          height: 30.w,
                          width: 30.w,
                          fit: BoxFit.cover,
                          controller.pickedImage.value!,
                        );
                })),
                Positioned(
                    right: 1.w,
                    child: InkWell(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: CircleAvatar(
                            backgroundColor: Colors.white,
                            child: SvgPicture.asset(SvgAssets.image_pen))))
              ]),
              SizedBox(height: 1.h),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Personal Info",
                  style: TextConstants.bodyLargeBlackBold(context),
                ),
              ),
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
              k2hSizedBox,
              TextFormField(
                  controller: controller.phoneNumberController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Phone Number cannot be empty';
                    }
                    return null;
                  },
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    hintText: "Phone Number",
                    prefixIcon: Icon(Icons.person_2_outlined),
                  )),
              k2hSizedBox,
              authService.me.value!.role?.first == UserRoles.user.text
                  ? k2hSizedBox
                  : SizedBox(
                      height: 20.h,
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

                        maxLines: null,
                        // Set this
                        expands: true,
                        decoration: InputDecoration(hintText: "Bio"),
                      ),
                    ),
              InkWell(
                onTap: () {
                  if (controller.verifyfields()) {
                    controller.updateProfile();
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
                              "Update Profile",
                              style: TextStyle(
                                  fontSize: 15, fontWeight: FontWeight.bold),
                            );
                    }),
                  ),
                ),
              ),
              k2hSizedBox,
            ],
          ),
        ),
      ),
    );
  }
}
