import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/widgets/bullet_points.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../model/SubscriptionModel.dart';
import '../../utills/string_decoration.dart';

class MembershipContainer extends StatelessWidget {
  const MembershipContainer(
      {super.key, required this.plan});
  final Subscriptions plan;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
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
              capitalizeFirstLetter(plan.type!),
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
                  text: '\$${plan.price}/',
                  style: Theme.of(context)
                      .textTheme
                      .labelLarge!
                      .copyWith(color: AppColors.kBerkeleyBlue),
                  children: [
                    TextSpan(
                      text: '${plan.duration} Months',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.kBerkeleyBlue),
                    )
                  ]),
            ),
            // Text(
            //   'See Benefits',
            //   style: Theme.of(context)
            //       .textTheme
            //       .bodyLarge!
            //       .copyWith(color: AppColors.kBerkeleyBlue),
            // ),
            // Padding(
            //   padding: EdgeInsets.symmetric(horizontal: 2.w),
            //   child: BulletPoints(
            //     items: [
            //       'Limited invites',
            //       'Online support',
            //       'View exclusif events',
            //     ],
            //   ),
            // )
          ],
        ),
      ),
    );
  }
}
