import 'package:event_planner_light/view/screens/NavBar/Screens/My_Events/My_EventsScreen.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/Profile/ProfileScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../constants/colors_constants.dart';
import '../../widgets/CustomAppBar.dart';
import '../Drawer/Screens/AddEventsScreen/AddEventsScreens.dart';
import 'Screens/Explore/ExploreScreen.dart';
import 'Screens/Home/HomeScreen.dart';

class NavBarScreen extends StatefulWidget {
  static const routeName = "NavBarScreen";

  final VoidCallback onDrawerToggle;

  const NavBarScreen({super.key, required this.onDrawerToggle});

  @override
  _NavBarScreenState createState() => _NavBarScreenState();
}

class _NavBarScreenState extends State<NavBarScreen> {
  int _currentIndex = 0;

  // List of Screens
  final List<Widget> _screens = [
    const HomeScreen(),
    const ExploreScreen(),
    const MyEventsScreen(),
    const Profilescreen(),
  ];

  void _onTap(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        onDrawerToggle: widget.onDrawerToggle,
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
            icon: Icon(Icons.person_2_outlined),
            label: 'Profile',
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.kPrimaryColor,
        foregroundColor: Colors.white,
        onPressed: () {
          Get.toNamed(AddEAnventsScreens.routeName);
        },
        child: Icon(
          Icons.add,
        ),
      ),
    );
  }
}
