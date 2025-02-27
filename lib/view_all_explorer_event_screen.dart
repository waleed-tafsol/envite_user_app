import 'package:event_planner_light/shimmer_loaders/event_tile_shimmer.dart';
import 'package:event_planner_light/view/screens/filtered_list_view.dart';
import 'package:event_planner_light/view/widgets/EventTileWidget.dart';
import 'package:event_planner_light/view/widgets/SearchEventWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      // appBar: AppBar(
      //   title: Text(exploreEventsController.exploreEventsScreenType.value),
      // ),
      body: SafeArea(
        child: PopScope(
          canPop: true,
          onPopInvokedWithResult: (bool didPop, Object? result) {
            filtersController.clearFilterData(resetSelectScreenStatus: true);
          },
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SearchEventWidget(),
                SizedBox(
                  height: 2.h,
                ),
                /*  Padding(h                padding: EdgeInsets.only( top: 2.h),
                  child: Text("Past Events",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: AppColors.kTextBlack)),
                ),*/
                Expanded(
                  child: Obx(() {
                    return filtersController.isFilterActivated.value
                        ? FilteredListView()
                        : exploreEventsController.isEventLoading.value
                            ? ListView(
                                physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                children: List.generate(
                                    5, (index) => eventTileShimmer()),
                              )
                            : ListView.builder(
                                // physics: const NeverScrollableScrollPhysics(),
                                shrinkWrap: true,
                                controller:
                                    exploreEventsController.scrollController,
                                itemCount: exploreEventsController
                                        .exploreEventsViewAllList.length +
                                    (exploreEventsController.hasMore.value
                                        ? 1
                                        : 0),
                                itemBuilder: (BuildContext context, int index) {
                                  if (index ==
                                      exploreEventsController
                                          .exploreEventsViewAllList.length) {
                                    return const Center(
                                        child: Text(
                                      'Loading... ',
                                      style: TextStyle(color: Colors.redAccent),
                                    ));
                                  }
                                  return EventTileWidget(
                                      event: exploreEventsController
                                          .exploreEventsViewAllList[index]);
                                });
                  }),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
