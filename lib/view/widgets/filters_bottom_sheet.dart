import 'package:event_planner_light/controllers/filters_controller.dart';
import 'package:event_planner_light/utills/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors_constants.dart';
import '../../controllers/HomeScreenController.dart';

Future filterBottomSheet({required BuildContext screenContext}) {
  HomeScreenController homeScreenController = Get.find();
  FiltersController filtersController = Get.find();
  final List<String> eventType = ['Public', 'Exclusive'];
  return showModalBottomSheet(
    isScrollControlled: true,
    context: screenContext,
    shape: const RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
    ),
    backgroundColor: AppColors.kBluedarkShade,
    builder: (BuildContext context) {
      return DraggableScrollableSheet(
          expand: false,
          initialChildSize: 0.6,
          // Start with 30% of the screen height
          minChildSize: 0.1,
          // Minimum height when dragged down
          maxChildSize: 0.9,
          // Maximum height when dragged up
          builder: (BuildContext context, ScrollController scrollController) {
            return Obx(() {
              return Padding(
                  padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.0.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Filters',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                  fontSize: 18.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w500),
                            ),
                            TextButton(
                              onPressed: () {
                                filtersController.clearFilterData();
                              },
                              child: Text(
                                'Reset all',
                                textAlign: TextAlign.center,
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        fontSize: 15.sp, color: Colors.white54),
                              ),
                            )
                          ],
                        ),
                      ),
                      const Divider(),
                      SizedBox(height: 2.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'By categories',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      SizedBox(
                        height: 20.h,
                        //  width: 200,
                        child: Scrollbar(
                          thumbVisibility: true,
                          child: SingleChildScrollView(
                            child: Align(
                                alignment: Alignment.centerLeft,
                                child: Wrap(
                                  crossAxisAlignment: WrapCrossAlignment.start,
                                  // Align items to the start
                                  spacing: 3.0.w,
                                  // Space between the chips
                                  runSpacing: -2.w,
                                  children: List<Widget>.generate(
                                    homeScreenController.categories.length,
                                    (int index) {
                                      return Padding(
                                        padding: const EdgeInsets.symmetric(
                                            vertical: 4.0),
                                        child: ChoiceChip(
                                          label: Text(
                                            homeScreenController
                                                .categories[index].name!.en!,
                                          ),
                                          selected: filtersController.categories
                                              .contains(homeScreenController
                                                  .categories[index].slug),
                                          //   selected: _selectedChipIndex == index,
                                          onSelected: (bool selected) {
                                            filtersController
                                                .addAndRemoveCategories(
                                                    homeScreenController
                                                        .categories[index].slug!);
                                          },
                                        ),
                                      );
                                    },
                                  ).toList(),
                                )),
                          ),
                        ),
                      ),
                      SizedBox(height: 2.h),
                      Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          'Event type',
                          textAlign: TextAlign.center,
                          style: Theme.of(context)
                              .textTheme
                              .headlineMedium!
                              .copyWith(color: Colors.white),
                        ),
                      ),
                      SizedBox(height: 1.h),
                      Align(
                          alignment: Alignment.centerLeft,
                          child: Row(
                              spacing: 3.0.w, // Space between the chips
                              children: [
                                ChoiceChip(
                                  label: Text(
                                    'All',
                                  ),
                                  selected: filtersController.eventType.value ==
                                      Events.all.text,
                                  onSelected: (bool selected) {
                                    filtersController.eventType.value =
                                        Events.all.text;
                                  },
                                ),
                                ChoiceChip(
                                  label: Text(
                                    'Public',
                                  ),
                                  selected: filtersController.eventType.value ==
                                      Events.public.text,
                                  onSelected: (bool selected) {
                                    filtersController.eventType.value =
                                        Events.public.text;
                                  },
                                ),
                                ChoiceChip(
                                  label: Text(
                                    'Exclusive',
                                  ),
                                  selected: filtersController.eventType.value ==
                                      Events.exclusive.text,
                                  onSelected: (bool selected) {
                                    filtersController.eventType.value =
                                        Events.exclusive.text;
                                  },
                                )
                              ])),
                      /*   Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        'By date',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(color: Colors.white),
                      ),
                    ),
                    SizedBox(height: 0.5.h),
                    SizedBox(
                      width: double.infinity,
                      height: 6.h,
                      child: OutlinedButton(
                        onPressed: () async {
                          showDatePicker(
                            context: context,
                            initialDate: DateTime.now(), // Refer step 1
                            firstDate: DateTime(DateTime.now().year - 1, DateTime.now().month,
                                DateTime.now().day),
                            lastDate: DateTime(DateTime.now().year + 1, DateTime.now().month,
                                DateTime.now().day),
                          );
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: const Color(0x0fa8dadc),
                          side: BorderSide.none,
                          padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: const Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Choose an interval',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Icon(
                              Icons.calendar_today,
                              color: Colors.white54,
                            )
                          ],
                        ),
                      ),
                    ),*/
                      SizedBox(height: 3.h),
                      ElevatedButton(
                        onPressed: () {
                          Navigator.pop(context);
                          filtersController.checkFiltersActive();
                        },
                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(5)),
                          minimumSize: Size(double.infinity, 6.h),
                          // primary: Colors.blueAccent, // Background color
                          textStyle: const TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        child: const Text('Apply filters'),
                      ),
                    ],
                  ));
            });
          });
    },
  );
}
