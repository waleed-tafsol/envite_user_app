import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

import '../../constants/TextConstant.dart';
import '../../constants/assets.dart';
import '../../constants/colors_constants.dart';

class EmojiRatingWidget extends StatefulWidget {
  const EmojiRatingWidget({
    super.key,
    this.title,
  });
  final String? title;

  @override
  State<EmojiRatingWidget> createState() => _EmojiRatingWidgetState();
}

class _EmojiRatingWidgetState extends State<EmojiRatingWidget> {
  int selected = 0;

  void changeColor(int index) {
    if (selected != index) {
      setState(() {
        selected = index;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 1.h),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Accessibility",
            style: TextConstants.bodySmall_black_normal(context),
          ),
          SizedBox(
            height: 1.h,
          ),
          Row(
            children: [
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    changeColor(1);
                  },
                  child: Container(
                    height: 5.h,
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    decoration: BoxDecoration(
                        color: selected == 1
                            ? AppColors.kBlueMediumShade
                            : Colors.transparent,
                        border: Border.all(color: AppColors.kBlueMediumShade),
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(50),
                          bottomLeft: Radius.circular(50),
                        )),
                    child: SvgPicture.asset(
                      SvgAssets.emoji_sad,
                      color: selected == 1
                          ? Colors.white
                          : AppColors.kBlueMediumShade,
                    ),
                  ),
                ),
              ),
              Expanded(
                  child: GestureDetector(
                onTap: () {
                  changeColor(2);
                },
                child: Container(
                  height: 5.h,
                  padding: EdgeInsets.symmetric(vertical: 1.h),
                  decoration: BoxDecoration(
                    color: selected == 2
                        ? AppColors.kBlueMediumShade
                        : Colors.transparent,
                    border: Border.all(color: AppColors.kBlueMediumShade),
                  ),
                  child: SvgPicture.asset(
                    SvgAssets.emoji_normal,
                    color: selected == 2
                        ? Colors.white
                        : AppColors.kBlueMediumShade,
                  ),
                ),
              )),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    changeColor(3);
                  },
                  child: Container(
                    height: 5.h,
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    decoration: BoxDecoration(
                      color: selected == 3
                          ? AppColors.kBlueMediumShade
                          : Colors.transparent,
                      border: Border.all(color: AppColors.kBlueMediumShade),
                    ),
                    child: SvgPicture.asset(
                      SvgAssets.emoji_smile,
                      color: selected == 3
                          ? Colors.white
                          : AppColors.kBlueMediumShade,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: GestureDetector(
                  onTap: () {
                    changeColor(4);
                  },
                  child: Container(
                    height: 5.h,
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    decoration: BoxDecoration(
                        color: selected == 4
                            ? AppColors.kBlueMediumShade
                            : Colors.transparent,
                        border: Border.all(color: AppColors.kBlueMediumShade),
                        borderRadius: const BorderRadius.only(
                          topRight: Radius.circular(50),
                          bottomRight: Radius.circular(50),
                        )),
                    child: SvgPicture.asset(
                      SvgAssets.emoji_happy,
                      color: selected == 4
                          ? Colors.white
                          : AppColors.kBlueMediumShade,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
