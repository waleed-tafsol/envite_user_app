import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/MyEventsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../controllers/filters_controller.dart';
import '../../../../../shimmer_loaders/event_tile_shimmer.dart';
import '../../../../../utills/enums.dart';
import '../../../../widgets/EventTileWidget.dart';
import '../../../view_all_my_events_screen.dart';

class MyEventsScreen extends GetView<MyEventsController> {
  static const routeName = 'MyEventsScreen';

  MyEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FiltersController filtersController = Get.find();
    filtersController.showMyEvents.value = false;
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () {
          return controller.getMyPaginatedEvents(callFirstTime: true);
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
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
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            controller.myEventsScreenType.value =
                                Events.myPastEvents.text;
                            filtersController.clearFilterData();
                            filtersController.setSelectedScreen(
                                value: Events.myPastEvents.text);
                            controller.getMyPaginatedEvents(
                                callFirstTime: true);
                            Get.toNamed(ViewAllMyEventsScreen.routeName);
                          },
                          child: Visibility(
                            visible: controller.myEventModel.value.pastEvents !=
                                    null &&
                                controller
                                    .myEventModel.value.pastEvents!.isNotEmpty,
                            child: Text(
                              "View All",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        );
                      }),
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
                          : controller.myEventModel.value.pastEvents!.isNotEmpty
                              ? ListView.builder(
                                  itemCount: controller
                                      .myEventModel.value.pastEvents!.length,
                                  scrollDirection: Axis.horizontal,
                                  shrinkWrap: true,
                                  itemBuilder:
                                      (BuildContext context, int index) {
                                    return EventTileWidget(
                                      width: 80.w,
                                      event: controller.myEventModel.value
                                          .pastEvents![index],
                                    );
                                  })
                              : SizedBox(
                                  height: 40.h,
                                  child: Center(
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(
                                          Icons.event_busy_outlined,
                                          color: AppColors.kBluedarkShade,
                                        ),
                                        Text(
                                          "No Past Events are available",
                                          style: TextStyle(
                                              fontSize: 14.sp,
                                              color: AppColors.kBluedarkShade),
                                        ),
                                      ],
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
                      Obx(() {
                        return InkWell(
                          onTap: () {
                            controller.myEventsScreenType.value =
                                Events.myUpcomingEvents.text;
                            filtersController.clearFilterData();
                            filtersController.setSelectedScreen(
                                value: Events.myUpcomingEvents.text);
                            controller.getMyPaginatedEvents(
                                callFirstTime: true);
                            Get.toNamed(ViewAllMyEventsScreen.routeName);
                          },
                          child: Visibility(
                            visible:
                                controller.myEventModel.value.upcomingEvents !=
                                        null &&
                                    controller.myEventModel.value
                                        .upcomingEvents!.isNotEmpty,
                            child: Text(
                              "View All",
                              style: Theme.of(context).textTheme.bodySmall,
                            ),
                          ),
                        );
                      }),
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
                      : controller.myEventModel.value.upcomingEvents!.isNotEmpty
                          ? ListView.builder(
                              itemCount: controller
                                  .myEventModel.value.upcomingEvents!.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return EventTileWidget(
                                  event: controller.myEventModel.value
                                      .upcomingEvents![index],
                                );
                              })
                          : SizedBox(
                              height: 40.h,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.event_busy_outlined,
                                      color: AppColors.kBluedarkShade,
                                    ),
                                    Text(
                                      "No Upcoming Events are available",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.kBluedarkShade),
                                    ),
                                  ],
                                ),
                              ),
                            );
                })
              ],
            ),
          ),
        ),
      ),
    );
  }
}
