import 'package:event_planner_light/model/event_model.dart';
import 'package:event_planner_light/utills/convert_date_time.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/home_screen/events_detail_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import '../../constants/assets.dart';
import '../../constants/colors_constants.dart';

class EventTileWidget extends StatelessWidget {
  // Optional parameters with default values of false
  final bool pinned;
  final EventModel? event;
  final String? images;
  final String? address;
  final String? eventType;

  const EventTileWidget({
    super.key,
    this.pinned = false,
    this.images,
    this.address,
    this.eventType,
    this.event
    });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => Get.toNamed(MyInvitesEventsDetailScreen.routeName),
      child: Container(
        height: 119.h,
        margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 6.h),
        padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 10.h),
        decoration: BoxDecoration(
            color: AppColors.kBlueLightShade,
            borderRadius: BorderRadius.circular(10.r)),
        child: Stack(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Stack(
                  children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(4.r),
                        child: Image.network(
                          images!,
                          width: 103.w,
                          fit: BoxFit.cover,
                          
                        )),
                    Positioned(
                    
                      child: EventTileDateBadge(
                      date: event?.startDate == null
                              ? "4"
                              : extractDate(event!.startDate!),
                          month: event?.startDate == null
                              ? "Aug"
                              : extractMonthInitials(event!.startDate!),
                      ),
                    ),
                  ],
                ),
                SizedBox(
                  width: 10.w,
                ),
                Expanded(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Understanding Parents’ Journey Through Autism",
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
                            address!,
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 5.w,
                  ),
                  decoration: BoxDecoration(
                      color: AppColors.kBlueMediumShade,
                      borderRadius: BorderRadius.circular(2)),
                  height: 20.h,
                  // width: 10.w,
                  child: Center(
                    child: Text(
                     eventType!,
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
      height: 55.h,
      width: 50.w,
      padding: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
      margin: EdgeInsets.symmetric(horizontal: 0.w, vertical: 0.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: AppColors.kBluedarkShade,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(date.toString(),
              style: TextStyle(
                  fontSize: 20.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffA8DADC))),
          Text(month ?? "",
              style: TextStyle(
                  fontSize: 9.sp,
                  fontWeight: FontWeight.bold,
                  color: Color(0xffA8DADC))),
        ],
      ),
    );
  }
}
