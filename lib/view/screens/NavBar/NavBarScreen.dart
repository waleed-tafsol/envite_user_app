import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/AddEventController.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/add_event%20_screen/add_event_screen.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/my_events/my_events.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import '../../widgets/CustomAppBar.dart';
import 'DrawerWidget.dart';
import 'Screens/explore_screen/ExploreScreen.dart';
import 'Screens/home_screen/HomeScreen.dart';
import 'Screens/my_invites_screen/MyInvitesScreen.dart';
import 'Screens/profile_screen/ProfileScreen.dart';

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
     HomeScreen(),
    ExploreScreen(),
    const MyInvitesScreen(),
    const MyEventsScreen(),
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
          BottomNavigationBarItem(icon: Icon(Icons.event_note),label: 'My Events'),
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
