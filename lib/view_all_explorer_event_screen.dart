import 'package:event_planner_light/shimmer_loaders/event_tile_shimmer.dart';
import 'package:event_planner_light/utills/enums.dart';
import 'package:event_planner_light/view/screens/filtered_list_view.dart';
import 'package:event_planner_light/view/widgets/EventTileWidget.dart';
import 'package:event_planner_light/view/widgets/SearchEventWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controllers/ExploreController.dart';
import 'controllers/filters_controller.dart';

class ViewAllExplorerEventScreen extends StatelessWidget {
  const ViewAllExplorerEventScreen({super.key});

  static const routeName = "view_all_explorer_events_screen";

  @override
  Widget build(BuildContext context) {
    ExploreController exploreEventsController = Get.find();
    FiltersController filtersController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title: Text(exploreEventsController.exploreEventsScreenType.value),
      ),
      body: PopScope(
        canPop: true, //When false, blocks the current route from being popped.
        onPopInvokedWithResult: (bool didPop, Object? result) {
          filtersController.clearFilterData();
        },
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchEventWidget(),
                SizedBox(
                  height: 2.h,
                ),
                Obx(() {
                  return filtersController.isFilterActivated.value
                      ? filteredListView()
                      : exploreEventsController.isEventLoading.value
                          ? ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: List.generate(
                                  5, (index) => eventTileShimmer()),
                            )
                          : ListView.builder(
                              itemCount: exploreEventsController
                                          .exploreEventsScreenType.value ==
                                      Events.explorerPastEvent.text
                                  ? exploreEventsController
                                      .explorePastEvents.length
                                  : exploreEventsController
                                      .exploreUpcomingEvents.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return EventTileWidget(
                                  event: exploreEventsController
                                              .exploreEventsScreenType.value ==
                                          Events.explorerPastEvent.text
                                      ? exploreEventsController
                                          .explorePastEvents[index]
                                      : exploreEventsController
                                          .exploreUpcomingEvents[index],
                                );
                              });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
