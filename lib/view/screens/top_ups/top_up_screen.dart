import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/ChooseAPlan.dart';
import 'package:event_planner_light/view/screens/top_ups/buy_top_ups_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class TopUpScreen extends StatelessWidget {
  static const routeName = 'TopUpsScreen';

  const TopUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Top Ups'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor),
                    onPressed: () {
                      Get.toNamed(BuyTopUpsScreen.routeName);
                      // Navigator.pushNamed(context, BuyTopUpsScreen.routeName);
                    },
                    child: Text(
                      'Buy Top Ups',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffD9DBDF),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  children: [
                    Expanded(
                      flex: 2,
                      child: Text(
                        'User',
                        style: TextStyle(color: AppColors.kBerkeleyBlue),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Event Type',
                        style: TextStyle(color: AppColors.kBerkeleyBlue),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Created Date',
                        style: TextStyle(color: AppColors.kBerkeleyBlue),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Price',
                        style: TextStyle(color: AppColors.kBerkeleyBlue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Event Planner',
                                    style: TextStyle(
                                        color: AppColors.kBerkeleyBlue,
                                        fontSize: 13.5.sp),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Exclusive',
                                    style: TextStyle(
                                        color: AppColors.kBerkeleyBlue,
                                        fontSize: 13.5.sp),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    '24 / 09 / 2024',
                                    style: TextStyle(
                                        color: AppColors.kBerkeleyBlue,
                                        fontSize: 13.5.sp),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    '55',
                                    style: TextStyle(
                                        color: AppColors.kBerkeleyBlue,
                                        fontSize: 13.5.sp),
                                  ),
                                ),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
