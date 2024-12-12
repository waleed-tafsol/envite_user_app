import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/SupportController.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/supportScreen/generate_ticket_screen.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/supportScreen/widgets/support_container.dart';
import 'package:event_planner_light/view/widgets/ad_chips.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SupportScreen extends GetView<Supportcontroller> {
  const SupportScreen({super.key});
  static const routeName = "SupportScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SupportChip(),
            SizedBox(
              height: 3.h,
            ),
            Expanded(
              child: Obx(() {
                return controller.isloading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : ListView.builder(
                        itemCount: controller.tickets.length,
                        itemBuilder: (context, index) {
                          return SupportContainer(
                            title: controller.tickets[index].title ?? "",
                            subTitle:
                                controller.tickets[index].description ?? "",
                          );
                        });
              }),
            ),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.kPrimaryColor),
                      onPressed: () {
                        Get.toNamed(GenerateTicketScreen.routeName);
                      },
                      child: Text(
                        'Generate Ticket',
                        style: TextStyle(color: Colors.white),
                      )),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
