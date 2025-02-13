import 'package:event_planner_light/controllers/MyInvitesController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../constants/colors_constants.dart';
import '../../../../../constants/constants.dart';
import '../../../../../shimmer_loaders/event_tile_shimmer.dart';
import '../../../../widgets/EventTileWidget.dart';
import '../../../../widgets/SearchEventWidget.dart';

class MyInvitesScreen extends GetView<MyInvitesController> {
  const MyInvitesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await controller.getPaginatedEvents(callFirstTime: true);
        },
        child: SingleChildScrollView(
          controller: controller.scrollController,
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              children: [
                SearchEventWidget(),
                Padding(
                  padding: EdgeInsets.only(top: 2.h, bottom: 1.h),
                  child: Text(
                    "My invites",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.kTextBlack),
                  ),
                ),
                Center(
                  child: Wrap(
                    spacing: 2.w,
                    children: List<Widget>.generate(
                      controller.chipLabels.length,
                      (int index) {
                        return Obx(() {
                          return ChoiceChip(
                            backgroundColor: AppColors.kBlueMediumShade,
                            selectedColor: AppColors.kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: k5BorderRadius,
                                side: BorderSide(
                                  color: AppColors.kBlueMediumShade,
                                )),
                            label: Text(
                              controller.chipLabels[index],
                              style: TextStyle(
                                  color: controller.selectedChipIndex == index
                                      ? Colors.white
                                      : AppColors.kBluedarkShade),
                            ),
                            selected: controller.selectedChipIndex == index,
                            onSelected: (bool selected) {
                              controller.changeMyInvitesTabs(selected, index);
                            },
                          );
                        });
                      },
                    ).toList(),
                  ),
                ),
                // SizedBox(
                //   height: 2.h,
                // ),
                // ListView.builder(
                //     itemCount: 0,
                //     physics: const NeverScrollableScrollPhysics(),
                //     shrinkWrap: true,
                //     itemBuilder: (BuildContext context, int index) {
                //       return const EventTileWidget();
                //     }),
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
                Obx(() {
                  return controller.isEventLoading.value
                      ? ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children:
                              List.generate(5, (index) => eventTileShimmer()),
                        )
                      : controller.eventList.isNotEmpty
                          ? ListView.builder(
                              itemCount: controller.eventList.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return EventTileWidget(
                                  event: controller.eventList[index],
                                );
                              })
                          : SizedBox(
                              height: 40.h,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Icon(
                                      Icons.event_busy_outlined,
                                      color: AppColors.kBluedarkShade,
                                    ),
                                    Text(
                                      "No Upcoming Events are available",
                                      style: TextStyle(
                                          fontSize: 14.sp,
                                          color: AppColors.kBluedarkShade),
                                    ),
                                  ],
                                ),
                              ),
                            );
                }),
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
