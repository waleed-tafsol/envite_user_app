
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:flutter/material.dart';

class Adbutton extends StatelessWidget {
  final String text;
  const Adbutton({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    // double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Container(
      height: 25,
      width: 65,
      decoration:
          BoxDecoration(color: const Color(0xffF3F3F3), borderRadius: k5BorderRadius),
      child: Center(
        child: Text(
            textAlign: TextAlign.center,
            text,
            style: Theme.of(context).textTheme.labelSmall!.copyWith(
                  color: AppColors.kBerkeleyBlue,
                )),
      ),
    );
  }
}
