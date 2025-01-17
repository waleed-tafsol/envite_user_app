import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StatsContainer extends StatelessWidget {
  final Widget image;
  final String title;
  final String value;
  const StatsContainer(
      {super.key,
      required this.image,
      required this.title,
      required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 70.h,
      width: 165.w,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xff457B9D)),
          borderRadius: k5BorderRadius),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 6.w, vertical: 5.h),
        child: Row(
          children: [
           image,
            SizedBox(
              width: 6.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: Theme.of(context)
                      .textTheme
                      .bodySmall!
                      .copyWith(color: AppColors.kBerkeleyBlue, fontSize: 11.sp),
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.kBerkeleyBlue,
                      fontSize: 11.sp,
                      fontWeight: FontWeight.bold),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
