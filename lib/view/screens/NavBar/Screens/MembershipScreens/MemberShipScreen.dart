import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/MembershipScreens/choose_plan_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../constants/constants.dart';

class MembershipScreen extends StatelessWidget {
  const MembershipScreen({super.key});
  static const routeName = "MemberShipScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Membership"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 29.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 62.h,
            ),
            Text(
              "Basic Plan (Free)",
              style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Color(0xff457B9D),
                  fontSize: 21.sp,
                  fontWeight: FontWeight.w600),
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Send Private invites",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 11.sp),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  "No",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 11.sp),
                ),
              ],
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "View exclusif events",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontSize: 11.sp),
                ),
                SizedBox(
                  width: 20.w,
                ),
                Text(
                  "No",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold, fontSize: 11.sp),
                ),
              ],
            ),
            SizedBox(
              height: 57.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 60.h,
              child: CustomOutlinedButton(
                contant: [
                  Text(
                    "Change Plan to premium",
                    style: TextStyle(
                      color: Color(0xff457B9D),
                      fontWeight: FontWeight.bold,
                      fontSize: 16.sp,
                    ),
                  ),
                  Text(
                    "(12 kd per month) 120 Yearly",
                    style: TextStyle(
                      color: Color(0xff457B9D),
                      fontWeight: FontWeight.bold,
                      fontSize: 11.sp,
                    ),
                  ),
                ],
                ontap: () {
                  Get.toNamed(ChooseaplanScreen.routeName);
                },
              ),
            ),
            k1hSizedBox,
            // Align(
            //   alignment: Alignment.centerLeft,
            //   child: Text(
            //     'Top Up',
            //     style: Theme.of(context)
            //         .textTheme
            //         .headlineLarge!
            //         .copyWith(color: AppColors.kBlueMediumShade),
            //   ),
            // ),
            // k1hSizedBox,
            // TopupContainer(),
            // k1hSizedBox,
            // SizedBox(
            //   width: double.infinity,
            //   height: 6.h,
            //   child: CustomOutlinedButton(
            //     contant: [
            //       Text(
            //         "Buy More Invites",
            //         style: TextConstants.bodyLargeMediumBlueBold(context),
            //       ),
            //     ],
            //     ontap: () {
            //       // Get.toNamed(Buytopups.routeName);
            //     },
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.contant,
    required this.ontap,
  });

  final List<Widget> contant;
  final VoidCallback ontap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        ontap();
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: const BorderSide(width: 1, color: AppColors.kBlueMediumShade),
        padding: EdgeInsets.symmetric(vertical: 1.h),
        textStyle: TextConstants.bodyLarge_White_Normal(context)
            .copyWith(color: AppColors.kBlueLightShade),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: contant,
      ),
    );
  }
}
