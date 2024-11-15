import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/widgets/topup_container.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AllTopUpsScreen extends StatelessWidget {
  static const routeName = 'AllTopUpsScreen';
  const AllTopUpsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Top Ups'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Top Ups',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: Color(0xff457B9D)),
            ),
            SizedBox(
              height: 2.h,
            ),
            // SizedBox(
            //   height: 2.h,
            // ),
            TopupContainer(),
            SizedBox(
              height: 1.h,
            ),
            TopupContainer(),
            SizedBox(
              height: 1.h,
            ),
            TopupContainer(),
            SizedBox(
              height: 1.h,
            ),
            TopupContainer(),
            SizedBox(
              height: 1.h,
            ),
            TopupContainer(),
            SizedBox(
              height: 3.h,
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kPrimaryColor),
                      onPressed: () {
                        // Get.toNamed(AllTopUpsScreen.routeName);
                      },
                      child: Text(
                        'Add Top Ups',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
