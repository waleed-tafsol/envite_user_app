import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/view/screens/NotiFicationScreens/NotificationScreen.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/home_screen/choose_your_location_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.onDrawerToggle});

  final VoidCallback onDrawerToggle;

  @override
  Size get preferredSize => Size.fromHeight(70.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
    
    
      automaticallyImplyLeading: true,
      title: SafeArea(
        child: InkWell(
          onTap: () => Get.toNamed(ChooseyourlocationScreen.routeName),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(
                    Icons.location_on_outlined,
                    size: 18.sp,
                  ),
                  Text("Events near to you",
                      style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.normal,
                          color: AppColors.kBerkeleyBlue)),
                ],
              ),
              SizedBox(
                height: 5.h,
              ),
              Row(
                children: [
                  SizedBox(
                    width: 5.w,
                  ),
                  Text("Salmiya, Kuwait",
                      style: TextStyle(
                          fontSize: 18.sp,
                          fontWeight: FontWeight.bold,
                          color: AppColors.kBerkeleyBlue)),
                ],
              ),
            ],
          ),
        ),
      ),
      // leading: IconButton(
      //     onPressed: () {
      //       onDrawerToggle();
      //     },
      //     icon: const Icon(Icons.menu)),
      actions: [
        IconButton(
            onPressed: () {
              Get.toNamed(NotificationScreen.routeName);
            },
            icon: Icon(Icons.notifications)),
      ],
    );
  }
}
