import 'package:event_planner_light/model/EventModel.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/my_invites/my_invites_event_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../constants/assets.dart';
import '../../constants/colors_constants.dart';
import '../../utills/ConvertDateTime.dart';
import '../screens/NavBar/Screens/my_events/my_events_detail_screen.dart';

class EventTileWidget extends StatelessWidget {
  final bool pinned;
  final EventModel? event;
  final double? width;

  const EventTileWidget({
    super.key,
    this.pinned = false,
    this.event,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(MyEventsDetailScreen.routeName),
      child: Container(
        height: 13.h,
        width: width,
        margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.5.h),
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
                      ClipRRect(
                          borderRadius: BorderRadius.circular(5),
                          child: Image.asset(Assets.squareImage)),
                      Positioned(
                        top: 3,
                        left: 3,
                        child: EventTileDateBadge(
                          date: event?.startDate == null? "": extractDate(event!.startDate!),
                          month: event?.startDate == null? "":extractMonthInitials(event!.startDate!),
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
                          padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                          child: Text(
                            event?.name ?? "",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(height: 1.5),
                          ),
                        ),
                        Padding(
                          padding:  EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                               Icon(
                                size: 2.h,
                                Icons.location_on_outlined,
                                color: AppColors.kPrimaryColor,
                              ),
                              Text(
                                "Salmiya, Kuwait",
                                style: Theme.of(context).textTheme.bodySmall,
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
              Positioned(
                  top: 0.5.h, right: 1.w, child: SvgPicture.asset(SvgAssets.pin)),
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
      padding: EdgeInsets.symmetric(horizontal: 2.5.w,vertical: 0.5.h),
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
