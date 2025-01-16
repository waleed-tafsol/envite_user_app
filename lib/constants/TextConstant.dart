import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';

class TextConstants {
  static TextStyle bodyLargeBlackBold(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Colors.black,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle bodyLargeMediumBlueBold(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: Color(0xff457B9D),
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle bodyLarge_White_Normal(BuildContext context) {
    return Theme.of(context).textTheme.bodyLarge!.copyWith(
          color: Colors.white,
          // fontWeight: FontWeight.bold,
        );
  }

  static TextStyle bodyMedium_white_bold(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(fontWeight: FontWeight.bold, color: Colors.white);
  }

  static TextStyle bodyLarge_white_bold(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyLarge!
        .copyWith(fontWeight: FontWeight.bold, color: Colors.white);
  }

  static TextStyle bodyMedium_white_normal(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .bodyMedium!
        .copyWith(color: Colors.white);
  }

  static TextStyle bodysmall_white_normal(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(color: Colors.white);
  }

  static TextStyle headlineLarge_MediumBlue_normal(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headlineLarge!
        .copyWith(color: AppColors.kBlueMediumShade);
  }

  static TextStyle headlineLarge_darkBlue_Bold(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .headlineLarge!
        .copyWith(color: AppColors.kBluedarkShade, fontWeight: FontWeight.bold);
  }

  static TextStyle headlineMedium_MediumBlue_normal(BuildContext context) {
    return Theme.of(context).textTheme.headlineMedium!.copyWith(
        color: AppColors.kBlueMediumShade, fontWeight: FontWeight.normal);
  }

  static TextStyle bodySmall_mediumBlue_normal(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Color(0xff457B9D),
        );
  }

  static TextStyle bodyMedium_black_normal(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          color: Colors.black,
        );
  }

  static TextStyle bodySmall_darkBlue_normal(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          color: AppColors.kBluedarkShade,
        );
  }

  static TextStyle bodymedium_darkBlue_normal(BuildContext context) {
    return Theme.of(context).textTheme.bodyMedium!.copyWith(
          color: AppColors.kBluedarkShade,
        );
  }

  static TextStyle bodySmall_darkblue_bold(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          color: AppColors.kBluedarkShade,
          fontWeight: FontWeight.bold,
        );
  }

  static TextStyle bodySmall_black_normal(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          color: AppColors.kTextBlack,
          // fontWeight: FontWeight.bold,
        );
  }

  static TextStyle bodySmall_black_bold(BuildContext context) {
    return Theme.of(context).textTheme.bodySmall!.copyWith(
          color: AppColors.kTextBlack,
          fontWeight: FontWeight.bold,
        );
  }

  // Add more text styles as needed
}
