import 'package:event_planner_light/controllers/HomeScreenController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../constants/colors_constants.dart';
import '../../../../widgets/EventTileWidget.dart';
import '../../../../widgets/SearchEventWidget.dart';

class HomeScreen extends GetView<HomeScreenController> {
  const HomeScreen({super.key});
  static const routeName = "HomeScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: const SearchEventWidget(),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Container(
                    margin: EdgeInsets.symmetric(vertical: 2.h),
                    padding:
                        EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                    height: 15.h,
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
                          height: 1.h,
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
                  height: 10.h,
                  child: Obx(() {
                    return controller.isloadingCatagories.value
                        ? Center(
                            child: CircularProgressIndicator(),
                          )
                        : ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.categories.length,
                            itemBuilder: (BuildContext context, int index) {
                              return GestureDetector(
                                child: Container(
                                  margin: EdgeInsets.symmetric(
                                    horizontal: 1.w,
                                  ),
                                  decoration: BoxDecoration(
                                      color: AppColors.kBlueLightShade,
                                      borderRadius: BorderRadius.circular(10)),
                                  height: 8.h,
                                  width: 25.w,
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      const Icon(Icons.mic),
                                      Text(
                                        controller.categories[index].name?.en ??
                                            "",
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodySmall,
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            });
                  }),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        "Suggestion for you",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                      Text(
                        "All events",
                        style: Theme.of(context).textTheme.bodySmall,
                      )
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w),
                  child: Obx(() {
                    return controller.isEventLoading.value
                        ? Center(
                            child: CircularProgressIndicator(),
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
