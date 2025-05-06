import 'package:event_planner_light/services/LocationServices.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/NotificationScreens/NotificationScreen.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/Home/ChooseYourLocation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  const CustomAppBar({super.key, required this.onDrawerToggle});

  final VoidCallback onDrawerToggle;

  @override
  State<CustomAppBar> createState() => _CustomAppBarState();

  @override
  Size get preferredSize => Size.fromHeight(5.h);
}

class _CustomAppBarState extends State<CustomAppBar> {
  String address = "Fetching location...";

  @override
  void initState() {
    super.initState();
    _loadAddress();
  }

  Future<void> _loadAddress() async {
    String currentAddress = await LocationServices.getCurrentAddress();
    setState(() {
      address = currentAddress;
    });
  }

  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: true,
      title: SafeArea(
        child: InkWell(
          onTap: () => Get.toNamed(ChooseYourLocationScreen.routeName),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
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
                address,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ],
          ),
        ),
      ),
      actions: [
        IconButton(
          onPressed: () {
            Get.toNamed(NotificationScreen.routeName);
          },
          icon: const Icon(Icons.notifications),
        ),
      ],
    );
  }
}
