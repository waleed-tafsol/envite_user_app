import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ChooseyourlocationScreen extends StatelessWidget {
  const ChooseyourlocationScreen({super.key});
  static const routeName = "ChooseyourlocationScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Choose your location",
            style: Theme.of(context)
                .textTheme
                .bodyMedium!
                .copyWith(color: AppColors.kTextBlack)),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(vertical: 4.h),
              child: Image.asset(Assets.location),
            ),
            const TextField(
              decoration: InputDecoration(
                  hintText: "Search event in...",
                  prefixIcon: Icon(Icons.location_on_outlined)),
            ),
            SizedBox(
              height: 4.h,
            ),
            Text(
                "Let’s find your next event! Search for a location to get started or enable your current location below.",
                style: Theme.of(context)
                    .textTheme
                    .bodySmall!
                    .copyWith(color: AppColors.kTextBlack)),
            SizedBox(
              height: 5.h,
            ),
            SizedBox(
              width: double.infinity,
              height: 6.h,
              child: OutlinedButton(
                onPressed: () async {},
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
                    const Icon(
                      Icons.location_searching_outlined,
                      color: AppColors.kIconColor,
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    Text('Use my current location',
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: AppColors.kBluedarkShade)),
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
