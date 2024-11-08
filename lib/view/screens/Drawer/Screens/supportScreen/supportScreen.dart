import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/supportScreen/generate_ticket_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class SupportScreen extends StatefulWidget {
  const SupportScreen({super.key});
  static const routeName = "SupportScreen";

  @override
  State<SupportScreen> createState() => _SupportScreenState();
}

class _SupportScreenState extends State<SupportScreen> {
  String selectedStatus = 'Status'; // Initial value

  List<String> statuses = ['Resolved', 'Pending', 'Completed'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support Tickets'),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 3.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Filter By',
                  style:
                      TextStyle(fontSize: 14, color: AppColors.kBerkeleyBlue),
                ),
                SizedBox(width: 15),
                DropdownButton<String>(
                  value: selectedStatus,
                  items: [
                    DropdownMenuItem(
                      child: Text('Status',
                          style: TextStyle(
                              color: AppColors.kBerkeleyBlue, fontSize: 15)),
                      value: 'Status',
                    ),
                    ...statuses.map((status) => DropdownMenuItem(
                          child: Text(status),
                          value: status,
                        )),
                  ],
                  onChanged: (value) {
                    setState(() {
                      selectedStatus = value!;
                    });
                  },
                  style: TextStyle(color: Colors.black, fontSize: 16),
                  icon: Icon(Icons.arrow_drop_down),
                  dropdownColor: Colors.white,
                ),
                Spacer(),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor),
                    onPressed: () {
                      Get.toNamed(GenerateTicketScreen.routeName);
                    },
                    child: Text(
                      'Generate Ticker',
                      style: TextStyle(color: Colors.white),
                    ))
              ],
            ),
            SizedBox(
              height: 3.h,
            ),
            Container(
              height: 40,
              width: double.infinity,
              decoration: BoxDecoration(
                  color: Color(0xffD9DBDF),
                  borderRadius: BorderRadius.circular(5)),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: Row(
                  children: [
                    Expanded(
                      child: Text(
                        'Title',
                        style: TextStyle(color: AppColors.kBerkeleyBlue),
                      ),
                    ),
                    Expanded(
                      flex: 2,
                      child: Text(
                        'Description',
                        style: TextStyle(color: AppColors.kBerkeleyBlue),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        'Status',
                        style: TextStyle(color: AppColors.kBerkeleyBlue),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: (context, index) {
                    return Container(
                      width: double.infinity,
                      padding: EdgeInsets.symmetric(vertical: 8.0),
                      decoration:
                          BoxDecoration(borderRadius: BorderRadius.circular(5)),
                      child: Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.w),
                        child: Column(
                          children: [
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Text(
                                    'Password Reset',
                                    style: TextStyle(
                                        color: AppColors.kBerkeleyBlue,
                                        fontSize: 13.5.sp),
                                  ),
                                ),
                                Expanded(
                                  flex: 2,
                                  child: Text(
                                    'Figma ipsum component variant main layer. Underline select slice rectangle pen.',
                                    style: TextStyle(
                                        color: AppColors.kBerkeleyBlue,
                                        fontSize: 13.5.sp),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Resolved',
                                    style: TextStyle(
                                        color: AppColors.kBerkeleyBlue,
                                        fontSize: 13.5.sp),
                                  ),
                                ),
                              ],
                            ),
                            Divider()
                          ],
                        ),
                      ),
                    );
                  }),
            )
          ],
        ),
      ),
    );
  }
}
