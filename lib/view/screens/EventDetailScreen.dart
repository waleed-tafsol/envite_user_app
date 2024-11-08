import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../widgets/EventTileWidget.dart';
import '../widgets/PublicBadgeWidget.dart';

class Eventdetailscreen extends StatelessWidget {
  const Eventdetailscreen({super.key});
  static const routeName = "Eventdetailscreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Event Detail",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
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
                      ClipRRect(
                          borderRadius: BorderRadius.circular(10),
                          child: Image.asset(
                            Assets.eventCanvas,
                            width: double.infinity,
                          )),
                      SizedBox(height: 1.h),
                      Text(
                        "Understanding Parents’ Journey\nThrough Autism",
                        style: Theme.of(context).textTheme.headlineLarge,
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on_outlined,
                            color: AppColors.kIconColor,
                          ),
                          Text(
                            "Salmiya, Kuwait",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.kBluedarkShade),
                          ),
                          SizedBox(
                            width: 1.w,
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
                                      .copyWith(color: AppColors.kTextBlack),
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
                          const Icon(
                            Icons.groups_2_outlined,
                            color: AppColors.kIconColor,
                          ),
                          Text(
                            "+236",
                            style: Theme.of(context)
                                .textTheme
                                .bodySmall!
                                .copyWith(color: AppColors.kTextBlack),
                          ),
                          const PublicBadgeWidget(text: "PUBLIC"),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Text("About the event",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: AppColors.kBluedarkShade)),
                      ),
                      Text(
                          "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vivamus sagittis condimentum sapien, et volutpat nunc feugiat nec. Sed et interdum quam. In ipsum quam, vulputate sit amet dolor nec, egestas consectetur ante. Aenean fermentum diam arcu.",
                          style: Theme.of(context).textTheme.bodySmall),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Text("Videos of the event",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: AppColors.kBluedarkShade)),
                      ),
                      ...List.generate(3, (index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 1.h),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(2),
                            child: Image.asset(Assets.video_Thumbnail),
                          ),
                        );
                      }),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Text("Links",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: AppColors.kBluedarkShade)),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.link,
                            color: AppColors.kBluedarkShade,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text(
                            "www.autismkuwait.com",
                            style: Theme.of(context).textTheme.bodySmall,
                          )
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.link,
                            color: AppColors.kBluedarkShade,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("@autismkuwait",
                              style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.facebook,
                            color: AppColors.kBluedarkShade,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text("@autismkuwait",
                              style: Theme.of(context).textTheme.bodySmall)
                        ],
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Text("Tags",
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall!
                                .copyWith(color: AppColors.kBluedarkShade)),
                      ),
                      const Row(
                        children: [
                          PublicBadgeWidget(text: "Autism"),
                          PublicBadgeWidget(text: "Kids"),
                          PublicBadgeWidget(text: "Conference"),
                          PublicBadgeWidget(text: "Kuwait"),
                        ],
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                    ],
                  ),
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
                    Padding(
                      padding: EdgeInsets.symmetric(vertical: 1.h),
                      child: Text("See all",
                          style: Theme.of(context).textTheme.bodySmall),
                    ),
                  ],
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
