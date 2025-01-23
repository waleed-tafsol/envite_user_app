import 'package:event_planner_light/controllers/ExploreController.dart';
import 'package:event_planner_light/view/widgets/EventTileWidget.dart';
import 'package:event_planner_light/view/widgets/SearchEventWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../../../constants/colors_constants.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Explorecontroller controller = Get.put(Explorecontroller());
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 29.w),
          child: Column(
            children: [
              SizedBox(
                height: 20.h,
              ),
              const SearchEventWidget(),
              SizedBox(
                height: 20.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text("Filtered search",
                      style: Theme.of(context)
                          .textTheme
                          .headlineSmall!
                          .copyWith(color: AppColors.kTextBlack)),
                  Text("All events",
                      style: Theme.of(context).textTheme.bodySmall),
                ],
              ),
              SizedBox(
                height: 10.h,
              ),
              FutureBuilder(
                  future: controller.getAllEvents(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return Center(child: CircularProgressIndicator());
                    }
                    return 
                    controller.data.isEmpty?SizedBox(
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
                        itemCount:controller.data.length,
                        physics: const NeverScrollableScrollPhysics(),
                        shrinkWrap: true,
                        itemBuilder: (BuildContext context, int index) {
                          return EventTileWidget(
                            pinned: true,
                            images:controller.data[index].images?[0] ,
                             address: controller.data[index].address,
                                eventType: controller.data[index].eventType,
                          );
                        });
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
