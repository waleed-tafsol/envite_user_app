import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class AdsContainer extends StatelessWidget {
  const AdsContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 140,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xffF1F5ED),
          // color: Colors.yellow,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        child: Row(
          children: [
            ClipRRect(
              borderRadius: k5BorderRadius,
              child: Container(
                height: 135,
                width: 120,
                decoration: BoxDecoration(borderRadius: k5BorderRadius),
                child: Image.asset(
                  Assets.ad,
                  fit: BoxFit.cover,
                ),
              ),
            ),
            SizedBox(
              width: 2.w,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Met Gala 2024: Celebrities',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.kBerkeleyBlue,
                      fontWeight: FontWeight.w700),
                ),
                SizedBox(
                  height: 0.7.h,
                ),
                Text(
                  'Red Carpet',
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.kBerkeleyBlue,
                      fontWeight: FontWeight.w700),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
