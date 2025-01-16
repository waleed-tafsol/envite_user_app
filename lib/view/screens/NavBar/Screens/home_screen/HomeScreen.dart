import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/widgets/EventTileWidget.dart';
import 'package:event_planner_light/view/widgets/SearchEventWidget.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PopScope(
        canPop: false,
        child: SafeArea(
          child: SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(
                  height: 2.h,
                ),
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
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
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
                                  "Entertainment",
                                  style: Theme.of(context).textTheme.bodySmall,
                                ),
                              ],
                            ),
                          ),
                        );
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
                  child: ListView.builder(
                      itemCount: 100,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return const EventTileWidget();
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
