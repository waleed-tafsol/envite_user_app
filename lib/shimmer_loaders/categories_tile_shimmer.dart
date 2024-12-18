import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'package:shimmer/shimmer.dart';

import '../constants/colors_constants.dart';


Widget categoriesTileShimmer(){
  return Shimmer.fromColors(
    baseColor: AppColors.kBluedarkShade,
    highlightColor: AppColors.kLightBlueColor2,
    child: Container(
      margin: EdgeInsets.symmetric(
        horizontal: 1.w,
      ),
      decoration: BoxDecoration(
          color: AppColors.kLightBlueColor,
          borderRadius: BorderRadius.circular(10)),
      width: 25.w,
    ),
  );
}