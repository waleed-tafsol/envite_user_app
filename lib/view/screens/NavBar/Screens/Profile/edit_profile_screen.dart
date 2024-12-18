import 'package:dotted_border/dotted_border.dart';
import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/assets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../constants/colors_constants.dart';
import '../../../../../controllers/EditProfileController.dart';

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
                ClipOval(
                    child: Image.asset(
                  height: 30.w,
                  width: 30.w,
                  fit: BoxFit.cover,
                  Assets.eventCanvas,
                )),
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
              SizedBox(
                height: 2.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Verification Document",
                    style: TextConstants.bodyLargeBlackBold(context),
                  ),
                  IconButton(
                      onPressed: () {
                        controller.pickADocument();
                      },
                      icon: Icon(Icons.add))
                ],
              ),
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
                    borderType: BorderType.RRect,
                    radius: Radius.circular(5),
                    child: SizedBox(
                      height: 20.h,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            size: 8.h,
                            Icons.image_outlined,
                            color: Colors.grey,
                          ),
                          Text(
                            "Upload Document",
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
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
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
