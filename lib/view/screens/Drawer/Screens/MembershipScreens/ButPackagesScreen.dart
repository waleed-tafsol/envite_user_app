import 'package:event_planner_light/controllers/PackagesController.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/ChooseAPlan.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class BuyPackagesScreen extends GetView<PackagesController> {
  const BuyPackagesScreen({super.key});
  static const routeName = 'BuyPackagesScreen';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Buy Top Ups'),
      ),
      body: Obx(() {
        return controller.isloading.value
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Center(
                child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                  child: Wrap(
                    alignment: WrapAlignment.center,
                    runAlignment: WrapAlignment.center,
                    spacing: 8.w,
                    runSpacing: 2.h,
                    children: controller.topups.map((item) {
                      return ChoosePlanContainer(
                        package: item,
                      );
                    }).toList(),
                  ),
                ),
              );
      }),
    );
  }
}
