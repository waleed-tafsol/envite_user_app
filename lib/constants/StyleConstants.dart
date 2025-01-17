// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_constants.dart';

class StylesConstants {
  static final ButtonStyle elevated_b_redBack_whiteFore =
      ElevatedButton.styleFrom(
    textStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
    backgroundColor: AppColors.kPrimaryColor,
    foregroundColor: Colors.white,
    elevation: 4,
  );
}
