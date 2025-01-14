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

    colorScheme: ColorScheme.fromSeed(seedColor: Colors.white).copyWith(
        // secondary: kSecondaryColor,
        ),

    // tabBarTheme: const TabBarTheme(
    //     labelColor: Colors.white,
    //     indicatorColor: Colors.white,
    //     // dividerColor:
    //     unselectedLabelColor: Colors.white70)
    elevatedButtonTheme: ElevatedButtonThemeData(
        style: ElevatedButton.styleFrom(
      textStyle: TextStyle(color: Colors.white, fontSize: 14.sp),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
      backgroundColor: AppColors.kWhite,
      foregroundColor: AppColors.kBluedarkShade,
      elevation: 4,
    )),
    snackBarTheme: const SnackBarThemeData(
        // backgroundColor: kSecondaryColor,
        // contentTextStyle: TextStyle(
        //     color: AppColors.kTextWhiteColor,
        //     fontSize: 10.sp,
        //     fontWeight: FontWeight.w700),
        ),
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.transparent,
      centerTitle: false,
      titleTextStyle: TextStyle(
          fontSize: 15.sp,
          fontWeight: FontWeight.normal,
          letterSpacing: 2.0,
          color: AppColors.kTextBlack),
      iconTheme: IconThemeData(
        color: AppColors.kPrimaryColor,
      ),
      elevation: 0,
    ),

    //input decoration theme for all our the app
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
      // selectedColor: AppColors.kPrimaryColor,
      // disabledColor: AppColors.kBlueLightShade,
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
      // iconTheme: IconThemeData(color: Colors.white),
      padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 0.5.h),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5.0), // Rounded rectangle shape
        side: const BorderSide(width: 0),
      ),
      // brightness: Brightness,
    ),

    inputDecorationTheme: const InputDecorationTheme().copyWith(
        contentPadding: EdgeInsets.symmetric(vertical: 4.w, horizontal: 1.h),
        filled: true,
        fillColor: AppColors.kLightBlueColor2,
        prefixIconColor: AppColors.kPrimaryColor,
        suffixIconColor: AppColors.kPrimaryColor,

        //label style for formField
        labelStyle: TextStyle(
            fontSize: 15.sp,
            // color: AppColors.kTextblackColor,
            fontWeight: FontWeight.normal),
        hintStyle: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.normal),
        // errorStyle: TextStyle(
        //     fontSize: 12.sp,
        //     // color: AppColors.kErrorBorderColor,
        //     fontWeight: FontWeight.normal),

        // enabledBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         color: kTextLightColor, width: kWidthOfInputBoarder),
        //     borderRadius: kBorderRadiusAll),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: BorderSide.none,
        )
        //     borderRadius: kBorderRadiusAll),
        // disabledBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         color: kTextLightColor, width: kWidthOfInputBoarder),
        //     borderRadius: kBorderRadiusAll),
        // on focus  change color
        // focusedBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         color: kSecondaryColor, width: kWidthOfInputBoarder),
        //     borderRadius: kBorderRadiusAll),
        //color changes when user enters wrong information,

        // errorBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(
        //         color: kErrorBorderColor, width: kWidthOfInputBoarder),
        //     borderRadius: kBorderRadiusAll),
        // //same on focus error color
        // focusedErrorBorder: OutlineInputBorder(
        //     borderSide: const BorderSide(
        //       color: kErrorBorderColor,
        //       width: kWidthOfInputBoarder,
        //     ),
        //     borderRadius: kBorderRadiusAll),
        ),
    textTheme: TextTheme(
      //custom text for headline
      labelLarge: TextStyle(
          // color: AppColors.kTextWhiteColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w800),
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
          fontSize: 17.sp
          //  SizerUtil.deviceType == DeviceType.tablet ? 22.sp : 35.sp,
          ),

      // body text style
      bodyLarge: TextStyle(
        color: AppColors.kTextBlack,
        fontSize: 15.sp,
      ),
      bodyMedium: TextStyle(
        // color: AppColors.kTextWhiteColor,
        fontSize: 15.sp,
      ),
      bodySmall: TextStyle(
          color: AppColors.kTextBlack,
          fontSize: 13.sp,
          fontWeight: FontWeight.normal),

      // title style
      titleMedium: TextStyle(
          // color: AppColors.kTextWhiteColor,
          fontSize: 20.sp,
          fontWeight: FontWeight.w700),
      titleSmall: TextStyle(
          // color: AppColors.kTextWhiteColor,
          fontSize: 13.sp,
          fontWeight: FontWeight.w500),
    ),
  );
}
