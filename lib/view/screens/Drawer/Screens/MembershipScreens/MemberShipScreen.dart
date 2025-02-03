import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/ButPackagesScreen.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/BuyTopUps.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/ChooseAPlan.dart';
import 'package:event_planner_light/view/widgets/topup_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Basic Plan (Free)",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: AppColors.kBluedarkShade),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Send Private invites",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  "No",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "View exclusif events",
                  style: Theme.of(context).textTheme.bodySmall!.copyWith(),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  "No",
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 7.h,
              child: CustomOutlinedButton(
                text: [
                  Text(
                    "Change Plan to premium",
                    style: TextStyle(color: AppColors.kBluedarkShade,fontSize: 15.sp,fontWeight: FontWeight.w700),
                  ),
                  Text(
                    "(12 kd per month) 120 Yearly",
                    style: TextStyle(color: AppColors.kBluedarkShade,fontSize: 13.sp),
                  ),
                ],
                onTap: () {
                  Get.toNamed(BuyPackagesScreen.routeName);
                },
              ),
            ),
            SizedBox(height: 5.h),
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Top Up',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: AppColors.kBluedarkShade),
              ),
            ),
            k1hSizedBox,
            TopupContainer(),
           /* k1hSizedBox,
            SizedBox(
              width: double.infinity,
              height: 6.h,
              child: CustomOutlinedButton(
                contant: [
                  Text(
                    "Buy More Invites",
                    style: TextConstants.bodyLargeMediumBlueBold(context),
                  ),
                ],
                ontap: () {
                  Get.toNamed(Buytopups.routeName);
                },
              ),
            ),*/
          ],
        ),
      ),
    );
  }
}

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final List<Widget> text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        onTap();
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: const BorderSide(width: 1, color: AppColors.kBluedarkShade),
        padding: EdgeInsets.symmetric(vertical: 1.h),
        textStyle: TextConstants.bodyLarge_White_Normal(context)
            .copyWith(color: AppColors.kBluedarkShade),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: text,
      ),
    );
  }
}
