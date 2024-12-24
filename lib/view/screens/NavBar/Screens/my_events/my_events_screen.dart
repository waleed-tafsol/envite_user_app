import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/MyEventsController.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/my_events/widgets/my_events_list_tile.dart';
import 'package:event_planner_light/view/widgets/SearchEventWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Test.dart';
import '../../../../../shimmer_loaders/event_tile_shimmer.dart';
import '../../../../../utills/enums.dart';
import '../../../../widgets/EventTileWidget.dart';
import '../../../view_all_my_events_screen.dart';

class MyEventsScreen extends GetView<MyEventsController> {
  static const routeName = 'MyEventsScreen';

  MyEventsScreen({super.key});

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
                        controller.myEventsScreenType.value =
                            Events.myPastEvents.text;
                        controller.getMyPaginatedEvents();
                        Get.toNamed(ViewAllMyEventsScreen.routeName);
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
                        : controller.myEventModel.value.pastEvents!.isNotEmpty?ListView.builder(
                            itemCount: controller.myEventModel.value.pastEvents!.length,
                            scrollDirection: Axis.horizontal,
                            shrinkWrap: true,
                            itemBuilder: (BuildContext context, int index) {
                              return EventTileWidget(
                                width: 80.w,
                                pinned: true,
                                event: controller.myEventModel.value.pastEvents![index],
                              );
                            }) : SizedBox(
                      height: 40.h,
                      child: Center(
                        child: Text(
                          "No Past Events are available",
                          style: TextStyle(
                              fontSize: 18.sp,
                              color: AppColors.kTextBlack),
                        ),
                      ),
                    );
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
                        controller.myEventsScreenType.value =
                            Events.myUpcomingEvents.text;
                        controller.getMyPaginatedEvents();
                        Get.toNamed(ViewAllMyEventsScreen.routeName);
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
                    : controller.myEventModel.value.upcomingEvents!.isNotEmpty?ListView.builder(
                        itemCount: controller.myEventModel.value.upcomingEvents!.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return EventTileWidget(
                            pinned: true,
                            event: controller.myEventModel.value.upcomingEvents![index],
                          );
                        }) : SizedBox(
                  height: 40.h,
                  child: Center(
                    child: Text(
                      "No Upcoming Events are available",
                      style: TextStyle(
                          fontSize: 18.sp,
                          color: AppColors.kTextBlack),
                    ),
                  ),
                );
              })
            ],
          ),
        ),
      ),
    );
  }
}
