import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/screens/ads/add_ads_screen.dart';
import 'package:event_planner_light/view/widgets/ad_chips.dart';
import 'package:event_planner_light/view/widgets/ads_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdsScreen extends StatelessWidget {
  static const routeName = 'AdsScreen';
  const AdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F8EF),
      appBar: AppBar(
        title: const Text('My Ads'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            AdChips(),
            SizedBox(
              height: 2.h,
            ),
            AdsContainer(),
            SizedBox(
              height: 2.h,
            ),
            AdsContainer(),
            SizedBox(
              height: 2.h,
            ),
            AdsContainer(),
            SizedBox(
              height: 2.h,
            ),
            AdsContainer(),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kPrimaryColor),
                      onPressed: () {
                        Get.toNamed(AddAdsScreen.routeName);
                      },
                      child: Text(
                        'Add Ads',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            )
            // Row(
            //   children: [
            //     Spacer(),
            //     ElevatedButton(
            //         style: ElevatedButton.styleFrom(
            //             backgroundColor: AppColors.kPrimaryColor),
            //         onPressed: () {
            //           Get.toNamed(AddAdsScreen.routeName);
            //         },
            //         child: Text(
            //           'Add Ads',
            //           style: TextStyle(color: Colors.white),
            //         ))
            //   ],
            // ),
            // Myadscontainer(),
            // SizedBox(
            //   height: 2.h,
            // ),
            // Myadscontainer(),
            // SizedBox(
            //   height: 2.h,
            // ),
            // Myadscontainer(),
            // SizedBox(
            //   height: 2.h,
            // ),
            // Myadscontainer(),
          ],
        ),
      ),
    );
  }
}
