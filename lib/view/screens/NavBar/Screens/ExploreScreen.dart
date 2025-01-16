import 'package:event_planner_light/view/widgets/EventTileWidget.dart';
import 'package:event_planner_light/view/widgets/SearchEventWidget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../constants/colors_constants.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              const SearchEventWidget(),
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Text("Filtered search",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(color: AppColors.kTextBlack)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Text("All events",
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                  ],
                ),
              ),
              ListView.builder(
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return const EventTileWidget(
                      pinned: true,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
