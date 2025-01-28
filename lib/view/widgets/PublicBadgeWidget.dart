import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../constants/colors_constants.dart';

class PublicBadgeWidget extends StatelessWidget {
  const PublicBadgeWidget({super.key, this.text});
  final String? text;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: 1.w,
      ),
      decoration: BoxDecoration(
          color: AppColors.kBlueMediumShade,
          borderRadius: BorderRadius.circular(2)),
      height: 2.h,
      child: Center(
        child: Text(
          (text ?? "").toUpperCase(),
          style: Theme.of(context)
              .textTheme
              .bodySmall!
              .copyWith(color: AppColors.kBluedarkShade),
        ),
      ),
    );
  }
}
