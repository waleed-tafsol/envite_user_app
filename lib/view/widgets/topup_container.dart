import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../controllers/Auth_services.dart';

class TopupContainer extends StatelessWidget {
  const TopupContainer({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 1.h),
      width: double.infinity,
      decoration: BoxDecoration(
          border: Border.all(color: Color(0xff457B9D)),
          borderRadius: BorderRadius.circular(10)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Total Invites:',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.kBerkeleyBlue, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              '${authService.me.value?.totalInvites} Invites',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.kBerkeleyBlue),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              'Remaining Invites:',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.kBerkeleyBlue),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              '${authService.me.value?.remainingInvites} Invites',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.kBerkeleyBlue),
            ),
            Text(
              'Total Addon Invites:',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                  color: AppColors.kBerkeleyBlue, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              '${authService.me.value?.totalAddonInvites} Invites',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.kBerkeleyBlue),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              'Remaining Addon Invites:',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.kBerkeleyBlue),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              '${authService.me.value?.remainingAddonInvites} Invites',
              style: Theme.of(context)
                  .textTheme
                  .bodyMedium!
                  .copyWith(color: AppColors.kBerkeleyBlue),
            ),
          ],
        ),
      ),
    );
  }
}
