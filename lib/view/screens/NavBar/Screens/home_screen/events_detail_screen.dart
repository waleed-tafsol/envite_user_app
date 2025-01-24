import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/controllers/event_detail_controller.dart';
import 'package:event_planner_light/shimmer_loaders/event_tile_shimmer.dart';
import 'package:event_planner_light/view/widgets/BottomModelSheet.dart';
import 'package:event_planner_light/view/widgets/PublicBadgeWidget.dart';
import 'package:event_planner_light/view/widgets/network_video_player_widget.dart';
import 'package:event_planner_light/view/widgets/stats_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';

class EventsDetailScreen extends GetView<EventDetailController> {
  static const routeName = 'EventsDetailScreen';
 EventsDetailScreen({super.key});
EventDetailController controller= Get.put(EventDetailController());
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
          InkWell(
              onTap: () {
                Get.toNamed(EventsDetailScreen.routeName);
              },
              child: SvgPicture.asset(SvgAssets.image_pen)),
          SizedBox(
            width: 2.w,
          )
        ],
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 10.w),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Container(
                width: double.infinity,
                padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 8.h),
                decoration: BoxDecoration(
                    color: AppColors.kBlueLightShade,
                    borderRadius: BorderRadius.circular(10)),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Obx(() {
                      return controller.isLoading.value
                          ? sizedShimmer(height: 200.h, width: double.infinity)
                          : SizedBox(
                              height: 200.h,
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
                                        fit: BoxFit.cover,
                                      ),
                              ),
                            );
                    }),
                    SizedBox(height: 10.h),
                    Obx(() {
                      return controller.isLoading.value
                          ? sizedShimmer(width: 70.w,height: 30.h)
                          : Text(
                              controller.eventDetailResponse.value.data!.name!,
                              style: Theme.of(context).textTheme.headlineLarge,
                            );
                    }),
                    SizedBox(
                      height: 10.h,
                    ),
                    Row(
                      children: [
                        Icon(
                          size: 20.h,
                          Icons.location_on_outlined,
                          color: AppColors.kIconColor,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Obx(() {
                          return controller.isLoading.value
                              ? sizedShimmer(height: 20.h,width: 70.w)
                              : Text(
                                  controller.eventDetailResponse.value.data!
                                          .address ??
                                      "",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: AppColors.kBluedarkShade),
                                );
                        }),
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
                          size: 22.h,
                          Icons.groups_2_outlined,
                          color: AppColors.kIconColor,
                        ),
                        SizedBox(
                          width: 5.w,
                        ),
                        Obx(() {
                          return controller.isLoading.value
                              ? sizedShimmer(width: 20.w,height:10 )
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
                                  width: 40.w,height: 10.h
                                )
                              : PublicBadgeWidget(
                                  text: controller.eventDetailResponse.value
                                      .data!.eventType);
                        }),
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Text("About the event",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppColors.kBluedarkShade)),
                    Obx(() {
                      return controller.isLoading.value
                          ? sizedShimmer(height: 50.h, width: double.infinity)
                          : Text(
                              controller.eventDetailResponse.value.data
                                      ?.description ??
                                  "",
                              style: Theme.of(context).textTheme.bodySmall);
                    }),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      children: [
                        Obx(() {
                          return controller.isLoading.value
                              ? sizedShimmer(height: 100.h, width: 150.w)
                              : StatsContainer(
                                  image: Image.asset(Assets.m1),
                                  title: 'Total Attendees',
                                  value: controller.eventDetailResponse.value
                                          .data?.attendees?.length
                                          .toString() ??
                                      "");
                        }),
                        Spacer(),
                        Obx(() {
                          return controller.isLoading.value
                              ? sizedShimmer(height: 100.h, width: 150.w)
                              : StatsContainer(
                                  image: Image.asset(Assets.m2),
                                  title: 'Total Invite Send',
                                  value: controller.eventDetailResponse.value
                                          .data?.noOfInvites
                                          .toString() ??
                                      "");
                        })
                      ],
                    ),
                    SizedBox(
                      height: 10.h,
                    ),
                    Obx(() {
                      return controller.isLoading.value
                          ? sizedShimmer(height: 40.h, width: double.infinity)
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
                                    Column(
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
                                            ),
                                          ),
                                        );
                                      }),
                                    ),
                                  ],
                                );
                    }),
                    SizedBox(height: 10.h,),
                    Obx(() {
                      return controller.isLoading.value
                          ? sizedShimmer(height: 40.h, width: double.infinity)
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
                                              height: 200.h,
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
                      height: 2.h,
                    ),
                    Obx(() {
                      return controller.isLoading.value
                          ? sizedShimmer(height: 20.h, width: double.infinity)
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
                                            child: Text(
                                                controller
                                                        .eventDetailResponse
                                                        .value
                                                        .data
                                                        ?.socialLinks?[index] ??
                                                    "",
                                                style: Theme.of(context)
                                                    .textTheme
                                                    .bodySmall),
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
                      height: 10.h,
                    ),
                    Obx(() {
                      return controller.isLoading.value
                          ? sizedShimmer(height: 40.h, width: double.infinity)
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
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Text("Similar events for you",
                        style: Theme.of(context)
                            .textTheme
                            .headlineSmall!
                            .copyWith(color: AppColors.kBluedarkShade)),
                  ),
                /*  Padding(
                    padding: EdgeInsets.symmetric(vertical: 1.h),
                    child: Text("See all",
                        style: Theme.of(context).textTheme.bodySmall),
                  ),*/
                ],
              ),
              // ListView.builder(
              //     itemCount: 2,
              //     physics: const NeverScrollableScrollPhysics(),
              //     shrinkWrap: true,
              //     itemBuilder: (BuildContext context, int index) {
              //       return const EventTileWidget();
              //     }),
            ],
          ),
        ),
      ),
    );
  }
}