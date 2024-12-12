import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/MyEventsController.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/my_events/widgets/my_events_list_tile.dart';
import 'package:event_planner_light/view/widgets/SearchEventWidget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyEventsScreen extends GetView<MyEventsController> {
  static const routeName = 'MyEventsScreen';
  const MyEventsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SearchEventWidget(),
              Obx(() {
                return controller.isEventLoading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: controller.events.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return MyEventsListTile(
                            pinned: true,
                            event: controller.events[index],
                          );
                        });
              }),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     InkWell(
              //       onTap: () => BottomSheetManager.eventAdded(context),
              //       child: Text(
              //         "Ended events",
              //         style: Theme.of(context).textTheme.headlineMedium,
              //       ),
              //     ),
              //     Text(
              //       "See all",
              //       style: Theme.of(context).textTheme.bodySmall,
              //     )
              //   ],
              // ),
              // ListView.builder(
              //     itemCount: 10,
              //     physics: const NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     itemBuilder: (BuildContext context, int index) {
              //       return const EventTileWidget();
              //     }),
              // SizedBox(
              //   height: 6.h,
              //   width: double.infinity,
              //   child: ElevatedButton(
              //       style: StylesConstants.elevated_b_redBack_whiteFore,
              //       onPressed: () {},
              //       child: const Text("Add the event")),
              // ),
              SizedBox(
                height: 2.h,
              ),
              // Row(
              //   children: [
              //     Expanded(
              //       child: ElevatedButton(
              //           style: ElevatedButton.styleFrom(
              //               backgroundColor: AppColors.kPrimaryColor),
              //           onPressed: () {
              //             // Get.toNamed(GenerateTicketScreen.routeName);
              //           },
              //           child: Text(
              //             'Add the Event',
              //             style: TextStyle(color: Colors.white),
              //           )),
              //     ),
              //   ],
              // )
            ],
          ),
        ),
      ),
    );
  }
}
