import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/widgets/bullet_points.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MembershipContainer extends StatelessWidget {
  const MembershipContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(color: Color(0xff457B9D))),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.5.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Premimum',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.kBerkeleyBlue),
            ),
            SizedBox(
              height: 1.h,
            ),
            RichText(
              text: TextSpan(
                  text: '\$354.90/',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColors.kBerkeleyBlue),
                  children: [
                    TextSpan(
                      text: 'Monthly',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.kBerkeleyBlue),
                    )
                  ]),
            ),
            Text(
              'See Benefits',
              style: Theme.of(context)
                  .textTheme
                  .bodyLarge!
                  .copyWith(color: AppColors.kBerkeleyBlue),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 2.w),
              child: BulletPoints(
                items: [
                  'Limited invites',
                  'Online support',
                  'View exclusif events',
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
