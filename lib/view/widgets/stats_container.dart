import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

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
      height: 7.h,
      width: 42.w,
      decoration: BoxDecoration(borderRadius: k5BorderRadius),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        child: Row(
          children: [
            image,
            SizedBox(
              width: 2.w,
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
                      .copyWith(color: AppColors.kBerkeleyBlue),
                ),
                Text(
                  value,
                  style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                      color: AppColors.kBerkeleyBlue,
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
