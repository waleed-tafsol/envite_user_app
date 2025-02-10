import 'package:event_planner_light/view/screens/NavBar/NavBarScreen.dart';
import 'package:event_planner_light/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'constants/routes.dart';
import 'constants/theme.dart';
import 'controllers/Auth_services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.bottom],
  );

  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);

//     Platform.isAndroid ?
//   SystemChrome.setSystemUIOverlayStyle(
//     const SystemUiOverlayStyle(
//       statusBarColor:
//           Colors.transparent, // You can set it transparent or any color
//       statusBarIconBrightness: Brightness.dark, // Dark icons and text (black)
//       statusBarBrightness: Brightness.dark, // For iOS status bar

//       systemNavigationBarColor:
//           Colors.transparent, // Set navigation bar background color
//       systemNavigationBarIconBrightness:
//           Brightness.dark, // Dark icons (black) in the navigation bar
//       systemNavigationBarDividerColor:
//           Colors.transparent, // Divider color (optional)
//     ),
//   ) : SystemChrome.setSystemUIOverlayStyle(
//   const SystemUiOverlayStyle(
//     statusBarColor: Colors.black, // Use black background to ensure dark icons
//     statusBarIconBrightness: Brightness.dark,
//     statusBarBrightness: Brightness.light, // Light status bar for dark icons
//     systemNavigationBarColor: Colors.transparent,
//     systemNavigationBarIconBrightness: Brightness.dark,
//     systemNavigationBarDividerColor: Colors.transparent,
//   ),
// );

  // Create and initialize AuthService
  Get.put(AuthService(), permanent: true);

  // await authService.initialize();

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        navigatorKey: navigatorKey,
        title: 'Event Planner',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme().lightTheme,
        initialRoute: SplashScreen.routeName,
        onGenerateRoute: Pages.onGenerateRoute,
        defaultTransition: Transition.rightToLeft,
        smartManagement: SmartManagement.full,
      );
    });
  }
}
