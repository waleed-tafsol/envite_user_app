import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/widgets/ad_chips.dart';
import 'package:event_planner_light/view/widgets/bullet_points.dart';
import 'package:event_planner_light/view/widgets/membership_container.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MemberShipScreen extends StatelessWidget {
  static const routeName = 'MembershipScreen';
  const MemberShipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F8EF),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Membership'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MemberShipChips(),
            SizedBox(
              height: 2.h,
            ),
            MembershipContainer(),
            SizedBox(
              height: 1.h,
            ),
            MembershipContainer()
          ],
        ),
      ),
    );
  }
}
