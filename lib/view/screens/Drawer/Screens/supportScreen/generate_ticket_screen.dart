import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GenerateTicketScreen extends StatelessWidget {
  static const routeName = 'GenerateTicketScreen';
  const GenerateTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Support'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Generate Ticket',
              style: TextStyle(
                  color: AppColors.kBerkeleyBlue, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 1.5.h,
            ),
            const TextField(
                decoration: InputDecoration(
              hintText: "Title",
              // prefixIcon: Icon(Icons.email_outlined),
            )),
            SizedBox(
              height: 1.h,
            ),
            const TextField(
                maxLines: 4,
                decoration: InputDecoration(
                  hintText: "Description",

                  // prefixIcon: Icon(Icons.email_outlined),
                )),
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
                        'Send',
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
