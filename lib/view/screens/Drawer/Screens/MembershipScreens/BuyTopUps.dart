import 'package:event_planner_light/controllers/TopupsController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constants/TextConstant.dart';
import 'MemberShipScreen.dart';

class Buytopups extends GetView<TopupsController> {
  const Buytopups({super.key});
  static const routeName = 'Buytopups';

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
            : Padding(
                padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
                child: Wrap(
                  children: controller.topups.map((item) {
                    return SizedBox(
                      width: 30.w,
                      // height: 6.h,
                      child: CustomOutlinedButton(
                        contant: [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Text(
                                  "Name: ",
                                  style: TextConstants.bodyLargeMediumBlueBold(
                                      context),
                                ),
                                Text(
                                  item.name?.en ?? "",
                                  style: TextConstants.bodyLargeMediumBlueBold(
                                      context),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 4.w),
                            child: Text(
                              "(12 kd per month) 120 Yearly",
                              style: TextConstants.bodySmall_mediumBlue_normal(
                                  context),
                            ),
                          ),
                        ],
                        ontap: () {
                          // Get.toNamed(ChooseaplanScreen.routeName);
                        },
                      ),
                    );
                  }).toList(),
                ),
              );
      }),
    );
  }
}
