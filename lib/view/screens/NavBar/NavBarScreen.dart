import 'package:event_planner_light/view/screens/NavBar/Screens/my_events/my_events_screen.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/my_invites/my_invites_screen.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/Profile/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors_constants.dart';
import '../../../controllers/AddEventController.dart';
import '../../widgets/CustomAppBar.dart';
import '../Drawer/Screens/AddEventsScreen/AddEventsScreens.dart';
import 'DrawerWidget.dart';
import 'Screens/Explore/ExploreScreen.dart';
import 'Screens/Home/HomeScreen.dart';

class NavBarScreen extends StatefulWidget {
  static const routeName = "NavBarScreen";

  // final VoidCallback onDrawerToggle;

  const NavBarScreen({
    super.key,
    //  required this.onDrawerToggle
  });

  @override
  _NavBarScreenState createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _currentIndex = 0;

  // List of Screens
  final List<Widget> _screens = [
    const HomeScreen(),
     ExploreScreen(),
    const MyInvitesScreen(),
     MyEventsScreen(),
    const ProfileScreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: MyDrawer(),
      appBar: CustomAppBar(
        onDrawerToggle: () {},
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: _screens,
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: _currentIndex,
        onTap: _onTap,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.search_sharp),
            label: 'Explore',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'My Invites',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.calendar_today_outlined),
            label: 'My Events',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: Colors.white,
        onPressed: () {
          var controller = Get.put(AddEventController());
          controller.isAddPastEvents.value = false;
          Get.toNamed(AddEventsScreens.routeName);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
