import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/MyEventsController.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/my_events/widgets/my_events_list_tile.dart';
import 'package:event_planner_light/view/widgets/SearchEventWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Test.dart';
import '../../../../../controllers/view_all_events_controller.dart';
import '../../../../../shimmer_loaders/event_tile_shimmer.dart';
import '../../../../../utills/enums.dart';
import '../../../../widgets/EventTileWidget.dart';
import '../../../view_all_events_screen.dart';

class MyEventsScreen extends GetView<MyEventsController> {
  static const routeName = 'MyEventsScreen';

  MyEventsScreen({super.key});

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
              // const SearchEventWidget(),
              Padding(
                padding: EdgeInsets.only(bottom: 1.h, top: 2.h),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text("My Past Events",
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
                child: Obx(
                  () {
                    return controller.isEventLoading.value
                        ? ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                                5,
                                (index) => eventTileShimmer(
                                      tileWidth: 80.w,
                                    )),
                          )
                        : ListView.builder(
                            itemCount: controller.events.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return EventTileWidget(
                                width: 80.w,
                                pinned: true,
                                event: controller.events[index],
                              );
                            });
                  },
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("My Upcoming Events",
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
              Obx(() {
                return controller.isEventLoading.value
                    ? ListView(
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        children:
                            List.generate(5, (index) => eventTileShimmer()),
                      )
                    : ListView.builder(
                        itemCount: controller.events.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return EventTileWidget(
                            pinned: true,
                            event: controller.events[index],
                          );
                        });
              })
            ],
          ),
        ),
      ),
    );
  }
}
