import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/event_detail_controller.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/my_events/edit_event_details.dart';
import 'package:event_planner_light/view/widgets/PublicBadgeWidget.dart';
import 'package:event_planner_light/view/widgets/stats_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../constants/constants.dart';
import '../../controllers/edit_event_detail_controller.dart';
import '../../controllers/filters_controller.dart';
import '../../shimmer_loaders/event_tile_shimmer.dart';
import '../../utills/string_decoration.dart';
import '../widgets/BottomModelSheet.dart';
import '../widgets/EventTileWidget.dart';
import '../widgets/network_video_player_widget.dart';

class EventsDetailScreen extends GetView<EventDetailController> {
  static const routeName = 'EventsDetailScreen';

  EventsDetailScreen({super.key});

  FiltersController filtersController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Event Details",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        actions: [
          Obx(() {
            return filtersController.showMyEvents.value &&
                    controller.eventDetailResponse.value.data != null &&
                    controller.eventDetailResponse.value.data!.status ==
                        'pending'
                ? controller.isLoading.value
                    ? sizedShimmer(height: 5.h, width: 5.h)
                    : InkWell(
                        onTap: () {
                          final editcontroller =
                              Get.put(EditEventDetailController());
                          editcontroller.setEditValues(
                              controller.eventDetailResponse.value.data!);
                          Get.toNamed(
                            EditEventsDetailScreen.routeName,
                          );
                        },
                        child: SvgPicture.asset(SvgAssets.image_pen))
                : SizedBox();
          }),
          SizedBox(
            width: 2.w,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
                decoration: BoxDecoration(
                    color: AppColors.kBlueLightShade,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      return controller.isLoading.value
                          ? sizedShimmer(height: 20.h, width: double.infinity)
                          : SizedBox(
                              height: 20.h,
                              width: double.infinity,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: controller.eventDetailResponse.value
                                        .data!.images!.isEmpty
                                    ? Container(
                                        width: double.infinity,
                                        color: Colors.grey,
                                        child: Align(
                                          alignment: Alignment.center,
                                          child: Text(
                                            "No Image",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(color: Colors.white),
                                          ),
                                        ),
                                      )
                                    : Image.network(
                                        controller.eventDetailResponse.value
                                            .data!.images!.first,
                                        fit: BoxFit.contain,
                                      ),
                              ),
                            );
                    }),
                    SizedBox(height: 1.h),
                    Obx(() {
                      return controller.isLoading.value
                          ? sizedShimmer(width: 20.w)
                          : Text(
                        capitalizeFirstLetter(controller.eventDetailResponse.value.data!.name!),
                              style: Theme.of(context).textTheme.headlineLarge,
                            );
                    }),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          size: 2.h,
                          Icons.location_on_outlined,
                          color: AppColors.kIconColor,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Expanded(
                          child: Obx(() {
                            return controller.isLoading.value
                                ? sizedShimmer()
                                : Text(
                                    controller.eventDetailResponse.value.data!
                                            .address
                                            ?.split(",")
                                            .first ??
                                        "",
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodySmall!
                                        .copyWith(
                                            color: AppColors.kBluedarkShade),
                                  );
                          }),
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        SizedBox(
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Text(
                                "Show map",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(
                                        color: AppColors.kTextBlack,
                                        fontSize: 12.sp),
                              ),
                              const Icon(
                                Icons.keyboard_arrow_down_rounded,
                                size: 15,
                                color: Colors.black,
                              ),
                            ],
                          ),
                        ),
                        const Spacer(),
                        Icon(
                          size: 2.h,
                          Icons.groups_2_outlined,
                          color: AppColors.kIconColor,
                        ),
                        SizedBox(
                          width: 1.w,
                        ),
                        Obx(() {
                          return controller.isLoading.value
                              ? sizedShimmer(width: 4.w)
                              : Text(
                                  "+${controller.eventDetailResponse.value.data?.attendees?.length ?? 0}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(color: AppColors.kTextBlack),
                                );
                        }),
                        SizedBox(
                          width: 2.w,
                        ),
                        Obx(() {
                          return controller.isLoading.value
                              ? sizedShimmer(
                                  width: 20.w,
                                )
                              : PublicBadgeWidget(
                                  text: controller.eventDetailResponse.value
                                      .data!.eventType);
                        }),
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Text("About the event",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppColors.kBluedarkShade)),
                    Obx(() {
                      return controller.isLoading.value
                          ? sizedShimmer(height: 10.h, width: double.infinity)
                          : Text(
                          capitalizeFirstLetter(controller.eventDetailResponse.value.data
                                      ?.description ??
                                  ""),
                              style: Theme.of(context).textTheme.bodySmall);
                    }),
                    SizedBox(
                      height: 2.h,
                    ),
                    Row(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Obx(() {
                          return controller.isLoading.value
                              ? sizedShimmer(height: 5.h, width: 40.w)
                              : StatsContainer(
                                  image: Image.asset(Assets.m1),
                                  title: 'Total Attendees',
                                  value: controller.eventDetailResponse.value
                                          .data?.attendees?.length
                                          .toString() ??
                                      "");
                        }),
                        // SizedBox(
                        //   width: 2.w,
                        // ),
                        Obx(() {
                          return controller.isLoading.value
                              ? sizedShimmer(height: 5.h, width: 40.w)
                              : controller.eventDetailResponse.value.data
                                          ?.eventType ==
                                      "private"
                                  ? StatsContainer(
                                      image: Image.asset(Assets.m2),
                                      title: 'Total Invite Send',
                                      value: controller.eventDetailResponse
                                              .value.data?.noOfInvites
                                              .toString() ??
                                          "")
                                  : SizedBox.shrink();
                        })
                      ],
                    ),
                    SizedBox(
                      height: 2.h,
                    ),
                    Obx(() {
                      return controller.isLoading.value
                          ? sizedShimmer(height: 5.h, width: double.infinity)
                          : controller.eventDetailResponse.value.data?.images
                                      ?.isEmpty ??
                                  true
                              ? SizedBox()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.h),
                                      child: Text(
                                        "Images of the event",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                color:
                                                    AppColors.kBluedarkShade),
                                      ),
                                    ),
                                    SizedBox(
                                      width: double.infinity,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: List.generate(
                                            controller.eventDetailResponse.value
                                                    .data?.images?.length ??
                                                0, (index) {
                                          return Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h),
                                            child: ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(2),
                                              child: Image.network(
                                                controller
                                                        .eventDetailResponse
                                                        .value
                                                        .data
                                                        ?.images?[index] ??
                                                    "",
                                                height: 20.h,
                                                errorBuilder: (context, error,
                                                        stackTrace) =>
                                                    Icon(Icons.error),
                                              ),
                                            ),
                                          );
                                        }),
                                      ),
                                    ),
                                  ],
                                );
                    }),
                    SizedBox(
                      height: 1.h,
                    ),
                    Obx(() {
                      return controller.isLoading.value
                          ? sizedShimmer(height: 5.h, width: double.infinity)
                          : controller.eventDetailResponse.value.data?.videos
                                      ?.isEmpty ??
                                  true
                              ? SizedBox()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.h),
                                      child: Text(
                                        "Videos of the event",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                color:
                                                    AppColors.kBluedarkShade),
                                      ),
                                    ),
                                    Column(
                                      children: List.generate(
                                          controller.eventDetailResponse.value
                                                  .data?.videos?.length ??
                                              0, (index) {
                                        return ClipRRect(
                                          borderRadius: k5BorderRadius,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h),
                                            child: SizedBox(
                                              height: 20.h,
                                              width: double.infinity,
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                child: NetworkVideoPlayerWidget(
                                                  videoUrl: controller
                                                          .eventDetailResponse
                                                          .value
                                                          .data
                                                          ?.videos?[index] ??
                                                      "",
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                );
                    }),
                    SizedBox(
                      height: 1.h,
                    ),
                    Obx(() {
                      return controller.isLoading.value
                          ? sizedShimmer(height: 5.h, width: double.infinity)
                          : controller.eventDetailResponse.value.data
                                      ?.socialLinks?.isEmpty ??
                                  true
                              ? SizedBox.shrink()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.h),
                                      child: Text(
                                        "Links",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                color:
                                                    AppColors.kBluedarkShade),
                                      ),
                                    ),
                                    Column(
                                      children: List.generate(
                                          controller.eventDetailResponse.value
                                                  .data?.socialLinks?.length ??
                                              0, (index) {
                                        return ClipRRect(
                                          borderRadius: k5BorderRadius,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h),
                                            child: Row(
                                              children: [
                                            const Icon(
                                                  Icons.link,
                                                  color:
                                                      AppColors.kBluedarkShade,
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Text(
                                                    controller
                                                            .eventDetailResponse
                                                            .value
                                                            .data
                                                            ?.socialLinks?[index] ??
                                                        "",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                );
                    }),

                    SizedBox(
                      height: 1.h,
                    ),
                    Obx(() {
                      return controller.isLoading.value
                          ? sizedShimmer(height: 5.h, width: double.infinity)
                          : controller.eventDetailResponse.value.data
                                      ?.socialLinks?.isEmpty ??
                                  true
                              ? SizedBox.shrink()
                              : Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.h),
                                      child: Text(
                                        "Emails",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                color:
                                                    AppColors.kBluedarkShade),
                                      ),
                                    ),
                                    Column(
                                      children: List.generate(
                                          controller.eventDetailResponse.value
                                                  .data?.emails?.length ??
                                              0, (index) {
                                        return ClipRRect(
                                          borderRadius: k5BorderRadius,
                                          child: Padding(
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h),
                                            child: Row(
                                              children: [
                                                const Icon(
                                                  Icons.email_outlined,
                                                  color:
                                                  AppColors.kBluedarkShade,
                                                ),
                                                SizedBox(
                                                  width: 2.w,
                                                ),
                                                Text(
                                                    controller
                                                            .eventDetailResponse
                                                            .value
                                                            .data
                                                            ?.emails?[index] ??
                                                        "",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodySmall),
                                              ],
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                );
                    }),
                    // Row(
                    //   children: [
                    //     const Icon(
                    //       Icons.link,
                    //       color: AppColors.kBluedarkShade,
                    //     ),
                    //     SizedBox(
                    //       width: 2.w,
                    //     ),
                    //     Text("@autismkuwait",
                    //         style: Theme.of(context).textTheme.bodySmall)
                    //   ],
                    // ),

                    SizedBox(
                      height: 1.h,
                    ),
                    Obx(() {
                      return controller.isLoading.value
                          ? sizedShimmer(height: 5.h, width: double.infinity)
                          : Row(
                              children: [
                                Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.kPrimaryColor),
                                      onPressed: () {
                                        BottomSheetManager.sendInvite(context);
                                      },
                                      child: Text(
                                        'Send Invite',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Expanded(
                                  child: ElevatedButton(
                                      style: ElevatedButton.styleFrom(
                                          backgroundColor:
                                              AppColors.kBerkeleyBlue),
                                      onPressed: () {
                                        // Get.toNamed(GenerateTicketScreen.routeName);
                                      },
                                      child: Text(
                                        'Pin',
                                        style: TextStyle(color: Colors.white),
                                      )),
                                ),
                              ],
                            );
                    }),
                  ],
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Obx(() {
                return controller.isLoading.value
                    ? sizedShimmer(width: double.infinity, height: 20.h)
                    : filtersController.showMyEvents.value ||
                            controller.eventDetailResponse.value.data!
                                .similarEvents!.isEmpty
                        ? SizedBox()
                        : Column(
                            children: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 1.h),
                                    child: Text("Similar events for you",
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall!
                                            .copyWith(
                                                color:
                                                    AppColors.kBluedarkShade)),
                                  ),
                                  /*  Padding(
                            padding: EdgeInsets.symmetric(vertical: 1.h),
                            child: Text("See all",
                                style: Theme.of(context).textTheme.bodySmall),
                                                  ),*/
                                ],
                              ),
                              SizedBox(
                                height: 1.h,
                              ),
                              Obx(() {
                                return controller.isLoading.value
                                    ? ListView(
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        children: List.generate(
                                            5, (index) => eventTileShimmer()),
                                      )
                                    : ListView.builder(
                                        itemCount: controller
                                            .eventDetailResponse
                                            .value
                                            .data
                                            ?.similarEvents
                                            ?.length,
                                        physics:
                                            const NeverScrollableScrollPhysics(),
                                        shrinkWrap: true,
                                        itemBuilder:
                                            (BuildContext context, int index) {
                                          return EventTileWidget(
                                            event: controller
                                                .eventDetailResponse
                                                .value
                                                .data
                                                ?.similarEvents?[index],
                                          );
                                        });
                              })
                            ],
                          );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
