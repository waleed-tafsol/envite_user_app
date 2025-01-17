import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChooseyourlocationScreen extends StatelessWidget {
  const ChooseyourlocationScreen({super.key});
  static const routeName = "ChooseyourlocationScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Choose your location",
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 29.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 15.h),
              child: Image.asset(
                Assets.location,
                width: 200.w,
              ),
            ),
            const TextField(
              decoration: InputDecoration(
                  hintText: "Search event in...",
                  prefixIcon: Icon(Icons.location_on_outlined)),
            ),
            SizedBox(
              height: 19.h,
            ),
            Text(
                "Let’s find your next event! Search for a location to get started or enable your current location below.",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.kTextBlack, fontSize: 11.sp)),
            SizedBox(
              height: 19.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 60.h,
              child: OutlinedButton(
                onPressed: () {
                  // Get.toNamed(NearbyEvents.routeName);
                },
                style: OutlinedButton.styleFrom(
                  backgroundColor: Colors.transparent,
                  side: const BorderSide(
                      width: 1, color: AppColors.kBerkeleyBlue),
                  padding:
                      const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.location_searching_outlined,
                      color: AppColors.kIconColor,
                      size: 24.sp,
                    ),
                    SizedBox(
                      width: 12.w,
                    ),
                    Text('Use my current location',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(
                                color: AppColors.kBluedarkShade,
                                fontSize: 16.sp)),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
