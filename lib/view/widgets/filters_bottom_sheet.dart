import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/controllers/filters_controller.dart';
import 'package:event_planner_light/utills/enums.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors_constants.dart';
import '../../controllers/HomeScreenController.dart';

Future filterBottomSheet({required BuildContext screenContext}) {
  HomeScreenController homeScreenController = Get.find();
  FiltersController filtersController = Get.find();
  return showModalBottomSheet(
      isScrollControlled: true,
      context: screenContext,
      backgroundColor: AppColors.kBluedarkShade,
      builder: (BuildContext context) {
        return SafeArea(
          child: Wrap(children: <Widget>[
            Obx(() {
              return Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
                child: Column(
                  mainAxisSize: MainAxisSize
                      .min, // Ensures the column only takes needed space
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
                              filtersController.clearFilterData(
                                  resetSelectScreenStatus: false);
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
                      child: Scrollbar(
                        thumbVisibility: true,
                        child: SingleChildScrollView(
                          child: Align(
                            alignment: Alignment.centerLeft,
                            child: Wrap(
                              crossAxisAlignment: WrapCrossAlignment.start,
                              spacing: 3.0.w,
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
                            ),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 2.h),
                    !filtersController.showMyEvents.value ||
                            authService.me.value!.role!.first !=
                                UserRoles.user.text
                        ? Column(
                            children: [
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
                                          label: Text('All'),
                                          selected: filtersController
                                                  .eventType.value ==
                                              Events.all.text,
                                          onSelected: (bool selected) {
                                            filtersController.eventType.value =
                                                Events.all.text;
                                          },
                                        ),
                                        ChoiceChip(
                                          label: Text('Public'),
                                          selected: filtersController
                                                  .eventType.value ==
                                              Events.public.text,
                                          onSelected: (bool selected) {
                                            filtersController.eventType.value =
                                                Events.public.text;
                                          },
                                        ),
                                        ChoiceChip(
                                          label: Text('Exclusive'),
                                          selected: filtersController
                                                  .eventType.value ==
                                              Events.exclusive.text,
                                          onSelected: (bool selected) {
                                            filtersController.eventType.value =
                                                Events.exclusive.text;
                                          },
                                        ),
                                        filtersController.showMyEvents.value
                                            ? ChoiceChip(
                                                label: Text('Private'),
                                                selected: filtersController
                                                        .eventType.value ==
                                                    Events.private.text,
                                                onSelected: (bool selected) {
                                                  filtersController
                                                          .eventType.value =
                                                      Events.private.text;
                                                },
                                              )
                                            : SizedBox(),
                                      ])),
                            ],
                          )
                        : SizedBox(),
                    filtersController.showMyEvents.value &&
                            authService.me.value!.role!.first ==
                                UserRoles.eventPlanner.text
                        ? Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              SizedBox(height: 2.h),
                              Align(
                                alignment: Alignment.centerLeft,
                                child: Text(
                                  'Event Status',
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
                                  child: Wrap(
                                      spacing: 3.0.w,
                                      runSpacing: 1.h,
                                      children: [
                                        ChoiceChip(
                                          label: Text('All'),
                                          selected: filtersController
                                                  .eventStatus.value ==
                                              Events.all.text,
                                          onSelected: (bool selected) {
                                            filtersController.eventStatus
                                                .value = Events.all.text;
                                          },
                                        ),
                                        ChoiceChip(
                                          label: Text('Rejected'),
                                          selected: filtersController
                                                  .eventStatus.value ==
                                              Events.rejected.text,
                                          onSelected: (bool selected) {
                                            filtersController.eventStatus
                                                .value = Events.rejected.text;
                                          },
                                        ),
                                        ChoiceChip(
                                          label: Text('Pending'),
                                          selected: filtersController
                                                  .eventStatus.value ==
                                              Events.pending.text,
                                          onSelected: (bool selected) {
                                            filtersController.eventStatus
                                                .value = Events.pending.text;
                                          },
                                        ),
                                        ChoiceChip(
                                          label: Text('Approved'),
                                          selected: filtersController
                                                  .eventStatus.value ==
                                              Events.approved.text,
                                          onSelected: (bool selected) {
                                            filtersController.eventStatus
                                                .value = Events.approved.text;
                                          },
                                        ),
                                        ChoiceChip(
                                          label: Text('Completed'),
                                          selected: filtersController
                                                  .eventStatus.value ==
                                              Events.completed.text,
                                          onSelected: (bool selected) {
                                            filtersController.eventStatus
                                                .value = Events.completed.text;
                                          },
                                        ),
                                      ])),
                            ],
                          )
                        : SizedBox(),
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
                        textStyle: const TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      child: const Text('Apply filters'),
                    ),
                  ],
                ),
              );
            })
          ]),
        );
      });
}
