import 'package:event_planner_light/controllers/ExploreController.dart';
import 'package:event_planner_light/controllers/view_all_events_controller.dart';
import 'package:event_planner_light/view/screens/view_all_events_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../Test.dart';
import '../../../../../constants/colors_constants.dart';
import '../../../../../utills/enums.dart';
import '../../../../widgets/EventTileWidget.dart';
import '../../../../widgets/SearchEventWidget.dart';

class ExploreScreen extends GetView<ExploreController> {
   ExploreScreen({super.key});

 final ViewAllEventsController viewAllEventsController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchEventWidget(),
              Padding(
                padding: EdgeInsets.only(bottom: 1.h, top: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("Past Events",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppColors.kTextBlack)),
                    InkWell(
                      onTap: () {
                        viewAllEventsController.eventsType.value =
                            Events.explorerPastEvent.text;
                        Get.toNamed(ViewAllEventsScreen.routeName);
                      },
                      child: Text(
                        "View All",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 15.h,
                child: ListView.builder(
                    itemCount: 3,
                    scrollDirection: Axis.horizontal,
                    physics: const BouncingScrollPhysics(),
                    // shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 4.0),
                          child: EventTileWidget(
                            width: 80.w,
                            pinned: true,
                            event: eventObject,
                          ));
                    }),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Upcoming Events",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppColors.kTextBlack)),
                    InkWell(
                      onTap: () {
                        viewAllEventsController.eventsType.value =
                            Events.explorerUpcomingEvent.text;

                        Get.toNamed(ViewAllEventsScreen.routeName);
                      },
                      child: Text(
                        "View All",
                        style: Theme.of(context).textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
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
