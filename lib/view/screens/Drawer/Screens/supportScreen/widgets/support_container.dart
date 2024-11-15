import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SupportContainer extends StatelessWidget {
  const SupportContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 12.h,
      width: double.infinity,
      decoration: BoxDecoration(
          color: Color(0xffF1F5ED),
          // color: Colors.yellow,
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Text(
              'Reset Password',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.kBerkeleyBlue,
                  fontWeight: FontWeight.w700),
            ),
            SizedBox(
              height: 0.7.h,
            ),
            Expanded(
              child: Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sagittis condimentum sapien, et volutpat nunc feugiat nec. Sed et interdum quam. In ipsum ',
                style: Theme.of(context).textTheme.labelMedium!.copyWith(
                      color: AppColors.kBerkeleyBlue,
                    ),
              ),
            ),
            
          ],
        ),
      ),
    );
  }
}
