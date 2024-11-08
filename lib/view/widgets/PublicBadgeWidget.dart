import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../constants/colors_constants.dart';

class PublicBadgeWidget extends StatelessWidget {
  const PublicBadgeWidget({super.key, this.text});
  final String? text;
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 1.w),
      padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 2.w),
      decoration: BoxDecoration(
          color: AppColors.kBlueMediumShade,
          borderRadius: BorderRadius.circular(2)),
      child: Center(
        child: Text(
          text ?? "",
          style: Theme.of(context).textTheme.bodySmall!.copyWith(
                fontSize: 15.sp,
                color: AppColors.kTextBlack,
              ),
        ),
      ),
    );
  }
}
