import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../constants/assets.dart';
import '../../../../../../constants/colors_constants.dart';
import '../../../../../../model/NotificationResponseModel.dart';

class MynotificationTile extends StatelessWidget {
  const MynotificationTile({
    super.key,
    required this.notification,
  });

  final NotificationModel notification;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      // leading: ClipRRect(
      //     borderRadius: BorderRadius.circular(5),
      //     child: Image.asset(
      //       Assets.squareImage,
      //       height: 8.h,
      //       fit: BoxFit.contain,
      //     )),
      title: Text(
        notification.title ?? "",
        style: TextStyle(color: AppColors.kBluedarkShade, fontSize: 14.sp),
      ),
      subtitle: Text(
        notification.message ?? "",
      ),

      //  Column(
      //   children: [
      //     Row(
      //       children: [
      //         const Icon(Icons.watch_later_outlined,
      //             color: AppColors.kPrimaryColor),
      //         SizedBox(
      //           width: 1.w,
      //         ),
      //         Text(
      //           "35 mins ago",
      //           style: Theme.of(context)
      //               .textTheme
      //               .bodyMedium!
      //               .copyWith(color: Colors.grey),
      //         )
      //       ],
      //     ),
      // Padding(
      //   padding: EdgeInsets.symmetric(vertical: 0.5.h),
      //   child: RichText(
      //     text: TextSpan(
      //       text: 'You have been invited to ',
      //       style:
      //           TextStyle(color: AppColors.kBluedarkShade, fontSize: 14.sp),
      //       children: const <TextSpan>[
      //         TextSpan(
      //             text: '‘Met Gala 2024...’',
      //             style: TextStyle(
      //               fontWeight: FontWeight.bold,
      //               decoration: TextDecoration.underline,
      //             )),
      //       ],
      //     ),
      //   ),
      // ),
      // Row(
      //   children: [
      //     Container(
      //       margin: EdgeInsets.only(left: 1.w),
      //       padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 2.w),
      //       decoration: BoxDecoration(
      //           color: AppColors.kBlueMediumShade,
      //           borderRadius: BorderRadius.circular(2)),
      //       child: Center(
      //         child: Text(
      //           "Accept",
      //           style: Theme.of(context).textTheme.bodySmall!.copyWith(
      //                 fontSize: 15.sp,
      //                 color: AppColors.kTextBlack,
      //               ),
      //         ),
      //       ),
      //     ),
      //     SizedBox(
      //       width: 1.w,
      //     ),
      //     Container(
      //       margin: EdgeInsets.only(left: 1.w),
      //       padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 2.w),
      //       decoration: BoxDecoration(
      //           color: AppColors.kPrimaryColor,
      //           borderRadius: BorderRadius.circular(2)),
      //       child: Center(
      //         child: Text(
      //           "Reject",
      //           style: Theme.of(context).textTheme.bodySmall!.copyWith(
      //                 fontSize: 15.sp,
      //                 color: Colors.white,
      //               ),
      //         ),
      //       ),
      //     )
      //   ],
      // )
      //   ],
      // ),
    );
  }
}
