import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/model/event_model.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/EventDetailScreen/events_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../../utills/ConvertDateTime.dart';
import '../../../../../widgets/EventTileWidget.dart';

class MyEventsListTile extends StatelessWidget {
  // Optional parameters with default values of false
  final bool pinned;
  final EventModel? event;

  const MyEventsListTile({
    super.key,
    this.pinned = false,
    this.event,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(EventsDetailScreen.routeName),
      child: Container(
        height: 14.h,
        margin: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
        decoration: BoxDecoration(
            color: AppColors.kBlueLightShade,
            borderRadius: BorderRadius.circular(10)),
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
                      top: 2,
                      left: 2,
                      child: EventTileDateBadge(
                        date: extractDate(event?.startDate ?? ""),
                        month: extractMonthName(event?.startDate ?? ""),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 2.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        event?.name ?? "Event Title",
                        style: Theme.of(context)
                            .textTheme
                            .headlineMedium!
                            .copyWith(height: 1.5),
                      ),
                      Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: AppColors.kPrimaryColor,
                          ),
                          Text(
                            "Salmiya, Kuwait",
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 1.w,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.kBlueMediumShade,
                      borderRadius: BorderRadius.circular(2)),
                  height: 2.h,
                  // width: 10.w,
                  child: Center(
                    child: Text(
                      event?.eventType ?? "",
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
    );
  }
}
