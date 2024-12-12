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
              height: 10.h,
            ),
            Text(
              "Basic Plan (Free)",
              style: Theme.of(context)
                  .textTheme
                  .headlineLarge!
                  .copyWith(color: AppColors.kBlueMediumShade),
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
              height: 6.h,
              child: CustomOutlinedButton(
                contant: [
                  Text(
                    "Change Plan to premium",
                    style: TextConstants.bodyLargeMediumBlueBold(context),
                  ),
                  Text(
                    "(12 kd per month) 120 Yearly",
                    style: TextConstants.bodySmall_mediumBlue_normal(context),
                  ),
                ],
                ontap: () {
                  Get.toNamed(BuyPackagesScreen.routeName);
                },
              ),
            ),
            k1hSizedBox,
            Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Top Up',
                style: Theme.of(context)
                    .textTheme
                    .headlineLarge!
                    .copyWith(color: AppColors.kBlueMediumShade),
              ),
            ),
            k1hSizedBox,
            TopupContainer(),
            k1hSizedBox,
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
            ),
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
