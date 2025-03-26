import 'package:event_planner_light/controllers/PackagesController.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/ChooseAPlan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../shimmer_loaders/event_tile_shimmer.dart';

class BuyPackagesScreen extends GetView<PackagesController> {
  const BuyPackagesScreen({super.key});
  static const routeName = 'BuyPackagesScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Choose a Plan'),
      ),
      body: Obx(() {
        return controller.isloading.value
            ? Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: List.generate(
                    3,
                    (index) => Padding(
                          padding: EdgeInsets.symmetric(
                              vertical: 1.h, horizontal: 4.w),
                          child: sizedShimmer(
                              height: 20.h, width: double.infinity),
                        )),
              )
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                child: Column(
                  spacing: 2.h,
                  children: controller.packages.map((item) {
                    return ChoosePlanContainer(
                      package: item,
                    );
                  }).toList(),
                ),
              );
      }),
    );
  }
}
