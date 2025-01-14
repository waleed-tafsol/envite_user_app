import 'package:envite_user_app/utils/assets.dart';
import 'package:envite_user_app/utils/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.kScaffoldBackgroundColor,
      body: Padding(
        padding: EdgeInsets.only(left: 31.w, right: 31.w),
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: 85.h,
              ),
              Text("Welcome to Invites App",
                  style: TextStyle(
                      fontSize: 18.sp,
                      fontWeight: FontWeight.bold,
                      color: AppColors.berkeleyBlue)),
              SizedBox(
                height: 14.h,
              ),
              Text("Create your account and get access to events in Kuwait",
                  style: TextStyle(
                      fontSize: 11.sp,
                      fontWeight: FontWeight.normal,
                      color: AppColors.berkeleyBlue)),
              SizedBox(
                height: 48.h,
              ),

              TextFormField(
                  decoration: InputDecoration(
                hintText: "Full Name",
                prefixIcon: SvgPicture.asset(
                  SvgAssets.profile2,
                  fit: BoxFit.scaleDown,
                  width: 24.w,
                ),
              )),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                  decoration: InputDecoration(
                hintText: "Phone Number",
                prefixIcon: SvgPicture.asset(
                  SvgAssets.phone,
                  fit: BoxFit.scaleDown,
                  width: 24.w,
                ),
                suffixIcon: SvgPicture.asset(
                  SvgAssets.flag,
                  fit: BoxFit.scaleDown,
                  width: 24.w,
                ),
              )),
              SizedBox(
                height: 10.h,
              ),
              TextFormField(
                  decoration: InputDecoration(
                hintText: "password",
                prefixIcon: SvgPicture.asset(
                  SvgAssets.lock,
                  fit: BoxFit.scaleDown,
                  width: 24.w,
                ),
                suffixIcon: SvgPicture.asset(
                  SvgAssets.eye,
                  fit: BoxFit.scaleDown,
                  width: 24.w,
                ),
              )),
              // SizedBox(
              //   height: 10.h,
              // ),
              Row(
                children: [
                  Transform.scale(
                      scale: 0.4,
                      child: Switch(
                          padding: EdgeInsets.zero,
                          value: false,
                          onChanged: (_) {})),
                  // SizedBox(
                  //   width: 13.w,
                  // ),
                  Text("I’m an event Planner!",
                      style: TextStyle(
                          fontSize: 12.sp,
                          color: Color(0xff457B9D),
                          fontWeight: FontWeight.bold)),
                ],
              ),

              SizedBox(
                height: 60.h,
              ),
              InkWell(
                onTap: () {
                  // BottomSheetManager.congratulationsAccountCreated(context);
                },
                child: Container(
                  height: 60.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                          fontSize: 16.sp, fontWeight: FontWeight.bold),
                    ),
                  ),
                ),
              ),
              // Padding(
              //     padding: EdgeInsets.symmetric(vertical: 4.h),
              //     child: Image.asset(Assets.or)),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 4.w),
              //   height: 7.h,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     border: Border.all(width: 1),
              //     color: AppColors.kSignInWithGoogle,
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Image.asset(Assets.google),
              //       Text(
              //         "Sign Up with Google",
              //         style: Theme.of(context).textTheme.headlineMedium,
              //       ),
              //       const SizedBox(),
              //     ],
              //   ),
              // ),
              // SizedBox(
              //   height: 2.h,
              // ),
              // Container(
              //   padding: EdgeInsets.symmetric(horizontal: 4.w),
              //   height: 7.h,
              //   width: double.infinity,
              //   decoration: BoxDecoration(
              //     border: Border.all(width: 1),
              //     color: AppColors.kSignInWithGoogle,
              //     borderRadius: BorderRadius.circular(10),
              //   ),
              //   child: Row(
              //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //     children: [
              //       Image.asset(Assets.apple),
              //       Text(
              //         "Sign Up with Apple",
              //         style: Theme.of(context).textTheme.headlineMedium,
              //       ),
              //       const SizedBox(),
              //     ],
              //   ),
              // ),
              SizedBox(
                height: 12.h,
              ),
              InkWell(
                // onTap: () => terms_0f_services_Dialog(context),
                child: RichText(
                  text: TextSpan(
                    text: 'By Sign In, I accept the ',
                    style: TextStyle(color: Color(0xff457B9D), fontSize: 11.sp),
                    children: const <TextSpan>[
                      TextSpan(
                        text: 'Terms of Service',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      TextSpan(
                        text: ' and have read ',
                        style: TextStyle(

                            // fontSize: 10.sp,
                            ),
                      ),
                      TextSpan(
                        text: 'Privacy Policy',
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
            ],
          ),
        ),
      ),
    );
  }
}
