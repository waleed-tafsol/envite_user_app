import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../Drawer/Screens/MembershipScreens/MemberShipScreen.dart';

class AddAdsScreen extends StatelessWidget {
  static const routeName = 'AddAdsScreen';
  const AddAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F8EF),
      appBar: AppBar(
        title: const Text('Add Ads'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 2.h,
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                  decoration:
                      BoxDecoration(borderRadius: BorderRadius.circular(10)),
                  child: Image.asset(
                    Assets.eventCanvas,
                    height: 180,
                    width: double.infinity,
                    fit: BoxFit.cover,
                  )),
            ),
            SizedBox(
              height: 2.h,
            ),
            const TextField(
                decoration: InputDecoration(
              hintText: "Title",
              // prefixIcon: Icon(Icons.email_outlined),
            )),
            SizedBox(
              height: 2.h,
            ),
            const TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Description",

                  // prefixIcon: Icon(Icons.email_outlined),
                )),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                const Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                    hintText: "Start date",
                    // prefixIcon: Icon(Icons.event),
                  )),
                ),
                SizedBox(
                  width: 2.w,
                ),
                const Expanded(
                  child: TextField(
                      decoration: InputDecoration(
                    hintText: "End date",
                    // prefixIcon: Icon(Icons.event),
                  )),
                ),
              ],
            ),
            // SizedBox(
            //   height: 3.h,
            // ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 4.h),
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.kPrimaryColor),
                        onPressed: () {
                          Get.toNamed(MembershipScreen.routeName);
                        },
                        child: Text(
                          'Send Request',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
