import 'package:event_planner_light/controllers/event_detail_controller.dart';
import 'package:event_planner_light/model/event_model.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../constants/assets.dart';
import '../../constants/colors_constants.dart';
import '../../utills/ConvertDateTime.dart';
import '../../utills/string_decoration.dart';
import '../screens/events_detail_screen.dart';
import 'StatusTagWidget.dart';

class EventTileWidget extends StatelessWidget {
  final EventModel? event;
  final double? width;

  const EventTileWidget({
    super.key,
    this.event,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    EventDetailController eventDetailController =
        Get.put(EventDetailController());
    return InkWell(
      onTap: () {
        eventDetailController.selectedEventId.value = event!.slug!;
        Get.toNamed(EventsDetailScreen.routeName);
        eventDetailController.getEventsDetail();
      },
      child: Container(
        height: 13.h,
        width: width,
        margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 1.h),
        decoration: BoxDecoration(
            color: AppColors.kBlueLightShade,
            borderRadius: BorderRadius.circular(10)),
        child: Center(
          child: Stack(
            children: [
              Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  Stack(
                    children: [
                      SizedBox(
                        width: 20.w,
                        height: double.infinity,
                        child: ClipRRect(
                            borderRadius: BorderRadius.circular(5),
                            child: event!.images!.isEmpty
                                ? Container(
                                    width: double.infinity,
                                    color: Colors.grey,
                                    child: Align(
                                        alignment: Alignment.bottomCenter,
                                        child: Text("No image")),
                                  )
                                : Image.network(event!.images![0])),
                      ),
                      Positioned(
                        top: 3,
                        left: 3,
                        child: EventTileDateBadge(
                          date: event?.startDate == null
                              ? ""
                              : extractDate(event!.startDate!),
                          month: event?.startDate == null
                              ? ""
                              : extractMonthInitials(event!.startDate!),
                        ),
                      ),
                    ],
                  ),
                  Expanded(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: Text(
                            capitalizeFirstLetter(event?.name ?? ""),
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(height: 1.5),
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: StatusWidget(status: event?.status),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(horizontal: 3.w),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Icon(
                                size: 2.h,
                                Icons.location_on_outlined,
                                color: AppColors.kPrimaryColor,
                              ),
                              Expanded(
                                child: Text(
                                  event?.address ?? "",
                                  overflow: TextOverflow.ellipsis,
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    padding: EdgeInsets.symmetric(
                      horizontal: 1.5.w,
                    ),
                    decoration: BoxDecoration(
                        color: AppColors.kBlueMediumShade,
                        borderRadius: BorderRadius.circular(4)),
                    height: 3.h,
                    // width: 10.w,
                    child: Center(
                      child: Text(
                        event?.eventType!.toUpperCase() ?? "",
                        style: Theme.of(context)
                            .textTheme
                            .bodySmall!
                            .copyWith(color: AppColors.kBluedarkShade),
                      ),
                    ),
                  )
                ],
              ),
              // event?. == true
              //     ?
              // Positioned(
              //     top: 0.5.h,
              //     right: 1.w,
              //     child: SvgPicture.asset(SvgAssets.pin)),
            ],
          ),
        ),
      ),
    );
  }
}

class EventTileDateBadge extends StatelessWidget {
  const EventTileDateBadge({
    super.key,
    this.date,
    this.month,
  });

  final String? date;
  final String? month;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 2.5.w, vertical: 0.5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.kBluedarkShade,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(date ?? "",
              style: Theme.of(context)
                  .textTheme
                  .headlineMedium!
                  .copyWith(color: AppColors.kBlueLightShade)),
          Text(month ?? "",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.kBlueLightShade)),
        ],
      ),
    );
  }
}
