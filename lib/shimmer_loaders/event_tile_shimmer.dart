import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:shimmer/shimmer.dart';

import '../constants/colors_constants.dart';

Widget eventTileShimmer ({double? tileWidth}){
  return Shimmer.fromColors(
    baseColor: AppColors.kBluedarkShade,
    highlightColor: AppColors.kLightBlueColor2,
    child: Container(
      height: 100.h,
      width: tileWidth ?? double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
      padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
      decoration: BoxDecoration(
          color: AppColors.kLightBlueColor,
          borderRadius: BorderRadius.circular(10)),
    ),
  );
}

Widget sizedShimmer({double? width, double? height}) {
  return Shimmer.fromColors(
    baseColor: AppColors.kBluedarkShade,
    highlightColor: AppColors.kLightBlueColor2,
    child: Container(
      height: height ?? 2.h,
      width: width ?? 20.w,
      // margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
      // padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
      decoration: BoxDecoration(
          color: AppColors.kLightBlueColor,
          borderRadius: BorderRadius.circular(10)),
    ),
  );
}