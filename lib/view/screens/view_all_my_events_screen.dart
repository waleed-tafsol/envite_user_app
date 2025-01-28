import 'package:event_planner_light/controllers/MyEventsController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../controllers/filters_controller.dart';
import '../../shimmer_loaders/event_tile_shimmer.dart';
import '../../utills/enums.dart';
import '../widgets/EventTileWidget.dart';
import '../widgets/SearchEventWidget.dart';
import 'filtered_list_view.dart';

class ViewAllMyEventsScreen extends StatelessWidget {
  const ViewAllMyEventsScreen({super.key});

  static const routeName = "view_all_my_events_screen";

  @override
  Widget build(BuildContext context) {
    MyEventsController myEventsController = Get.find();
    FiltersController filtersController = Get.find();
    return Scaffold(
      appBar: AppBar(
        title: Text(myEventsController.myEventsScreenType.value),
      ),
      body: PopScope(
        canPop: true, //When false, blocks the current route from being popped.
        onPopInvokedWithResult: (bool didPop, Object? result) {
          filtersController.clearFilterData();
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
                      ? filteredListView()
                      : myEventsController.isEventLoading.value
                          ? ListView(
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              children: List.generate(
                                  5, (index) => eventTileShimmer()),
                            )
                          : ListView.builder(
                              controller: myEventsController.scrollController,
                              itemCount: myEventsController
                                      .myEventsViewAllList.length +
                                  (myEventsController.hasMore.value ? 1 : 0),
                              itemBuilder: (BuildContext context, int index) {
                                if (index ==
                                    myEventsController
                                        .myEventsViewAllList.length) {
                                  return const Center(
                                      child: Text(
                                    'Loading... ',
                                    style: TextStyle(color: Colors.redAccent),
                                  ));
                                }
                                return EventTileWidget(
                                    event: myEventsController
                                        .myEventsViewAllList[index]);
                              });
                }),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
