import 'package:event_planner_light/view/screens/Drawer/DrawerScreen.dart';
import 'package:event_planner_light/view/screens/NavBar/NavBarScreen.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/Home/HomeScreen.dart';
import 'package:event_planner_light/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'constants/routes.dart';
import 'constants/theme.dart';
import 'controllers/Auth_services.dart';
import 'view/screens/auth_screen.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  // SystemChrome.setEnabledSystemUIMode(
  //   SystemUiMode.edgeToEdge,
  //   overlays: [SystemUiOverlay.bottom],
  // );
  // SystemChrome.setSystemUIOverlayStyle(
  //   const SystemUiOverlayStyle(
  //     statusBarColor:
  //         Colors.transparent, // You can set it transparent or any color
  //     statusBarIconBrightness: Brightness.dark, // Dark icons and text (black)
  //     statusBarBrightness: Brightness.light, // For iOS status bar

  //     systemNavigationBarColor:
  //         Colors.transparent, // Set navigation bar background color
  //     systemNavigationBarIconBrightness:
  //         Brightness.dark, // Dark icons (black) in the navigation bar
  //     systemNavigationBarDividerColor:
  //         Colors.transparent, // Divider color (optional)
  //   ),
  // );

  // Create and initialize AuthService
  Get.put(AuthService(), permanent: true);
  // await authService.initialize();

  // Optionally delay for other setups
  await Future.delayed(Durations.medium1);

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Event Planner',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme().lightTheme,
        initialRoute: authService.isAuthenticated.value
            ? NavBarScreen.routeName
            : SplashScreen.routeName,
        onGenerateRoute: Pages.onGenerateRoute,
        defaultTransition: Transition.rightToLeft,
        smartManagement: SmartManagement.full,
      );
    });
  }
}
