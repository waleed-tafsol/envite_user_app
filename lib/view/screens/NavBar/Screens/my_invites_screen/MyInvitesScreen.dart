import 'package:event_planner_light/view/widgets/BottomModelSheet.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../../constants/colors_constants.dart';
import '../../../../widgets/EventTileWidget.dart';
import '../../../../widgets/CustomChipWidgets.dart';
import '../../../../widgets/SearchEventWidget.dart';

class MyInvitesScreen extends StatelessWidget {
  const MyInvitesScreen({super.key});

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
              Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: Text(
                  "My invites",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                      color: AppColors.kBerkeleyBlue,
                      fontSize: 21.sp,
                      fontWeight: FontWeight.w600),
                ),
              ),
              SizedBox(
                height: 8.h,
              ),
              const InviteChips(),
              ListView.builder(
                  itemCount: 2,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return const EventTileWidget(
                      pinned: true,
                    );
                  }),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  InkWell(
                    onTap: () => BottomSheetManager.eventAdded(context),
                    child: Text(
                      "Ended events",
                      style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                          color: AppColors.kBerkeleyBlue,
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                  Text(
                    "See all",
                    style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                        color: AppColors.kBerkeleyBlue,
                        fontSize: 12.sp,
                        fontWeight: FontWeight.normal),
                  ),
                ],
              ),
              ListView.builder(
                  itemCount: 10,
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    return const EventTileWidget();
                  }),
              // SizedBox(
              //   height: 6.h,
              //   width: double.infinity,
              //   child: ElevatedButton(
              //       style: StylesConstants.elevated_b_redBack_whiteFore,
              //       onPressed: () {},
              //       child: const Text("Add the event")),
              // ),
              SizedBox(
                height: 2.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
