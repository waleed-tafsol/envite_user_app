import 'package:event_planner_light/controllers/MyInvitesController.dart';
import 'package:event_planner_light/view/widgets/BottomModelSheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../constants/colors_constants.dart';
import '../../../../widgets/EventTileWidget.dart';
import '../../../../widgets/CustomChipWidgets.dart';
import '../../../../widgets/SearchEventWidget.dart';

class MyInvitesScreen extends GetView<MyInvitesController> {
  const MyInvitesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: RefreshIndicator(
        onRefresh: () async {
          await Future.delayed(Durations.long3);
        },
        child: SingleChildScrollView(
          physics: AlwaysScrollableScrollPhysics(),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
            child: Column(
              children: [
                SearchEventWidget(),
                Padding(
                  padding: EdgeInsets.only(top: 2.h, bottom: 1.h),
                  child: Text(
                    "My invites",
                    style: Theme.of(context)
                        .textTheme
                        .bodyLarge!
                        .copyWith(color: AppColors.kTextBlack),
                  ),
                ),
                const InviteChips(),
                SizedBox(
                  height: 2.h,
                ),
                ListView.builder(
                    itemCount: 0,
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (BuildContext context, int index) {
                      return const EventTileWidget();
                    }),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                      onTap: () => BottomSheetManager.eventAdded(context),
                      child: Text(
                        "Ended events",
                        style: Theme.of(context).textTheme.headlineMedium,
                      ),
                    ),
                    Text(
                      "See all",
                      style: Theme.of(context).textTheme.bodySmall,
                    )
                  ],
                ),
                ListView.builder(
                    itemCount: 0,
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
      ),
    );
  }
}
