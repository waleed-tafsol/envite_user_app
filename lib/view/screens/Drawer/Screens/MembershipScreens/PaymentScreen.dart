import 'dart:convert';

import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../constants/ApiConstant.dart';
import '../../../../../constants/StyleConstants.dart';
import '../../../../../controllers/Auth_services.dart';
import '../../../../../utills/CustomSnackbar.dart';
import '../../../cms/CmsScreen.dart';
import 'Widget/PaymentMethodsWidget.dart';
import 'package:http/http.dart' as http;

class MemberShipPaymentScreen extends StatelessWidget {
  MemberShipPaymentScreen({super.key});
  static const routeName = "MemberShipPaymentScreen";

  Future<void> paynow(String? type) async {
    try {
      final response = await http
          .patch(Uri.parse(ApiConstants.buyPackages + type!), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer ${authService.authToken}',
      });
      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        await authService.getMe();
      } else {
        throw Exception('Failed to buy subscription');
      }
    } catch (e) {
      CustomSnackbar.showError('Error', e.toString());
    }
  }

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
              height: 10.h,
            ),
            Text(
              "Pay now and get access in all features and offers",
              style: Theme.of(context).textTheme.bodySmall,
            ),
            SizedBox(
              height: 2.h,
            ),
            PaymentMethodWidget(),
            SizedBox(
              height: 1.h,
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
                onPressed: () async {
                  final args = Get.arguments;
                  Get.dialog(Center(
                    child: CircularProgressIndicator(),
                  ));

                  await paynow(args);
                  Get.back();

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
