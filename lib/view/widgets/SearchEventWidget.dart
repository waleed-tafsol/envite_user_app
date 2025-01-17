import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/view/widgets/BottomModelSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class SearchEventWidget extends StatelessWidget {
  const SearchEventWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        InkWell(
            onTap: () => BottomSheetManager.filter(context),
            child: SvgPicture.asset(SvgAssets.filter,width: 24.w,)),
        SizedBox(width: 13.w,),
        const Expanded(
          child: TextField(
            decoration: InputDecoration(
                suffixIcon: Icon(Icons.search,), hintText: "Search an event"),
          ),
        )
      ],
    );
  }
}
