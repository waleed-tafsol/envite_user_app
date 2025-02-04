
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/payment_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../constants/StyleConstants.dart';
import '../../../cms/CmsScreen.dart';

class PaymentScreen extends GetView<PaymentController> {
  PaymentScreen({super.key});

  static const routeName = "MemberShipPaymentScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text("Payment"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.h,
            ),
            Text(
              "Pay now and get access in all features and offers",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 2.h,
            ),
            Expanded(
              child: Obx(() {
                return ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.vertical,
                    itemCount: controller.paymentMethods.length,
                    itemBuilder: (BuildContext ctxt, int index) {
                      return paymentMethodsItem(ctxt, index);
                    });
              }),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Checkbox(value: false, onChanged: (value) {}),
                GestureDetector(
                  onTap: () {
                    Get.toNamed(CmsScreen.routeName, arguments: false);
                  },
                  child: Text(
                    "I accept terms and conditions",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                        decoration: TextDecoration.underline,
                        fontWeight: FontWeight.bold,
                        color: AppColors.kBluedarkShade),
                  ),
                ),
              ],
            ),
            SizedBox(
              height: 1.h,
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
                onPressed: () async {
                  controller.executePayment();
                  /* final args = Get.arguments;
                  Get.dialog(Center(
                    child: CircularProgressIndicator(),
                  ));*/

                  // Get.back();
                  //  Get.until((route) => route.isFirst);
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget paymentMethodsItem(BuildContext ctxt, int index) {
    return SizedBox(
      width: double.infinity,
      height: 6.h,
      child: Obx(() {
        return Container(
          decoration: controller.isSelected[index]
              ? BoxDecoration(
                  border: Border.all(color: AppColors.kBluedarkShade, width: 2))
              : const BoxDecoration(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 2.w),
            child: Row(
              children: <Widget>[
                SizedBox(
                  height: 24.0,
                  width: 24.0,
                  child: Checkbox(
                      checkColor: Colors.blueAccent,
                      activeColor: const Color(0xFFC9C5C5),
                      value: controller.isSelected[index],
                      onChanged: (bool? value) {
                        controller.setPaymentMethodSelected(index, value!);
                      }),
                ),
                SizedBox(
                  width: 2.w,
                ),
                Image.network(
                  controller.paymentMethods[index].imageUrl!,
                  height: 35.0,
                ),
                SizedBox(
                  width: 2.w,
                ),
                Text(
                  controller.paymentMethods[index].paymentMethodEn ?? "",
                  style: TextStyle(
                    fontSize: 14.sp,
                    color: AppColors.kBluedarkShade,
                    fontWeight: controller.isSelected[index]
                        ? FontWeight.bold
                        : FontWeight.normal,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
