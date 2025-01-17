import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CircleIcon extends StatelessWidget {
  const CircleIcon({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 8.w, // Circle diameter
      height: 8.w,
      decoration: BoxDecoration(
        shape: BoxShape.circle,
        color: Colors.transparent,
        border: Border.all(width: 2, color: AppColors.kBlueMediumShade),
      ),
      child: const Center(
        child: Icon(
          // Use FontAwesomeIcons.pencilAlt if using Font Awesome
          Icons.mode_edit_outlined, // or FontAwesomeIcons.pencilAlt
          // size: 24.0, // Icon size
          color: AppColors.kBlueMediumShade, // Icon color
        ),
      ),
    );
  }
}
