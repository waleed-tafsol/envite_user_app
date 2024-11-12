import 'package:event_planner_light/bindings/membership_binding.dart';
import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/controllers/membership_controller.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/PaymentScreen.dart';
import 'package:event_planner_light/view/screens/ads/add_ads_screen.dart';
import 'package:event_planner_light/view/screens/top_ups/add_top_ups_screen.dart';
import 'package:event_planner_light/view/widgets/ad_chips.dart';
import 'package:event_planner_light/view/widgets/ads_container.dart';
import 'package:event_planner_light/view/widgets/membership_container.dart';
import 'package:event_planner_light/view/widgets/stats_container.dart';
import 'package:event_planner_light/view/widgets/topup_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class MemberShipScreen extends GetView<MembershipBindings> {
  final MembershipController controller1 = Get.put(MembershipController());
  static const routeName = 'MembershipScreen';
  MemberShipScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F8EF),
      appBar: AppBar(
        centerTitle: true,
        title: Text('Membership'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MemberShipChips(),
            SizedBox(height: 2.h),
            Obx(() {
              // Observe the selectedChipIndex and update UI based on the value
              return controller1.selectedChipIndex.value == 0
                  ? Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        InkWell(
                            onTap: () {
                              Get.toNamed(MemberShipPaymentScreen.routeName);
                            },
                            child: MembershipContainer()),
                        SizedBox(
                          height: 2.h,
                        ),
                        InkWell(
                            onTap: () {
                              Get.toNamed(MemberShipPaymentScreen.routeName);
                            },
                            child: MembershipContainer())
                      ],
                    ) // Show Packages content
                  : Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Expanded(
                                child: StatsContainer(
                              image: Image.asset(Assets.m1),
                              title: 'Total Invites',
                              value: '34',
                            )),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                                child: StatsContainer(
                              image: Image.asset(Assets.m2),
                              title: 'Amount Paid',
                              value: '\$34',
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Row(
                          children: [
                            Expanded(
                                child: StatsContainer(
                              image: Image.asset(Assets.m2),
                              title: 'Total Used Invites',
                              value: '34',
                            )),
                            SizedBox(
                              width: 2.w,
                            ),
                            Expanded(
                                child: StatsContainer(
                              image: Image.asset(Assets.m1),
                              title: 'Available Invite',
                              value: '\$34',
                            ))
                          ],
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Text(
                          'My Top Ups',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Color(0xff457B9D)),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        TopupContainer(),
                        SizedBox(
                          height: 1.h,
                        ),
                        TopupContainer(),
                        SizedBox(
                          height: 1.h,
                        ),
                        TopupContainer(),
                        SizedBox(
                          height: 3.h,
                        ),
                        // Spacer(),
                        Row(
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.kPrimaryColor),
                                  onPressed: () {
                                    Get.toNamed(AddTopUpsScreen.routeName);
                                  },
                                  child: Text(
                                    'Add Top Ups',
                                    style: TextStyle(color: Colors.white),
                                  )),
                            ),
                          ],
                        )
                      ],
                    );
            }),
          ],
        ),
      ),
    );
  }
}
