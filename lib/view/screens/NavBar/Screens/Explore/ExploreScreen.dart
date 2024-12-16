import 'package:event_planner_light/controllers/ExploreController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../constants/colors_constants.dart';
import '../../../../widgets/EventTileWidget.dart';
import '../../../../widgets/SearchEventWidget.dart';

class ExploreScreen extends GetView<ExploreController> {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchEventWidget(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Text("Active Events",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.kTextBlack)),
              ),
              ListView.builder(
                  itemCount: 0,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return const EventTileWidget(
                      pinned: true,
                    );
                  }),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Text("Previous Events",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.kTextBlack)),
              ),
              ListView.builder(
                  itemCount: 3,
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
