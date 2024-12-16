import 'package:event_planner_light/controllers/ExploreController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../Test.dart';
import '../../../../../constants/assets.dart';
import '../../../../../constants/colors_constants.dart';
import '../../../../../utills/ConvertDateTime.dart';
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
                child: Text("Previous Events",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.kTextBlack)),
              ),
              SizedBox(
                height: 10.h,
                child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    physics: const NeverScrollableScrollPhysics(),
                    // shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 4.0),
                        child: Stack(
                          children: [
                            ClipRRect(
                                borderRadius: BorderRadius.circular(5),
                                child: Image.asset(Assets.squareImage)),
                            Positioned(
                              top: 2,
                              left: 2,
                              child: EventTileDateBadge(
                                date: extractDate(eventObject.startDate ?? ""),
                                month: extractMonthInitials(
                                    eventObject.startDate ?? ""),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Text("Active Events",
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
                    return EventTileWidget(
                      pinned: true,
                      event: eventObject,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
