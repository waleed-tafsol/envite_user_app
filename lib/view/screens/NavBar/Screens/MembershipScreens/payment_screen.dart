import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/screens/SignUp/Widgets/Terms_of_services_dailog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../constants/StyleConstants.dart';
import 'Widget/PaymentMethodsWidget.dart';

class MemberShipPaymentScreen extends StatelessWidget {
  const MemberShipPaymentScreen({super.key});
  static const routeName = "MemberShipPaymentScreen";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Payment"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 29.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 98.h,
            ),
            Text("Pay now and get access in all features and offers",
                style: TextStyle(
                    color: AppColors.kBerkeleyBlue,
                    fontSize: 11.sp,
                    fontWeight: FontWeight.normal)),
            SizedBox(
              height: 38.h,
            ),
            PaymentMethodWidget(),
            SizedBox(
              height: 20.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                GestureDetector(
                  onTap: () {
                    terms_0f_services_Dialog(context);
                  },
                  child: Text(
                    "I accept terms and conditions",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        color: AppColors.kBluedarkShade),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 6.h,
            ),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: StylesConstants.elevated_b_redBack_whiteFore,
                child: const Column(
                  children: [
                    Text(
                      "Confirm Payment",
                    ),
                  ],
                ),
                onPressed: () {
                  Get.until((route) => route.isFirst);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
