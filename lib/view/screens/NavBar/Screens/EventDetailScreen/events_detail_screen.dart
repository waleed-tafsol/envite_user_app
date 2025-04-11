import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/controllers/event_detail_controller.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/EventDetailScreen/ContactsScreen.dart';
import 'package:event_planner_light/view/widgets/PublicBadgeWidget.dart';
import 'package:event_planner_light/view/widgets/stats_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../constants/constants.dart';
import '../../../../../controllers/edit_event_detail_controller.dart';
import '../../../../../controllers/filters_controller.dart';
import '../../../../../shimmer_loaders/event_tile_shimmer.dart';
import '../../../../../utills/CopyText.dart';
import '../../../../../utills/UrlLauncherUtills.dart';
import '../../../../../utills/enums.dart';
import '../../../../../utills/string_decoration.dart';
import '../../../../widgets/EventTileWidget.dart';
import '../../../../widgets/PhotoViewerWidget.dart';
import '../../../../widgets/network_video_player_widget.dart';
import '../my_events/edit_event_details.dart';

class EventsDetailScreen extends GetView<EventDetailController> {
  static const routeName = 'EventsDetailScreen';

  EventsDetailScreen({super.key});

  final FiltersController filtersController = Get.find();

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
            final event = controller.eventDetailResponse.value.data;
            return filtersController.showMyEvents.value &&
                    event != null &&
                    event.status == 'pending'
                ? controller.isLoading.value
                    ? sizedShimmer(height: 5.h, width: 5.h)
                    : GestureDetector(
                        onTap: () {
                          final editcontroller =
                              Get.put(EditEventDetailController());
                          editcontroller.setEditValues(event);
                          Get.toNamed(
                            EditEventsDetailScreen.routeName,
                          );
                        },
                        child: SvgPicture.asset(SvgAssets.image_pen))
                : SizedBox();
          }),
          SizedBox(
            width: 2.w,
          ),
          Obx(() {
            final event = controller.eventDetailResponse.value.data;
            return filtersController.showMyEvents.value
                ? SizedBox()
                : controller.isLoading.value
                    ? sizedShimmer(height: 5.h, width: 5.h)
                    : controller.isFavouritLoading.value
                        ? sizedShimmer(height: 5.h, width: 5.h)
                        : InkWell(
                            onTap: () {
                              // final editcontroller =
                              //     Get.put(EditEventDetailController());
                              // editcontroller.setEditValues(
                              //     controller.eventDetailResponse.value.data!);
                              // Get.toNamed(
                              //   EditEventsDetailScreen.routeName,
                              // );
                              controller.addToFavourits();
                            },
                            child: SvgPicture.asset(
                              SvgAssets.pin,
                              color: event?.isFavorite ?? false
                                  ? AppColors.kPrimaryColor
                                  : Colors.grey,
                            ));
          }),
          SizedBox(
            width: 2.w,
          )
        ],
      ),
      body: SafeArea(
        child: Padding(
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
                        final event = controller.eventDetailResponse.value.data;
                        return controller.isLoading.value
                            ? sizedShimmer(height: 20.h, width: double.infinity)
                            : SizedBox(
                                height: 20.h,
                                width: double.infinity,
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(10),
                                  child: event?.images?.isEmpty ?? true
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
                                                  .copyWith(
                                                      color: Colors.white),
                                            ),
                                          ),
                                        )
                                      : PhotoViewerWidget(
                                          imageProvider: NetworkImage(
                                          event?.images?.first ?? "defalt.png",
                                        )),
                                ),
                              );
                      }),
                      SizedBox(height: 1.h),
                      Obx(() {
                        final event = controller.eventDetailResponse.value.data;
                        return controller.isLoading.value
                            ? sizedShimmer(width: 20.w)
                            : Text(
                                capitalizeFirstLetter(event?.name ?? ""),
                                style:
                                    Theme.of(context).textTheme.headlineLarge,
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
                              final event =
                                  controller.eventDetailResponse.value.data;
                              return controller.isLoading.value
                                  ? sizedShimmer()
                                  : Text(
                                      event!.address?.split(",").first ?? "",
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
                          GestureDetector(
                            onTap: () async {
                              final event =
                                  controller.eventDetailResponse.value.data;
                              await launchMaps(
                                  event?.location?.coordinates?[1] ?? 0.0,
                                  event?.location?.coordinates?[0] ?? 0.0);
                            },
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
                            final event =
                                controller.eventDetailResponse.value.data;
                            return controller.isLoading.value
                                ? sizedShimmer(width: 4.w)
                                : Text(
                                    "+${event?.attendees?.length ?? 0}",
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
                            final event =
                                controller.eventDetailResponse.value.data;
                            return controller.isLoading.value
                                ? sizedShimmer(
                                    width: 20.w,
                                  )
                                : PublicBadgeWidget(text: event!.eventType);
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
                        final event = controller.eventDetailResponse.value.data;
                        return controller.isLoading.value
                            ? sizedShimmer(height: 10.h, width: double.infinity)
                            : Text(
                                capitalizeFirstLetter(event?.description ?? ""),
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
                            final event =
                                controller.eventDetailResponse.value.data;
                            return controller.isLoading.value
                                ? sizedShimmer(height: 5.h, width: 40.w)
                                : StatsContainer(
                                    image: Image.asset(Assets.m1),
                                    title: 'Total Attendees',
                                    value:
                                        event?.attendees?.length.toString() ??
                                            "");
                          }),
                          // SizedBox(
                          //   width: 2.w,
                          // ),
                          Obx(() {
                            final event =
                                controller.eventDetailResponse.value.data;
                            return controller.isLoading.value
                                ? sizedShimmer(height: 5.h, width: 40.w)
                                : event?.eventType == Events.private.text
                                    ? StatsContainer(
                                        image: Image.asset(Assets.m2),
                                        title: 'Total Invite Send',
                                        value: event?.noOfInvites?.toString() ??
                                            "0")
                                    : SizedBox.shrink();
                          })
                        ],
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Obx(() {
                        final event = controller.eventDetailResponse.value.data;
                        return controller.isLoading.value
                            ? sizedShimmer(height: 5.h, width: double.infinity)
                            : event?.images?.isEmpty ?? true
                                ? SizedBox()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                              event?.images?.length ?? 0,
                                              (index) {
                                            return Container(
                                              height: 20.h,
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 1.h),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(2),
                                                child: PhotoViewerWidget(
                                                  imageProvider: NetworkImage(
                                                    controller
                                                            .eventDetailResponse
                                                            .value
                                                            .data
                                                            ?.images?[index] ??
                                                        "",
                                                  ),
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
                        final event = controller.eventDetailResponse.value.data;
                        return controller.isLoading.value
                            ? sizedShimmer(height: 5.h, width: double.infinity)
                            : event?.videos?.isEmpty ?? true
                                ? SizedBox()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            event?.videos?.length ?? 0,
                                            (index) {
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
                                                  child:
                                                      NetworkVideoPlayerWidget(
                                                    videoUrl:
                                                        event?.videos?[index] ??
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
                        final event = controller.eventDetailResponse.value.data;
                        return controller.isLoading.value
                            ? sizedShimmer(height: 5.h, width: double.infinity)
                            : controller.eventDetailResponse.value.data
                                        ?.socialLinks?.isEmpty ??
                                    true
                                ? SizedBox.shrink()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            event?.socialLinks?.length ?? 0,
                                            (index) {
                                          return ClipRRect(
                                            borderRadius: k5BorderRadius,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 1.h),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.link,
                                                    color: AppColors
                                                        .kBluedarkShade,
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  Expanded(
                                                    child: InkWell(
                                                      onTap: () => controller
                                                          .launchSocialLink(
                                                              event?.socialLinks![
                                                                      index] ??
                                                                  ""),
                                                      child: Text(
                                                          maxLines: 4,
                                                          event?.socialLinks?[
                                                                  index] ??
                                                              "",
                                                          style:
                                                              Theme.of(context)
                                                                  .textTheme
                                                                  .bodySmall),
                                                    ),
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  InkWell(
                                                    onTap: () =>
                                                        copyToClipboard(
                                                            event?.socialLinks?[
                                                                    index] ??
                                                                ""),
                                                    child: Icon(
                                                      Icons.copy,
                                                      size: 2.h,
                                                      color: AppColors
                                                          .kBluedarkShade,
                                                    ),
                                                  ),
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
                        final event = controller.eventDetailResponse.value.data;
                        return controller.isLoading.value
                            ? sizedShimmer(height: 5.h, width: double.infinity)
                            : event?.socialLinks?.isEmpty ?? true
                                ? SizedBox.shrink()
                                : Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                            event?.emails?.length ?? 0,
                                            (index) {
                                          return ClipRRect(
                                            borderRadius: k5BorderRadius,
                                            child: Padding(
                                              padding: EdgeInsets.symmetric(
                                                  vertical: 1.h),
                                              child: Row(
                                                children: [
                                                  const Icon(
                                                    Icons.email_outlined,
                                                    color: AppColors
                                                        .kBluedarkShade,
                                                  ),
                                                  SizedBox(
                                                    width: 2.w,
                                                  ),
                                                  Text(
                                                      event?.emails?[index] ??
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
                      // Obx(() {
                      //   final event = controller.eventDetailResponse.value.data;
                      //   final isMyEvent =
                      //       event?.createdBy?.sId == authService.me.value?.sId;
                      //   final isPast = event?.status == Events.completed.text ||
                      //       event?.status == Events.rejected.text;
                      //   return controller.isLoading.value
                      //       ? sizedShimmer(height: 5.h, width: double.infinity)
                      //       : isMyEvent && !isPast
                      //           ? Row(
                      //               children: [
                      //                 Expanded(
                      //                   child: ElevatedButton(
                      //                       style: ElevatedButton.styleFrom(
                      //                           backgroundColor:
                      //                               AppColors.kPrimaryColor),
                      //                       onPressed: () {
                      //                         // controller.sendInvites(context);
                      //                         // controller
                      //                         //     .showContactSelectionBottomSheet(
                      //                         //         context);
                      //                         Get.toNamed(
                      //                             ContactsSelectionScreen
                      //                                 .routeName,
                      //                             arguments: {
                      //                               "eventslug": event?.slug
                      //                             });
                      //                       },
                      //                       child: Text(
                      //                         'Send Invite',
                      //                         style: TextStyle(
                      //                             color: Colors.white),
                      //                       )),
                      //                 ),
                      //               ],
                      //             )
                      //           : SizedBox();
                      // }),
                      Obx(() {
                        final event = controller.eventDetailResponse.value.data;
                        final isAttending = event?.isAttending ?? false;
                        final isMyEvent =
                            event?.createdBy?.sId != authService.me.value?.sId;
                        final isEventCompleted =
                            event?.status != Events.completed.text;
                        return controller.isLoading.value
                            ? SizedBox()
                            : isMyEvent && isEventCompleted && !isAttending
                                ? controller.isAttendEventLoading.value
                                    ? sizedShimmer(
                                        height: 5.h, width: double.infinity)
                                    : SizedBox(
                                        width: double.infinity,
                                        child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                                backgroundColor:
                                                    AppColors.kBerkeleyBlue),
                                            onPressed: () {
                                              controller.attendEvent(context);
                                            },
                                            child: Text(
                                              'Attend',
                                              style: TextStyle(
                                                  color: Colors.white),
                                            )),
                                      )
                                : SizedBox();
                      }),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Obx(() {
                  final event = controller.eventDetailResponse.value.data;
                  return controller.isLoading.value
                      ? sizedShimmer(width: double.infinity, height: 20.h)
                      : filtersController.showMyEvents.value ||
                              event!.similarEvents!.isEmpty
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
                                                  color: AppColors
                                                      .kBluedarkShade)),
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
                                          itemCount:
                                              event.similarEvents?.length,
                                          physics:
                                              const NeverScrollableScrollPhysics(),
                                          shrinkWrap: true,
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            return GestureDetector(
                                              onTap: () => Get.offNamed(
                                                  EventsDetailScreen.routeName,
                                                  preventDuplicates: false,
                                                  arguments: {
                                                    "slug": controller
                                                            .eventDetailResponse
                                                            .value
                                                            .data
                                                            ?.similarEvents?[
                                                                index]
                                                            .slug ??
                                                        ""
                                                  }),
                                              child: AbsorbPointer(
                                                child: EventTileWidget(
                                                  event: controller
                                                      .eventDetailResponse
                                                      .value
                                                      .data
                                                      ?.similarEvents?[index],
                                                ),
                                              ),
                                            );
                                          });
                                })
                              ],
                            );
                }),
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
