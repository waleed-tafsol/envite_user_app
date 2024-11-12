import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/supportScreen/generate_ticket_screen.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/supportScreen/widgets/support_container.dart';
import 'package:event_planner_light/view/widgets/ad_chips.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SupportScreen extends StatelessWidget {
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
            SupportContainer(),
            SizedBox(
              height: 1.h,
            ),
            SupportContainer(),
            SizedBox(
              height: 1.h,
            ),
            SupportContainer(),
            SizedBox(
              height: 1.h,
            ),
            SupportContainer(),
            SizedBox(
              height: 1.h,
            ),
            Spacer(),
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
