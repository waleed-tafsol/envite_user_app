import 'package:event_planner_light/view/widgets/EventTileWidget.dart';
import 'package:event_planner_light/view/widgets/SearchEventWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../../constants/colors_constants.dart';

class ExploreScreen extends StatelessWidget {
  const ExploreScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
              ListView.builder(
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return const EventTileWidget(
                      pinned: true,
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
