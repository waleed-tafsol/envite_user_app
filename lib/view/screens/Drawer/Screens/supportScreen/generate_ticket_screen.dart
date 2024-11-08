import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GenerateTicketScreen extends StatelessWidget {
  static const routeName = 'GenerateTicketScreen';
  const GenerateTicketScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Divider(),
            SizedBox(
              height: 2.h,
            ),
            Text(
              'Ticket Form',
              style: TextStyle(color: AppColors.kBerkeleyBlue),
            ),
            SizedBox(
              height: 1.h,
            ),
            Text(
              "Fill All The Required Information To Submit This Ticket",
              style: Theme.of(context)
                  .textTheme
                  .bodySmall!
                  .copyWith(color: AppColors.kBerkeleyBlue),
            ),
            SizedBox(
              height: 1.h,
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
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor),
                    onPressed: () {
                      // Get.toNamed(GenerateTicketScreen.routeName);
                    },
                    child: Text(
                      'cancel',
                      style: TextStyle(color: Colors.white),
                    )),
                SizedBox(
                  width: 1.w,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor),
                    onPressed: () {
                      // Get.toNamed(GenerateTicketScreen.routeName);
                    },
                    child: Text(
                      'Submit',
                      style: TextStyle(color: Colors.white),
                    )),
              ],
            )
          ],
        ),
      ),
    );
  }
}
