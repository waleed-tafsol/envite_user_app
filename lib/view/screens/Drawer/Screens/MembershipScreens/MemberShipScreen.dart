import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/BuyPackagesScreen.dart';
import 'package:event_planner_light/view/widgets/topup_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constants/constants.dart';
import '../../../../../controllers/Auth_services.dart';
import '../../../../../controllers/membership_controller.dart';
import '../../../../widgets/membership_container.dart';
import 'Widget/AddonsDailodBox.dart';

class MembershipScreen extends GetView<MembershipController> {
  const MembershipScreen({super.key});
  static const routeName = "MemberShipScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Membership"),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'My Packages',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Color(0xff457B9D)),
                  ),
                ),
                Obx(() {
                  final subscriptions = authService.me.value?.subscriptions;
                  if (subscriptions == null || subscriptions.isEmpty) {
                    return Text(
                      'You don\'t have any package right now',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.kBerkeleyBlue),
                    );
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: subscriptions.map((item) {
                      return MembershipContainer(
                        subscription: item,
                      );
                    }).toList(),
                  );
                }),
                k1hSizedBox,
                // authService.me.value.
                SizedBox(
                  width: double.infinity,
                  height: 7.h,
                  child: CustomOutlinedButton(
                    text: [
                      Text(
                        controller.membershipPlans.isEmpty
                            ? "Buy Package"
                            : "Upgrade package",
                        style: TextStyle(
                            color: AppColors.kBluedarkShade,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        controller.membershipPlans.isEmpty
                            ? "Buy Package to get more Perks"
                            : "Upgrade package to get more Perks",
                        style: TextStyle(
                            color: AppColors.kBluedarkShade, fontSize: 13.sp),
                      ),
                    ],
                    onTap: () {
                      Get.toNamed(BuyPackagesScreen.routeName,
                          arguments: {"type": "all"});
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
                        .copyWith(color: AppColors.kBluedarkShade),
                  ),
                ),
                k1hSizedBox,
                TopupContainer(),
                k1hSizedBox,
                SizedBox(
                  width: double.infinity,
                  height: 7.h,
                  child: CustomOutlinedButton(
                    text: [
                      Text(
                        "Buy TopUps",
                        style: TextStyle(
                            color: AppColors.kBluedarkShade,
                            fontSize: 15.sp,
                            fontWeight: FontWeight.w700),
                      ),
                      Text(
                        "Buy More Invites",
                        style: TextStyle(
                            color: AppColors.kBluedarkShade, fontSize: 13.sp),
                      ),
                    ],
                    onTap: () {
                      // Get.toNamed(BuyPackagesScreen.routeName,
                      //     arguments: {"type": "addon"});
                      addOnsDailogBox(context);
                    },
                  ),
                ),
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
