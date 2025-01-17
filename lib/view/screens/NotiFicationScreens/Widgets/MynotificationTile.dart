import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../constants/assets.dart';
import '../../../../constants/colors_constants.dart';

class MynotificationTile extends StatelessWidget {
  const MynotificationTile({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: ClipRRect(
          borderRadius: BorderRadius.circular(5.r),
          child: Image.asset(
            Assets.squareImage,
            height: 76.h,
            width: 76.w,
            fit: BoxFit.contain,
          )),
      title: Column(
        children: [
          Row(
            children: [
              Icon(Icons.watch_later_outlined,
                  size: 18.sp, color: AppColors.kPrimaryColor),
              SizedBox(
                width: 6.w,
              ),
              Text(
                "35 mins ago",
                style: Theme.of(context)
                    .textTheme
                    .bodyMedium!
                    .copyWith(color: Color(0xff457B9D), fontSize: 12.sp),
              )
            ],
          ),
          SizedBox(
            height: 5.sp,
          ),
          RichText(
            text: TextSpan(
              text: 'You have been invited to ',
              style:
                  TextStyle(color: AppColors.kBluedarkShade, fontSize: 14.sp),
              children: const <TextSpan>[
                TextSpan(
                    text: '‘Met Gala 2024...’',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      decoration: TextDecoration.underline,
                    )),
              ],
            ),
          ),
          SizedBox(
            height: 5.sp,
          ),
          Row(
            children: [
              Container(
                margin: EdgeInsets.only(left: 1.w),
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                decoration: BoxDecoration(
                    color: AppColors.kBlueMediumShade,
                    borderRadius: BorderRadius.circular(2)),
                child: Center(
                  child: Text(
                    "Accept",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12.sp,
                          color: AppColors.kTextBlack,
                        ),
                  ),
                ),
              ),
              SizedBox(
                width: 1.w,
              ),
              Container(
                margin: EdgeInsets.only(left: 1.w),
                padding: EdgeInsets.symmetric(vertical: 4.h, horizontal: 8.w),
                decoration: BoxDecoration(
                    color: AppColors.kPrimaryColor,
                    borderRadius: BorderRadius.circular(2)),
                child: Center(
                  child: Text(
                    "Reject",
                    style: Theme.of(context).textTheme.bodySmall!.copyWith(
                          fontSize: 12.sp,
                          color: Colors.white,
                        ),
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
