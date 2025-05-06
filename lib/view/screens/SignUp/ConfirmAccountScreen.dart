import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/assets.dart';
import '../../../constants/colors_constants.dart';
import '../../widgets/BottomModelSheet.dart';

class Confirmaccountscreen extends StatelessWidget {
  const Confirmaccountscreen({super.key});
  static const routeName = "Confirmaccountscreen";

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
                  hintText: "My birthday",
                  prefixIcon: Icon(Icons.calendar_today_outlined),
                )),
                SizedBox(
                  height: 2.h,
                ),
                TextFormField(
                    decoration: const InputDecoration(
                  hintText: "Username",
                  prefixIcon: Icon(Icons.person_2_outlined),
                )),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  children: [
                    Checkbox(value: false, onChanged: (_) {}),
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
                Padding(
                    padding: EdgeInsets.symmetric(vertical: 4.h),
                    child: Image.asset(Assets.or)),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  height: 7.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: AppColors.kSignInWithGoogle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(Assets.google),
                      Text(
                        "Sign Up with Google",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                Container(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  height: 7.h,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(width: 1),
                    color: AppColors.kSignInWithGoogle,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.asset(Assets.apple),
                      Text(
                        "Sign Up with Apple",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      const SizedBox(),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                RichText(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
