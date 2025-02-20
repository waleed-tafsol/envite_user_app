import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/controllers/payment_controller.dart';
import 'package:event_planner_light/model/PackagesModel.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/PaymentScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../utills/string_decoration.dart';

class ChoosePlanContainer extends StatelessWidget {
  const ChoosePlanContainer({
    super.key,
    required this.package,
  });
  final PackagesModel? package;
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        // final PaymentController paymentController =
        //     Get.put(PaymentController());
        // paymentController.packagesModel.value = package!;
        Get.toNamed(PaymentScreen.routeName, arguments: {
          "istopupPayment": false,
          "packagesModel": package,
          "noOfInvites": package?.invites ?? 0,
          "routeToPopTill": Get.currentRoute
        });
      },
      child: Container(
        width: double.infinity,
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
        decoration: BoxDecoration(
            border: Border.all(color: AppColors.kBluedarkShade, width: 2),
            borderRadius: k5BorderRadius),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            /*  const Icon(
              Icons.circle,
              color: AppColors.kBlueLightShade,
            ),*/
            /* Text(
              "Change Plan to",
              style: TextConstants.bodySmall_darkblue_bold(context),
            ),*/
            Text(
              '${capitalizeFirstLetter(package?.name?.en ?? "")} / ${capitalizeFirstLetter(package?.name?.ar ?? "")}',
              style: TextConstants.headlineLarge_darkBlue_Bold(context),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "\$ ${package?.price.toString()} ",
              style: TextStyle(
                  color: AppColors.kBluedarkShade,
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w700),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 1.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Duration: ',
                  style: TextConstants.bodySmall_darkblue_bold(context),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  "${package?.duration.toString()} Month",
                  style: TextConstants.bodySmall_darkblue_bold(context),
                ),
              ],
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Event Type:',
                  style: TextConstants.bodySmall_darkblue_bold(context),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  capitalizeFirstLetter(package?.eventType ?? ""),
                  style: TextConstants.bodySmall_darkblue_bold(context),
                ),
              ],
            ),
            SizedBox(
              height: 0.5.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  'Number of invites:',
                  style: TextConstants.bodySmall_darkblue_bold(context),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  package?.invites.toString() ?? "",
                  style: TextConstants.bodySmall_darkblue_bold(context),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
