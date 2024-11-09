import 'package:event_planner_light/view/screens/Drawer/Screens/CreatePortfolioScreens/CreatePortfolioScreen.dart';
import 'package:event_planner_light/view/screens/SignIn/ForgotMyPasswordScreen.dart';
import 'package:event_planner_light/view/screens/SignUp/Widgets/Terms_of_services_dailog.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../constants/colors_constants.dart';

class SigninScreen extends StatelessWidget {
  const SigninScreen({super.key});
  static const routeName = "SigninScreen";

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
            child: SingleChildScrollView(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Create your account and get access to events in Kuwait",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                    hintText: "Phone Number",
                    prefixIcon: Icon(Icons.person_2_outlined),
                  )),
                  SizedBox(
                    height: 2.h,
                  ),
                  TextFormField(
                      decoration: const InputDecoration(
                          hintText: "password",
                          prefixIcon: Icon(
                            Icons.lock_outline,
                          ),
                          suffixIcon: Icon(Icons.visibility_off_outlined))),
                  SizedBox(
                    height: 2.h,
                  ),
                  Align(
                    alignment: Alignment.centerRight,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(ForgotMyPasswordEmailScreen.routeName);
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
                    onTap: () =>
                        Get.offAllNamed(CreatePortfolioScreen.routeName),
                    child: Container(
                      height: 7.h,
                      width: double.infinity,
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
                  SizedBox(
                    height: 2.h,
                  ),
                  // Padding(
                  //     padding: EdgeInsets.symmetric(vertical: 4.h),
                  //     child: Image.asset(Assets.or)),
                  // Container(
                  //   padding: EdgeInsets.symmetric(horizontal: 4.w),
                  //   height: 7.h,
                  //   width: double.infinity,
                  //   decoration: BoxDecoration(
                  //     color: AppColors.kSignInWithGoogle,
                  //     border: Border.all(width: 1),
                  //     borderRadius: BorderRadius.circular(10),
                  //   ),
                  //   child: Row(
                  //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //     children: [
                  //       Image.asset(Assets.google),
                  //       Text(
                  //         "Sign In with Google",
                  //         style: Theme.of(context).textTheme.headlineMedium,
                  //       ),
                  //       const SizedBox(),
                  //     ],
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 2.h,
                  // ),
                  // InkWell(
                  //   onTap: () {},
                  //   child: Container(
                  //     padding: EdgeInsets.symmetric(horizontal: 4.w),
                  //     height: 7.h,
                  //     width: double.infinity,
                  //     decoration: BoxDecoration(
                  //       color: AppColors.kSignInWithGoogle,
                  //       border: Border.all(width: 1),
                  //       borderRadius: BorderRadius.circular(10),
                  //     ),
                  //     child: Row(
                  //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //       children: [
                  //         Image.asset(Assets.apple),
                  //         Text(
                  //           "Sign In with Apple",
                  //           style: Theme.of(context).textTheme.headlineMedium,
                  //         ),
                  //         const SizedBox(),
                  //       ],
                  //     ),
                  //   ),
                  // ),
                  // SizedBox(
                  //   height: 2.h,
                  // ),
                  GestureDetector(
                    onTap: () {
                      terms_0f_services_Dialog(context);
                    },
                    child: RichText(
                      text: TextSpan(
                        text: 'By Sign In, I accept the ',
                        style: TextStyle(
                            color: AppColors.kBluedarkShade, fontSize: 14.sp),
                        children: const <TextSpan>[
                          TextSpan(
                            text: 'Terms of Service',
                            style: TextStyle(fontWeight: FontWeight.bold),
                          ),
                          TextSpan(
                            text: ' and have read ',
                            style: TextStyle(
                              color: AppColors.kBluedarkShade,
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
        ),
      ),
    );
  }
}
