import 'package:dotted_border/dotted_border.dart';
import 'package:event_planner_light/constants/StyleConstants.dart';
import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/controllers/CreateProfileController.dart';
import 'package:event_planner_light/view/screens/Drawer/DrawerScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfileForUser extends GetView<Createprofilecontroller> {
  static const routeName = 'EditProfileForUser';
  const EditProfileForUser({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Edit Profile '),
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
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Personal Info",
                  style: TextConstants.bodyLargeBlackBold(context),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Edit Name"),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Edit Email"),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Edit Phone Number"),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 20.h,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: null, // Set this
                  expands: true,
                  decoration: InputDecoration(hintText: "Edit Bio"),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: StylesConstants.elevated_b_redBack_whiteFore,
                    onPressed: () {
                      Get.offNamed(DrawerScreen.routeName);
                    },
                    child: Text("Edit Profile")),
              ),
              SizedBox(
                height: 1.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
