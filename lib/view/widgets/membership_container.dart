import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/model/SubscriptionModel.dart';
import 'package:event_planner_light/utills/ConvertDateTime.dart';
import 'package:event_planner_light/view/widgets/bullet_points.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MembershipContainer extends StatelessWidget {
  const MembershipContainer({super.key, this.subscription});
  final Subscriptions? subscription;

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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  subscription?.type ?? "",
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
                      text: '\$${subscription?.price ?? 0}/',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: AppColors.kBerkeleyBlue),
                      children: [
                        TextSpan(
                          text: subscription?.type ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(color: AppColors.kBerkeleyBlue),
                        )
                      ]),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Text(
                  "Validity",
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.kBerkeleyBlue),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  children: [
                    RichText(
                      text: TextSpan(
                          text: "From: ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: AppColors.kBerkeleyBlue,
                                  fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: convertToDateFormat(
                                  subscription?.startDate ?? ""),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: AppColors.kBerkeleyBlue,
                                  ),
                            )
                          ]),
                    ),
                    SizedBox(
                      width: 5.w,
                    ),
                    RichText(
                      text: TextSpan(
                          text: "Till: ",
                          style: Theme.of(context)
                              .textTheme
                              .bodyLarge!
                              .copyWith(
                                  color: AppColors.kBerkeleyBlue,
                                  fontWeight: FontWeight.bold),
                          children: [
                            TextSpan(
                              text: convertToDateFormat(
                                  subscription?.startDate ?? ""),
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(
                                    color: AppColors.kBerkeleyBlue,
                                  ),
                            )
                          ]),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                RichText(
                  text: TextSpan(
                      text: '${subscription?.totalInvites ?? 0}/',
                      style: Theme.of(context)
                          .textTheme
                          .labelLarge!
                          .copyWith(color: AppColors.kBerkeleyBlue),
                      children: [
                        TextSpan(
                          text: "Invites",
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
            Spacer(),
            Text(
                subscription?.isSubscriptionExpired ?? false
                    ? "Expired"
                    : "Active",
                style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                    color: subscription?.isSubscriptionExpired ?? false
                        ? Colors.red
                        : Colors.green)),
          ],
        ),
      ),
    );
  }
}
