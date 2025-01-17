import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/widgets/EventTileWidget.dart';
import 'package:event_planner_light/view/widgets/PublicBadgeWidget.dart';
import 'package:event_planner_light/view/widgets/stats_container.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class MyInvitesEventsDetailScreen extends StatelessWidget {
  static const routeName = 'MyInvitesEventsDetailScreen';
  const MyInvitesEventsDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F8EF),
      appBar: AppBar(
        forceMaterialTransparency: true,
        title: Text(
          "Event Details",
        ),
        centerTitle: true,
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.w),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 7.h),
                  decoration: BoxDecoration(
                      color: AppColors.kBlueLightShade,
                      borderRadius: BorderRadius.circular(10.r)),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10.r),
                          child: Image.asset(
                            Assets.eventCanvas,
                            width: double.infinity,
                          )),
                      SizedBox(height: 11.h),
                      Text("Understanding Parents’ Journey\nThrough Autism",
                          style: TextStyle(
                              fontSize: 21.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kBerkeleyBlue)),
                      SizedBox(
                        height: 14.h,
                      ),
                      Row(
                        children: [
                          Icon(
                            Icons.location_on_outlined,
                            color: AppColors.kIconColor,
                            size: 18.sp,
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          Text(
                            "Salmiya, Kuwait",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: AppColors.kBluedarkShade,
                                    fontSize: 12.sp),
                          ),
                          SizedBox(
                            width: 6.w,
                          ),
                          SizedBox(
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Show map",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodySmall!
                                      .copyWith(
                                          color: AppColors.kTextBlack,
                                          fontSize: 9.sp),
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
                            Icons.groups_2_outlined,
                            color: AppColors.kIconColor,
                            size: 18.sp,
                          ),
                          Text(
                            "+236",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(
                                    color: AppColors.kTextBlack,
                                    fontSize: 12.sp),
                          ),
                          SizedBox(
                            width: 16.w,
                          ),
                          const PublicBadgeWidget(text: "PUBLIC"),
                        ],
                      ),
                      SizedBox(
                        height: 25.h,
                      ),
                      Text("About the event",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: AppColors.kBluedarkShade,
                                  fontSize: 14.sp)),
                      SizedBox(
                        height: 7.sp,
                      ),
                      Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sagittis condimentum sapien, et volutpat nunc feugiat nec. Sed et interdum quam. In ipsum quam, vulputate sit amet dolor nec, egestas consectetur ante. Aenean fermentum diam arcu.",
                          style: TextStyle(
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                              color: AppColors.kBerkeleyBlue)),
                      SizedBox(
                        height: 21.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          StatsContainer(
                              image: Image.asset(Assets.m1),
                              title: 'Total Attendees',
                              value: '34'),
                          VerticalDivider(),
                          StatsContainer(
                              image: Image.asset(Assets.m2),
                              title: 'Total Invite Send',
                              value: '34')
                        ],
                      ),
                      SizedBox(
                        height: 21.h,
                      ),
                      Text("Videos of the event",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: AppColors.kBluedarkShade,
                                  fontSize: 14.sp)),
                      ...List.generate(3, (index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 5.h),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Image.asset(Assets.video_Thumbnail),
                          ),
                        );
                      }),
                      SizedBox(
                        height: 20.h,
                      ),
                      Text("Links",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: AppColors.kBluedarkShade,
                                  fontSize: 14.sp)),
                      Row(
                        children: [
                          const Icon(
                            Icons.link,
                            color: AppColors.kBluedarkShade,
                          ),
                          SizedBox(
                            width: 11.w,
                          ),
                          Text("www.autismkuwait.com",
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: AppColors.kBerkeleyBlue,
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.link,
                            color: AppColors.kBluedarkShade,
                          ),
                          SizedBox(
                            width: 11.w,
                          ),
                          Text("@autismkuwait",
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: AppColors.kBerkeleyBlue,
                              ))
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.facebook,
                            color: AppColors.kBluedarkShade,
                          ),
                          SizedBox(
                            width: 11.w,
                          ),
                          Text("@autismkuwait",
                              style: TextStyle(
                                fontSize: 11.sp,
                                color: AppColors.kBerkeleyBlue,
                              ))
                        ],
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: AppColors.kPrimaryColor),
                                onPressed: () {
                                  // BottomSheetManager.sendInvite(context);
                                },
                                child: Text(
                                  'Mark As Attendees',
                                  style: TextStyle(color: Colors.white),
                                )),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 16.h,
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 33.h,
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
                              .copyWith(
                                  color: AppColors.kBerkeleyBlue,
                                  fontSize: 21.sp)),
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Text("See all",
                          style: Theme.of(context)
                              .textTheme
                              .headlineSmall!
                              .copyWith(
                                  color: AppColors.kBerkeleyBlue,
                                  fontSize: 12.sp)),
                    ),
                  ],
                ),
                SizedBox(
                  height: 10.h,
                ),
                ListView.builder(
                    itemCount: 2,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return const EventTileWidget();
                    }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
