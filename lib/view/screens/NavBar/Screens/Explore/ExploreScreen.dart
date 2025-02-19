import 'package:event_planner_light/controllers/ExploreController.dart';
import 'package:event_planner_light/view/screens/filtered_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../constants/colors_constants.dart';
import '../../../../../controllers/filters_controller.dart';
import '../../../../../shimmer_loaders/event_tile_shimmer.dart';
import '../../../../../utills/enums.dart';
import '../../../../../view_all_explorer_event_screen.dart';
import '../../../../widgets/EventTileWidget.dart';
import '../../../../widgets/SearchEventWidget.dart';

class ExploreScreen extends GetView<ExploreController> {
  static const routeName = 'explorerScreen';

  ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    FiltersController filtersController = Get.find();
    // filtersController.showMyEvents.value = true;
    // controller.exploreEventsScreenType.value =
    //     Events.explorerUpcomingEvent.text;
    // filtersController.clearFilterData(resetSelectScreenStatus: false);
    // filtersController.setSelectedScreen(
    //     value: Events.explorerUpcomingEvent.text);
    // controller.getExplorerPaginatedEvents(callFirstTime: true);
    // Get.toNamed(ViewAllExplorerEventScreen.routeName);
    // ExploreController exploreEventsController = Get.find();
    // FiltersController filtersController = Get.find();
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () =>
            controller.getExplorerPaginatedEvents(callFirstTime: true),
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              children: [
                SearchEventWidget(),
                Obx(() {
                  return filtersController.isFilterActivated.value
                      ? FilteredListView()
                      : Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Padding(
                            //   padding: EdgeInsets.only(bottom: 1.h, top: 2.h),
                            //   child: Row(
                            //     mainAxisAlignment:
                            //         MainAxisAlignment.spaceBetween,
                            //     crossAxisAlignment: CrossAxisAlignment.end,
                            //     children: [
                            //       Text("Past Events",
                            //           style: Theme.of(context)
                            //               .textTheme
                            //               .headlineSmall!
                            //               .copyWith(
                            //                   color: AppColors.kTextBlack)),
                            //       Obx(() {
                            //         return InkWell(
                            //           onTap: () {
                            //             controller
                            //                     .exploreEventsScreenType.value =
                            //                 Events.explorerPastEvent.text;
                            //             filtersController.clearFilterData(
                            //                 resetSelectScreenStatus: false);
                            //             filtersController.setSelectedScreen(
                            //                 value:
                            //                     Events.explorerPastEvent.text);
                            //             controller.getExplorerPaginatedEvents(
                            //                 callFirstTime: true);
                            //             Get.toNamed(ViewAllExplorerEventScreen
                            //                 .routeName);
                            //           },
                            //           child: Visibility(
                            //             visible: controller.exploreEventModel
                            //                         .value.pastEvents !=
                            //                     null &&
                            //                 controller.exploreEventModel.value
                            //                     .pastEvents!.isNotEmpty,
                            //             child: Text(
                            //               "View All",
                            //               style: Theme.of(context)
                            //                   .textTheme
                            //                   .bodySmall,
                            //             ),
                            //           ),
                            //         );
                            //       }),
                            //     ],
                            //   ),
                            // ),
                            // SizedBox(
                            //   height: 15.h,
                            //   child: Obx(() {
                            //     return controller.isEventLoading.value
                            //         ? ListView(
                            //             scrollDirection: Axis.horizontal,
                            //             children: List.generate(
                            //                 5,
                            //                 (index) => eventTileShimmer(
                            //                       tileWidth: 80.w,
                            //                     )),
                            //           )
                            //         : controller.exploreEventModel.value
                            //                 .pastEvents!.isNotEmpty
                            //             ? ListView.builder(
                            //                 itemCount: controller
                            //                     .exploreEventModel
                            //                     .value
                            //                     .pastEvents!
                            //                     .length,
                            //                 scrollDirection: Axis.horizontal,
                            //                 physics:
                            //                     const BouncingScrollPhysics(),
                            //                 // shrinkWrap: true,
                            //                 itemBuilder: (BuildContext context,
                            //                     int index) {
                            //                   return Padding(
                            //                       padding: const EdgeInsets
                            //                           .symmetric(
                            //                           horizontal: 4.0),
                            //                       child: EventTileWidget(
                            //                         width: 80.w,
                            //                         event: controller
                            //                             .exploreEventModel
                            //                             .value
                            //                             .pastEvents![index],
                            //                       ));
                            //                 })
                            //             : SizedBox(
                            //                 height: 40.h,
                            //                 child: Center(
                            //                   child: Column(
                            //                     mainAxisAlignment:
                            //                         MainAxisAlignment.center,
                            //                     children: [
                            //                       Icon(
                            //                         Icons.event_busy_outlined,
                            //                         color: AppColors
                            //                             .kBluedarkShade,
                            //                       ),
                            //                       Text(
                            //                         "No Past are available",
                            //                         style: TextStyle(
                            //                             fontSize: 14.sp,
                            //                             color: AppColors
                            //                                 .kBluedarkShade),
                            //                       ),
                            //                     ],
                            //                   ),
                            //                 ),
                            //               );
                            //   }),
                            // ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 1.h),
                              child: Row(
                                crossAxisAlignment: CrossAxisAlignment.end,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text("Upcoming Events",
                                      style: Theme.of(context)
                                          .textTheme
                                          .headlineSmall!
                                          .copyWith(
                                              color: AppColors.kTextBlack)),
                                  Obx(() {
                                    return InkWell(
                                      onTap: () {
                                        controller
                                                .exploreEventsScreenType.value =
                                            Events.explorerUpcomingEvent.text;
                                        filtersController.clearFilterData(
                                            resetSelectScreenStatus: false);
                                        filtersController.setSelectedScreen(
                                            value: Events
                                                .explorerUpcomingEvent.text);
                                        controller.getExplorerPaginatedEvents(
                                            callFirstTime: true);
                                        Get.toNamed(ViewAllExplorerEventScreen
                                            .routeName);
                                      },
                                      child: Visibility(
                                        visible: controller.exploreEventModel
                                                    .value.upcomingEvents !=
                                                null &&
                                            controller.exploreEventModel.value
                                                .upcomingEvents!.isNotEmpty,
                                        child: Text(
                                          "View All",
                                          style: Theme.of(context)
                                              .textTheme
                                              .bodySmall,
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
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      children: List.generate(
                                          5, (index) => eventTileShimmer()),
                                    )
                                  : controller.exploreEventModel.value
                                          .upcomingEvents!.isNotEmpty
                                      ? ListView.builder(
                                          itemCount: controller
                                              .exploreEventModel
                                              .value
                                              .upcomingEvents!
                                              .length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return EventTileWidget(
                                              event: controller
                                                  .exploreEventModel
                                                  .value
                                                  .upcomingEvents![index],
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
                                                  color:
                                                      AppColors.kBluedarkShade,
                                                ),
                                                Text(
                                                  "No Upcoming Events are available",
                                                  style: TextStyle(
                                                      fontSize: 14.sp,
                                                      color: AppColors
                                                          .kBluedarkShade),
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                            }),
                          ],
                        );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
