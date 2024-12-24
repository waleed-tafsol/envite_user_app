import 'package:event_planner_light/controllers/MyEventsController.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../shimmer_loaders/event_tile_shimmer.dart';
import '../../utills/enums.dart';
import '../widgets/EventTileWidget.dart';
import '../widgets/SearchEventWidget.dart';

class ViewAllMyEventsScreen extends StatelessWidget  {
  const ViewAllMyEventsScreen({super.key});
  static const routeName = "view_all_my_events_screen";

  @override
  Widget build(BuildContext context) {
    MyEventsController myEventsController = Get.find();

    return Scaffold(
      appBar: AppBar(
        title:  Text(myEventsController.myEventsScreenType.value),
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
                return myEventsController.isEventLoading.value
                    ? ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children:
                  List.generate(5, (index) => eventTileShimmer()),
                )
                    :
                   ListView.builder(
                      itemCount: myEventsController.myEventsScreenType.value == Events.myPastEvents.text? myEventsController.myPastEvents.length:myEventsController.myUpcomingEvents.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return EventTileWidget(
                          pinned: true,
                          event: myEventsController.myEventsScreenType.value == Events.myPastEvents.text?myEventsController.myPastEvents[index]:myEventsController.myUpcomingEvents[index],
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
