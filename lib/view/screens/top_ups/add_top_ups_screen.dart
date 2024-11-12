import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/screens/top_ups/all_top_ups_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AddTopUpsScreen extends StatelessWidget {
  static const routeName = 'AddTopUpsScreen';
  const AddTopUpsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(' Top Ups'),
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
              height: 3.h,
            ),
            TextField(
                decoration: InputDecoration(
              hintText: "Enter No Of Invites",
              // prefixIcon: Icon(Icons.email_outlined),
            )),
            SizedBox(
              height: 2.h,
            ),
            Divider(),
            Row(
              children: [
                Text(
                  'Total',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Color(0xff457B9D)),
                ),
                Spacer(),
                Text(
                  '\$45',
                  style: Theme.of(context)
                      .textTheme
                      .titleLarge!
                      .copyWith(color: Color(0xff457B9D)),
                ),
              ],
            ),
            Spacer(),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kPrimaryColor),
                      onPressed: () {
                        Get.toNamed(AllTopUpsScreen.routeName);
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
