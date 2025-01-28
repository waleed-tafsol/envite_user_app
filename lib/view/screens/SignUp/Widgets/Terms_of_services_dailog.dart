import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';

void termsOfServicesDialog(BuildContext context) {
  showDialog(
    context: context,
    builder: (BuildContext context) {
      bool isEnglish = true; // Default to English

      return StatefulBuilder(
        builder: (BuildContext context, StateSetter setState) {
          return AlertDialog(
            shadowColor: AppColors.kBluedarkShade,
            title: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  isEnglish ? "Terms of Service" : "شروط الخدمة",
                  style: TextConstants.bodymedium_darkBlue_normal(context),
                ),
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.cancel_outlined,
                    color: AppColors.kBluedarkShade,
                  ),
                ),
              ],
            ),
            content: SingleChildScrollView(
              child: Column(
                children: [
                  Align(
                    alignment: Alignment.centerRight,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          isEnglish ? "English" : "عربي",
                          style:
                              TextConstants.bodymedium_darkBlue_normal(context),
                        ),
                        Switch(
                          value: isEnglish,
                          onChanged: (value) {
                            setState(() {
                              isEnglish = value;
                            });
                          },
                          activeColor: AppColors.kBluedarkShade,
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isEnglish
                        ? 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. '
                            'Sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. '
                            'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                            'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                            'Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
                        : 'لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة والتنضيد. '
                            'كان لوريم إيبسوم ولا يزال المعيار للنصوص الافتراضية في هذه الصناعة منذ القرن الخامس عشر، '
                            'عندما قامت مطبعة مجهولة برص مجموعة من الأحرف. '
                            'لوريم إيبسوم هو ببساطة نص شكلي يستخدم في صناعة الطباعة والتنضيد.',
                    style: TextConstants.bodymedium_darkBlue_normal(context),
                    textAlign: TextAlign.justify,
                  ),
                  const SizedBox(height: 16),
                  Text(
                    isEnglish
                        ? 'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                            'Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. '
                            'Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.'
                        : 'هذا النص هو مثال لنص يمكن أن يستبدل في نفس المساحة. '
                            'لقد تم توليد هذا النص من مولد النص العربي، حيث يمكنك أن تولد مثل هذا النص أو العديد من النصوص الأخرى إضافة إلى زيادة عدد الحروف التي يولدها التطبيق.',
                    style: TextConstants.bodymedium_darkBlue_normal(context),
                    textAlign: TextAlign.justify,
                  ),
                ],
              ),
            ),
          );
        },
      );
    },
  );
}
