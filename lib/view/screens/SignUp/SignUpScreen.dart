import 'package:event_planner_light/view/widgets/BottomModelSheet.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/colors_constants.dart';
import 'Widgets/Terms_of_services_dailog.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static const routeName = "SignUpScreen";

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
          child: SingleChildScrollView(
            child: Column(
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
                  hintText: "Full Name",
                  prefixIcon: Icon(Icons.person_2_outlined),
                )),
                SizedBox(
                  height: 2.h,
                ),
                TextFormField(
                    decoration: const InputDecoration(
                  hintText: "Phone Number",
                  prefixIcon: Icon(Icons.phone_android_sharp),
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
                Row(
                  children: [
                    Switch(value: true, onChanged: (_) {}),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text(
                      "I’m an event Planner!",
                      style:
                          Theme.of(context).textTheme.headlineMedium!.copyWith(
                                decoration: TextDecoration.underline,
                              ),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                ListTile(
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10)),
                  tileColor: AppColors.kTextfieldColor,
                  leading: const Icon(
                    Icons.group_work_outlined,
                    color: AppColors.kPrimaryColor,
                  ),
                  title: Text(
                    "Category of events",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  trailing: const Icon(
                    Icons.arrow_downward_rounded,
                    color: AppColors.kPrimaryColor,
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                InkWell(
                  onTap: () {
                    BottomSheetManager.congratulationsAccountCreated(context);
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
                            fontSize: 15, fontWeight: FontWeight.bold),
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
                  height: 2.h,
                ),
                InkWell(
                  onTap: () => terms_0f_services_Dialog(context),
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
    );
  }
}
