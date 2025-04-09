import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomOutlinedButton extends StatelessWidget {
  const CustomOutlinedButton({
    super.key,
    required this.text,
    required this.onTap,
  });

  final List<Widget> text;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return OutlinedButton(
      onPressed: () async {
        onTap();
      },
      style: OutlinedButton.styleFrom(
        backgroundColor: Colors.transparent,
        side: const BorderSide(width: 1, color: AppColors.kBluedarkShade),
        padding: EdgeInsets.symmetric(vertical: 1.h),
        textStyle: TextConstants.bodyLarge_White_Normal(context)
            .copyWith(color: AppColors.kBluedarkShade),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(5),
        ),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: text,
      ),
    );
  }
}
