import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/widgets/EventTileWidget.dart';
import 'package:event_planner_light/view/widgets/SearchEventWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

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
                  height: 20.h,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: const SearchEventWidget(),
                ),
                SizedBox(
                  height: 20.h,
                ),
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
                  height: 80.h,
                  child: ListView.builder(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      scrollDirection: Axis.horizontal,
                      itemCount: 10,
                      itemBuilder: (BuildContext context, int index) {
                        return GestureDetector(
                          child: Container(
                            margin: EdgeInsets.symmetric(
                              horizontal: 5.w,
                            ),
                            decoration: BoxDecoration(
                                color: AppColors.kBlueLightShade,
                                borderRadius: BorderRadius.circular(15.r)),
                            height: 77.h,
                            width: 100.w,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(
                                  Icons.mic,
                                  size: 24.sp,
                                ),
                                Text("Entertainment",
                                    style: TextStyle(
                                        fontSize: 10.sp,
                                        fontWeight: FontWeight.w500,
                                        color: AppColors.kBerkeleyBlue)),
                              ],
                            ),
                          ),
                        );
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
                  padding: EdgeInsets.symmetric(horizontal: 16.w),
                  child: ListView.builder(
                      itemCount: 10,
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
