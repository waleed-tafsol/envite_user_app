import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/view/screens/NavBar/NavBarScreen.dart';
import 'package:event_planner_light/view/screens/SignIn/SignInScreen.dart';
import 'package:event_planner_light/view/screens/SignUp/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/assets.dart';
import '../../constants/colors_constants.dart';
import 'Drawer/DrawerScreen.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  static const routeName = "auth_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: Stack(
          children: [
            Positioned(
              bottom: 0,
              child: Image.asset(
                Assets.splash_vector,
                fit: BoxFit.cover,
              ),
            ),
            Positioned(
              top: 20.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: Image.asset(
                  Assets.app_Logo,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            Positioned(
              top: 30.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: RichText(
                  text: TextSpan(
                    text: '',
                    style: TextStyle(
                        color: Colors.black, height: 1.7, fontSize: 28.sp),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Create Event \n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: TextStyle(
                          color: Colors.black,
                          // fontSize: 10.sp,
                        ),
                      ),
                      TextSpan(
                        text: 'invite\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'people ',
                        style: TextStyle(
                          color: Colors.black,
                          // fontSize: 10.sp,
                        ),
                      ),
                      TextSpan(
                        text: 'faster!',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: '.',
                        style: TextStyle(color: Colors.black),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 25.h,
              right: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: InkWell(
                  onTap: () => Get.toNamed(SigninScreen.routeName),
                  child: Container(
                    height: 7.h,
                    // width: 95.w,
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: const Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 15, fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 15.h,
              right: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 4.w),
                child: InkWell(
                  onTap: () => Get.toNamed(SignUpScreen.routeName),
                  child: Container(
                    height: 7.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: Text(
                        "Create an account",
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.blue[300],
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 10.h,
              right: 0,
              left: 0,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: GestureDetector(
                      onTap: () => Get.offAndToNamed(NavBarScreen.routeName),
                      child: Text(
                        "Start As A Guest",
                        style: TextConstants.bodyMedium_black_normal(context),
                      )),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
