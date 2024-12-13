import 'package:event_planner_light/view/screens/Drawer/Screens/NotiFicationScreens/NotificationScreen.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/Home/ChooseYourLocation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.onDrawerToggle});
  final VoidCallback onDrawerToggle;

  @override
  Size get preferredSize => Size.fromHeight(8.h);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: SafeArea(
        child: InkWell(
          onTap: () => Get.toNamed(ChooseyourlocationScreen.routeName),
          child: Column(
            children: [
              Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  const Icon(Icons.location_on_outlined),
                  Text(
                    "Events near to you",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                ],
              ),
              Text(
                "Salmiya, Kuwait",
                style: Theme.of(context).textTheme.headlineMedium,
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
