import 'package:event_planner_light/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CouponScreen extends StatelessWidget {
  const CouponScreen({super.key});
  static const routeName = "CuponScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Coupons"),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
        child: Column(
          children: [
            Card(
              elevation: 10,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Title:",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 17.sp)),
                        Text("New Year 2k21",
                            style: TextStyle(
                                color: Colors.black, fontSize: 17.sp)),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Coupon Code:",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 17.sp)),
                        Text("2K21NEW",
                            style: TextStyle(
                                color: Colors.black, fontSize: 17.sp)),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Uses Per Coupon:",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 17.sp)),
                        Text("10",
                            style: TextStyle(
                                color: Colors.black, fontSize: 17.sp)),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("Start Date:",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 17.sp)),
                        Text("10-10-2024",
                            style: TextStyle(
                                color: Colors.black, fontSize: 17.sp)),
                      ],
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Divider(),
                    SizedBox(
                      height: 1.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("End Date:",
                            style:
                                TextStyle(color: Colors.grey, fontSize: 17.sp)),
                        Text("12-12-2024",
                            style: TextStyle(
                                color: Colors.black, fontSize: 17.sp)),
                      ],
                    ),
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
