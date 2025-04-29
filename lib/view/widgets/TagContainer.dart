import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../utills/string_decoration.dart';

class TagsContainer extends StatelessWidget {
  const TagsContainer({
    super.key,
    required this.tag,
  });

  final String tag;

  @override
  Widget build(BuildContext context) {
    return ConstrainedBox(
      constraints: BoxConstraints(
        minWidth: 20.w,
      ),
      child: Container(
        alignment: Alignment.center,
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
        ),
        padding: EdgeInsets.symmetric(
          horizontal: 1.w,
          vertical: 0.5.h,
        ),
        child: Text(
          capitalizeFirstLetter(tag),
          style: TextStyle(
            color: Colors.black, // Changed text color to black for readability
            fontSize: 12.sp,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 1,
        ),
      ),
    );
  }
}
