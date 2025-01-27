import 'package:event_planner_light/view/screens/SignIn/SignInScreen.dart';
import 'package:event_planner_light/view/screens/SignUp/SignUpScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/assets.dart';
import '../../constants/colors_constants.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({super.key});
  static const routeName = "auth_screen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F8EF),
      body: PopScope(
        canPop: false,
        child: Stack(
          children: [
            Positioned(
                bottom: 0,
                child: SvgPicture.asset(
                  SvgAssets.splash_vector,
                  width: 435.w,
                )),
            Positioned(
              top: 105.h,
              child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: SvgPicture.asset(
                    SvgAssets.envite_logo,
                    width: 170.w,
                  )),
            ),
            Positioned(
              top: 165.h,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: RichText(
                  text: TextSpan(
                    text: '',
                    style: TextStyle(
                        color: Color(0xff1D3557),
                        height: 1.55,
                        fontSize: 64.sp),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Create event \n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'and ',
                        style: TextStyle(color: Color(0xff1D3557)
                            // fontSize: 10.sp,
                            ),
                      ),
                      TextSpan(
                        text: 'invite\n',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: 'people ',
                        style: TextStyle(color: Color(0xff1D3557)
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
              bottom: 265.h,
              right: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: InkWell(
                  onTap: () => Get.toNamed(SigninScreen.routeName),
                  child: Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Center(
                      child: Text(
                        "Sign In",
                        style: TextStyle(
                            fontSize: 16.sp,
                            fontWeight: FontWeight.bold,
                            color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 190.h,
              right: 0,
              left: 0,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 32.w),
                child: InkWell(
                  onTap: () => Get.toNamed(SignUpScreen.routeName),
                  child: Container(
                    height: 60.h,
                    decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4.r),
                    ),
                    child: Center(
                      child: Text(
                        "Create an account",
                        style: TextStyle(
                            fontSize: 16.sp,
                            color: Color(0xff457B9D),
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                ),
              ),
            ),
            // Positioned(
            //   bottom: 145.h,
            //   child: Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 32.w),
            //       child: SvgPicture.asset(
            //         SvgAssets.or,
            //         width: 369.w,
            //       )),
            // ),
            // Positioned(
            //   bottom: 115.h,
            //   right: 0,
            //   left: 0,
            //   child: Center(
            //     child: Padding(
            //       padding: EdgeInsets.symmetric(horizontal: 4.w),
            //       child: GestureDetector(
            //           // onTap: () => Get.offAndToNamed(DrawerScreen.routeName),
            //           child: Text(
            //         "Start As A Guest",
            //         style: TextStyle(
            //             fontSize: 14.sp,
            //             color: Color(0xff1D3557),
            //             fontWeight: FontWeight.w600),
            //       )),
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
