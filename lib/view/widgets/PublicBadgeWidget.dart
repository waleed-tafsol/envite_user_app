import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../constants/colors_constants.dart';

class PublicBadgeWidget extends StatelessWidget {
  const PublicBadgeWidget({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 4.h),
      decoration: BoxDecoration(
          color: AppColors.kBlueMediumShade,
          borderRadius: BorderRadius.circular(4.r)),
      height: 30.h,
      child: Center(
        child: Text(
          text ?? "",
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.kBluedarkShade),
        ),
      ),
    );
  }
}
