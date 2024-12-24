import 'package:event_planner_light/controllers/view_all_events_controller.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../Test.dart';
import '../../constants/colors_constants.dart';
import '../widgets/EventTileWidget.dart';
import '../widgets/SearchEventWidget.dart';

class ViewAllEventsScreen extends GetView<ViewAllEventsController>  {
  const ViewAllEventsScreen({super.key});
  static const routeName = "view_all_events_screen";


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:  Text(controller.eventsType.value),
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
              ListView.builder(
                  itemCount: 3,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return EventTileWidget(
                      pinned: true,
                      event: eventObject,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
