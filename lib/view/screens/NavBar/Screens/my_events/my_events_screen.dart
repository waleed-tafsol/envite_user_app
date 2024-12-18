import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/MyEventsController.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/my_events/widgets/my_events_list_tile.dart';
import 'package:event_planner_light/view/widgets/SearchEventWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../Test.dart';
import '../../../../widgets/EventTileWidget.dart';

class MyEventsScreen extends GetView<MyEventsController> {
  static const routeName = 'MyEventsScreen';
  const MyEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w,vertical: 2.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchEventWidget(),
              Padding(
                padding: EdgeInsets.only(bottom: 1.h,top: 2.h),
                child: Text("My Past Events",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.kTextBlack)),
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
                child: Text("My Upcoming Events",
                    style: Theme.of(context)
                        .textTheme
                        .headlineSmall!
                        .copyWith(color: AppColors.kTextBlack)),
              ),
              ListView.builder(
                  itemCount:  controller.events.length,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return EventTileWidget(
                      pinned: true,
                      event: controller.events[index],
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
