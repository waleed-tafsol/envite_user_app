import 'package:flutter/cupertino.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/colors_constants.dart';

class EventTileShimmer extends StatelessWidget {
  const EventTileShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: AppColors.kBluedarkShade,
      highlightColor: AppColors.kLightBlueColor2,
      child: Container(
        height: 14.h,
        width: double.infinity,
        margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
        decoration: BoxDecoration(
            color: AppColors.kLightBlueColor,
            borderRadius: BorderRadius.circular(10)),
      ),
    );
  }
}
