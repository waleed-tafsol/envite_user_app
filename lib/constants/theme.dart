import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'colors_constants.dart';

class CustomTheme {
  var lightTheme = ThemeData.light(useMaterial3: true).copyWith(
    scaffoldBackgroundColor: AppColors.kScaffoldBackgroundColor,
    primaryColor: Colors.white,
    primaryIconTheme: const IconThemeData(color: AppColors.kPrimaryColor),
    iconButtonTheme: IconButtonThemeData(
        style: ButtonStyle(
      iconColor: WidgetStateProperty.all(AppColors.kPrimaryColor),
    )),
    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white).copyWith(),
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: AppColors.kWhite,
      foregroundColor: AppColors.kBluedarkShade,
      elevation: 4,
    )),
    snackBarTheme: const SnackBarThemeData(),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: true,
      titleTextStyle: TextStyle(
          fontSize: 18.sp,
          fontWeight: FontWeight.bold,
          color: AppColors.kTextBlack),
      iconTheme: IconThemeData(
        color: AppColors.kPrimaryColor,
        // size: Device.screenType == ScreenType.tablet ? 17.sp : 18.sp,
      ),
      elevation: 0,
    ),
    bottomNavigationBarTheme: BottomNavigationBarThemeData(
        backgroundColor: Colors.white,
        selectedItemColor: AppColors.kPrimaryColor,
        unselectedItemColor: Colors.grey[300],
        type: BottomNavigationBarType.fixed,
        elevation: 0,
        selectedLabelStyle: TextStyle(
          fontSize: 13.sp,
        ),
        unselectedLabelStyle: TextStyle(
          fontSize: 13.sp,
        )),
    chipTheme: ChipThemeData(
      backgroundColor: AppColors.kWhite,
      labelStyle: const TextStyle(
        color: AppColors.kBerkeleyBlue,
        fontWeight: FontWeight.bold,
      ),
      secondarySelectedColor: AppColors.kBerkeleyBlue,
      secondaryLabelStyle: const TextStyle(
        fontWeight: FontWeight.bold,
        color: AppColors.kWhite,
      ),
      checkmarkColor: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0),
        side: const BorderSide(width: 0),
      ),
    ),
    inputDecorationTheme: const InputDecorationTheme().copyWith(
        contentPadding: EdgeInsets.symmetric(vertical: 18.w, horizontal: 12.h),
        filled: true,
        fillColor: AppColors.kLightBlueColor2,
        prefixIconColor: AppColors.kPrimaryColor,
        suffixIconColor: AppColors.kPrimaryColor,
        labelStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
        hintStyle: TextStyle(fontSize: 12.sp, fontWeight: FontWeight.normal, color: Color(0xff457B9D)),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        )),
    textTheme: TextTheme(
      labelLarge: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w800),
      headlineSmall: TextStyle(
        color: AppColors.kTextBlack,
        fontSize: 18.sp,
      ),
      headlineMedium: TextStyle(
        color: AppColors.kTextBlack,
        fontWeight: FontWeight.bold,
        fontSize: 16.sp,
      ),
      headlineLarge: TextStyle(
          color: AppColors.kTextBlack,
          fontWeight: FontWeight.bold,
          fontSize: 17.sp),
      bodyLarge: TextStyle(
        color: AppColors.kTextBlack,
        fontSize: 15.sp,
      ),
      bodyMedium: TextStyle(
        fontSize: 15.sp,
      ),
      bodySmall: TextStyle(
          color: AppColors.kTextBlack,
          fontSize: 13.sp,
          fontWeight: FontWeight.normal),
      titleMedium: TextStyle(fontSize: 20.sp, fontWeight: FontWeight.w700),
      titleSmall: TextStyle(fontSize: 13.sp, fontWeight: FontWeight.w500),
    ),
  );
}
