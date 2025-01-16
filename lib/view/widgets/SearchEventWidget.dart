import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/view/widgets/BottomModelSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SearchEventWidget extends StatelessWidget {
  const SearchEventWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10.w,
          child: InkWell(
              onTap: () => BottomSheetManager.filter(context),
              child: SvgPicture.asset(SvgAssets.filter,width: 5.w,)),
        ),
        SizedBox(width: 1.w,),
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
