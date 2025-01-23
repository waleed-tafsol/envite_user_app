import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/HomeScreenController.dart';
import 'package:event_planner_light/services/categories_tile_shimmer.dart';
import 'package:event_planner_light/shimmer_loaders/event_tile_shimmer.dart';
import 'package:event_planner_light/view/widgets/EventTileWidget.dart';
import 'package:event_planner_light/view/widgets/SearchEventWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class HomeScreen extends StatelessWidget {
const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final HomeScreenController controller = Get.put(HomeScreenController());
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 20.h,
                ),
                // Padding(
                //   padding: EdgeInsets.symmetric(horizontal: 16.w),
                //   child: const SearchEventWidget(),
                // ),
                // SizedBox(
                //   height: 20.h,
                // ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 18.w, vertical: 13.h),
                    height: 175.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                        color: AppColors.kBerkeleyBlue,
                        borderRadius: BorderRadius.circular(20)),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Best Event In kuwait",
                            style: Theme.of(context)
                                .textTheme
                                .headlineMedium!
                                .copyWith(color: Colors.white)),
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          children: [
                            Text("4.2",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodySmall!
                                    .copyWith(color: Colors.white)),
                            Icon(
                              Icons.star,
                              color: Colors.white,
                            )
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 20.h,
                ),
                SizedBox(
                  height: 100.h,
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
                                child: Obx( () {
                                    return Container(
                                      margin: EdgeInsets.symmetric(
                                        horizontal: 4.w,
                                      ),
                                      decoration: BoxDecoration(
                                        color: AppColors.kLightBlueColor,
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            color: controller.selectedCategory.value
                                                        .slug ==
                                                    controller
                                                        .categories[index].slug
                                                ? AppColors.kBerkeleyBlue
                                                : Colors.transparent),
                                      ),
                                      width: 100.w,
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Image.network(
                                            scale: 1.0,
                                            controller.categories[index].icon ?? '',
                                            width: 70.w,
                                            height: 50.w,
                                          ),
                                          Text(
                                            controller.categories[index].name?.en ??
                                                "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodySmall,
                                          ),
                                        ],
                                      ),
                                    );
                                  }
                                ),
                              );
                            });
                  }),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Suggestion for you",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kBerkeleyBlue)),
                      Text("All events",
                          style: TextStyle(
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w600,
                              color: AppColors.kBerkeleyBlue)),
                    ],
                  ),
                ),
                
                  
                     Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Obx(() {
                    return controller.isEventLoading.value
                        ? ListView(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            children:
                                List.generate(5, (index) => eventTileShimmer()),
                          )
                        : controller.events.isEmpty
                            ? SizedBox(
                                height: 300.h,
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
                ),
                    
              ],
            ),
          ),
        ),
      ),
    );
  }
}
