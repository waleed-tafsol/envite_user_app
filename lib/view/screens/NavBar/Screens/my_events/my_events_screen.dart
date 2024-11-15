import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/my_events/widgets/my_events_list_tile.dart';
import 'package:event_planner_light/view/widgets/BottomModelSheet.dart';
import 'package:event_planner_light/view/widgets/EventTileWidget.dart';
import 'package:event_planner_light/view/widgets/SearchEventWidget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MyEventsScreen extends StatefulWidget {
  static const routeName = 'MyEventsScreen';
  const MyEventsScreen({super.key});

  @override
  State<MyEventsScreen> createState() => _MyEventsScreenState();
}

class _MyEventsScreenState extends State<MyEventsScreen> {
  final List<String> eventType = [
    'All Events',
    'Past Events',
    'Upcoming Events'
  ];
  String _selectedEventType = 'All Events';
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
              Padding(
                padding: EdgeInsets.only(top: 1.h),
                child: Row(
                  children: [
                    Text(
                      "My Events",
                      style: Theme.of(context)
                          .textTheme
                          .bodyMedium!
                          .copyWith(color: AppColors.kTextBlack),
                    ),
                    Spacer(),
                    PopupMenuButton<String>(
                      onSelected: (String newValue) {
                        setState(() {
                          _selectedEventType = newValue;
                        });
                      },
                      itemBuilder: (BuildContext context) {
                        return eventType
                            .map<PopupMenuItem<String>>((String value) {
                          return PopupMenuItem<String>(
                            value: value,
                            child: Text(value),
                          );
                        }).toList();
                      },
                      child: Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                        ),
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //     color: AppColors.kTextfieldBorderColor),
                          borderRadius: BorderRadius.circular(50),
                          // color: Colors.white,
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              _selectedEventType,
                              style: const TextStyle(
                                fontSize: 14,
                                color: Colors.black,
                              ),
                            ),
                            const Icon(
                              Icons.arrow_drop_down,
                              color: Colors.black,
                            ),
                          ],
                        ),
                      ),
                    )
                  ],
                ),
              ),
              ListView.builder(
                  itemCount: 6,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return const MyEventsListTile(
                      pinned: true,
                    );
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
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.kPrimaryColor),
                        onPressed: () {
                          // Get.toNamed(GenerateTicketScreen.routeName);
                        },
                        child: Text(
                          'Add the Event',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
