import 'package:event_planner_light/shimmer_loaders/event_tile_shimmer.dart';
import 'package:event_planner_light/utills/enums.dart';
import 'package:event_planner_light/view/widgets/EventTileWidget.dart';
import 'package:event_planner_light/view/widgets/SearchEventWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'controllers/ExploreController.dart';

class ViewAllExplorerEventScreen extends StatelessWidget {
  const ViewAllExplorerEventScreen({super.key});
  static const routeName = "view_all_explorer_events_screen";


  @override
  Widget build(BuildContext context) {
    ExploreController exploreEventsController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title:  Text(exploreEventsController.exploreEventsScreenType.value),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchEventWidget(),
              SizedBox(height:2.h ,),
              /*  Padding(h                padding: EdgeInsets.only( top: 2.h),
                child: Text("Past Events",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.kTextBlack)),
              ),*/
              Obx( () {
                return exploreEventsController.isEventLoading.value
                    ? ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children:
                  List.generate(5, (index) => eventTileShimmer()),
                )
                    :
                ListView.builder(
                    itemCount: exploreEventsController.exploreEventsScreenType.value == Events.myPastEvents.text? exploreEventsController.explorePastEvents.length:exploreEventsController.exploreUpcomingEvents.length,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return EventTileWidget(
                        pinned: true,
                        event: exploreEventsController.exploreEventsScreenType.value == Events.myPastEvents.text?exploreEventsController.explorePastEvents[index]:exploreEventsController.exploreUpcomingEvents[index],
                      );
                    });
              }
              ),
            ],
          ),
        ),
      ),
    );
  }
}
