import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/PaymentScreen.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseaplanScreen extends StatelessWidget {
  const ChooseaplanScreen({super.key});
  static const routeName = "ChooseaplanScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Membership"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Center(
              child: Text('Upgrade To Standard Plan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.kBerkeleyBlue,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600)),
            ),
            k3hSizedBox,
            SizedBox(
              height: 25.h,
              child: Row(
                children: [
                  const Expanded(
                    child: ChoosePlanContainer(
                      title: 'Standard Plan',
                    ),
                  ),
                  SizedBox(
                    width: 4.w,
                  ),
                  const Expanded(
                    child: ChoosePlanContainer(
                      title: 'Premium Plan',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ChoosePlanContainer extends StatelessWidget {
  const ChoosePlanContainer({
    super.key,
    required this.title,
  });
  final String title;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Get.toNamed(MemberShipPaymentScreen.routeName);
      },
      child: Container(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.kBluedarkShade, width: 2),
            borderRadius: k5BorderRadius),
        child: Column(
          children: [
            const Icon(
              Icons.circle,
              color: AppColors.kBlueLightShade,
            ),
            Text(
              "Change Plan to",
              style: TextConstants.bodySmall_darkblue_bold(context),
            ),
            Text(
              title,
              style: TextConstants.headlineLarge_darkBlue_Bold(context),
            ),
            Text(
              "(12 kd per month) 120 Yearly",
              style: TextConstants.bodySmall_darkblue_bold(context),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 1.h,
            ),
            SizedBox(
              width: 30.w,
              child: Row(
                children: [
                  const Icon(Icons.circle,
                      size: 8, color: AppColors.kBluedarkShade),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    'Limited invites',
                    style: TextConstants.bodySmall_darkblue_bold(context),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            SizedBox(
              width: 30.w,
              child: Row(
                children: [
                  const Icon(Icons.circle,
                      size: 8, color: AppColors.kBluedarkShade),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    'Limited invites',
                    style: TextConstants.bodySmall_darkblue_bold(context),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            SizedBox(
              width: 30.w,
              child: Row(
                children: [
                  const Icon(Icons.circle,
                      size: 8, color: AppColors.kBluedarkShade),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    'Limited invites',
                    style: TextConstants.bodySmall_darkblue_bold(context),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 0.5.h,
            ),
            SizedBox(
              width: 30.w,
              child: Row(
                children: [
                  const Icon(Icons.circle,
                      size: 8, color: AppColors.kBluedarkShade),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    'Limited invites',
                    style: TextConstants.bodySmall_darkblue_bold(context),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
