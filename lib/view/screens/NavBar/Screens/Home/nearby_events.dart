import 'package:dotted_border/dotted_border.dart';
import 'package:event_planner_light/constants/StyleConstants.dart';
import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class NearbyEvents extends StatelessWidget {
  static const routeName = '/NearbyEvents';
  const NearbyEvents({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Find Nearby Events'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(
              height: 1.h,
            ),
            Stack(children: [
              ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    fit: BoxFit.cover,
                    Assets.eventCanvas,
                    width: double.infinity,
                  )),
              // Positioned(
              //     right: 1.w, child: SvgPicture.asset(SvgAssets.image_pen))
            ]),
            SizedBox(height: 1.h),
            TextField(
              decoration: InputDecoration(hintText: "Event Type"),
            ),
            SizedBox(
              height: 1.h,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Address"),
            ),
            SizedBox(
              height: 1.h,
            ),
            TextField(
              decoration: InputDecoration(hintText: "Date Of the Event"),
            ),
            Spacer(),
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                  style: StylesConstants.elevated_b_redBack_whiteFore,
                  onPressed: () {
                    // Get.offNamed(DrawerScreen.routeName);
                  },
                  child: Text("Find Event")),
            ),
            SizedBox(
              height: 1.h,
            ),
          ],
        ),
      ),
    );
  }
}
