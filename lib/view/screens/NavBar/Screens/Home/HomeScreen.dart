import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/controllers/HomeScreenController.dart';
import 'package:event_planner_light/shimmer_loaders/event_tile_shimmer.dart';
import 'package:event_planner_light/view/widgets/BottomModelSheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../constants/colors_constants.dart';
import '../../../../../shimmer_loaders/categories_tile_shimmer.dart';
import '../../../../widgets/EventTileWidget.dart';
import '../../../../widgets/home_carousel_widget.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});

  static const routeName = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
          child: SingleChildScrollView(
            child: Column(
              children: [
                //const SearchEventWidget(),
                HomeCarouselWidget(),
                k1hSizedBox,
                SizedBox(
                  height: 12.h,
                  child: Obx(() {
                    return controller.isLoadingCategories.value
                        ? ListView(
                            scrollDirection: Axis.horizontal,
                            children: List.generate(
                                4, (index) => categoriesTileShimmer()),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.categories.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                onTap: () async {
                                  controller.selectedCategory.value =
                                      controller.categories[index];
                                  controller.isEventLoading.value = true;
                                  await controller.getPaginatedEvents();
                                },
                                child: Obx(() {
                                  return Container(
                                    margin: EdgeInsets.symmetric(
                                      horizontal: 1.w,
                                    ),
                                    decoration: BoxDecoration(
                                      color: AppColors.kLightBlueColor,
                                      borderRadius: BorderRadius.circular(10),
                                      border: Border.all(
                                          color: controller.selectedCategory
                                                      .value.slug ==
                                                  controller
                                                      .categories[index].slug
                                              ? AppColors.kBerkeleyBlue
                                              : Colors.transparent),
                                    ),
                                    width: 25.w,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        controller
                                                .categories[index].icon!.isEmpty
                                            ? SizedBox(
                                                width: 14.w,
                                                height: 14.w,
                                              )
                                            : Image.network(
                                                controller.categories[index]
                                                        .icon ??
                                                    '',
                                                width: 14.w,
                                                height: 14.w,
                                              ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 4.w,
                                          ),
                                          child: Text(
                                            controller.categories[index].name
                                                    ?.en ??
                                                "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ),
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                            horizontal: 4.w,
                                          ),
                                          child: Text(
                                            controller.categories[index].name
                                                    ?.ar ??
                                                "",
                                            maxLines: 1,
                                            overflow: TextOverflow.ellipsis,
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                }),
                              );
                            });
                  }),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Suggestion for you",
                      style: TextStyle(
                          fontSize: 18.sp, color: AppColors.kTextBlack),
                    ),
                    Text(
                      "All events",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Obx(() {
                  return controller.isEventLoading.value
                      ? ListView(
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          children:
                              List.generate(5, (index) => eventTileShimmer()),
                        )
                      : controller.events.isEmpty
                          ? SizedBox(
                              height: 40.h,
                              child: Center(
                                child: Text(
                                  "No Suggestions are available",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColors.kTextBlack),
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: controller.events.length,
                              physics: const NeverScrollableScrollPhysics(),
                              shrinkWrap: true,
                              itemBuilder: (BuildContext context, int index) {
                                return EventTileWidget(
                                  event: controller.events[index],
                                );
                              });
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
