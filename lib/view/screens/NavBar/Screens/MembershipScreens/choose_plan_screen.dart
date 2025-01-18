import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/MembershipScreens/payment_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

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
        padding: EdgeInsets.symmetric(horizontal: 27.w, vertical: 0.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 50.h,
            ),
            Center(
              child: Text('Upgrade To Standard Plan',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      color: AppColors.kBerkeleyBlue,
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600)),
            ),
            SizedBox(
              height: 17.h,
            ),
            Row(
              children: [
                const Expanded(
                  child: ChoosePlanContainer(
                    title: 'Standard Plan',
                  ),
                ),
                SizedBox(
                  width: 25.w,
                ),
                const Expanded(
                  child: ChoosePlanContainer(
                    title: 'Premium Plan',
                  ),
                ),
              ],
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
        padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.kBluedarkShade, width: 1),
            borderRadius: k5BorderRadius),
        child: Column(
          children: [
            Icon(
              Icons.circle,
              color: AppColors.kBlueLightShade,
              size: 18.sp,
            ),
            SizedBox(height: 10.h),
            Text("Change Plan to",
                style: TextStyle(
                    color: Color(0xff457B9D),
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold)),
            Text(title,
                style: TextStyle(
                    color: Color(0xff457B9D),
                    fontSize: 20.sp,
                    fontWeight: FontWeight.bold)),
            Text(
              "(12 kd per month) 120 Yearly",
              style: TextStyle(
                  color: Color(0xff457B9D),
                  fontSize: 11.sp,
                  fontWeight: FontWeight.normal),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 10.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, size: 5.sp, color: AppColors.kBluedarkShade),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Limited invites',
                  style: TextConstants.bodySmall_darkblue_bold(context),
                ),
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, size: 5.sp, color: AppColors.kBluedarkShade),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Limited invites',
                  style: TextConstants.bodySmall_darkblue_bold(context),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(Icons.circle, size: 5.sp, color: AppColors.kBluedarkShade),
                SizedBox(
                  width: 5.w,
                ),
                Text(
                  'Limited invites',
                  style: TextConstants.bodySmall_darkblue_bold(context),
                ),
              ],
            ),
            SizedBox(
              height: 5.h,
            ),
          ],
        ),
      ),
    );
  }
}
