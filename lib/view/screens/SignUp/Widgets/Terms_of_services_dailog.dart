import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';

void terms_0f_services_Dialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        shadowColor: AppColors.kBluedarkShade,
        title: Align(
          alignment: Alignment.centerRight,
          child: IconButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              icon: const Icon(
                Icons.cancel_outlined,
                color: AppColors.kBluedarkShade,
              )),
        ),
        content: SingleChildScrollView(
          child: ListBody(
            children: <Widget>[
              Text(
                'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.',
                style: TextConstants.bodymedium_darkBlue_normal(context),
              ),
              const SizedBox(height: 16),
              Text(
                'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.',
                style: TextConstants.bodymedium_darkBlue_normal(context),
              ),
            ],
          ),
        ),
      );
    },
  );
}
