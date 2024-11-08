import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import 'constants/routes.dart';
import 'constants/theme.dart';
import 'view/screens/SplashScreen.dart';

void main() async {
  await GetStorage.init();
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({
    super.key,
  });

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(
      SystemUiMode.edgeToEdge,
      overlays: [SystemUiOverlay.bottom],
    );
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor:
            Colors.transparent, // You can set it transparent or any color
        statusBarIconBrightness: Brightness.dark, // Dark icons and text (black)
        statusBarBrightness: Brightness.light, // For iOS status bar

        systemNavigationBarColor:
            Colors.transparent, // Set navigation bar background color
        systemNavigationBarIconBrightness:
            Brightness.dark, // Dark icons (black) in the navigation bar
        systemNavigationBarDividerColor:
            Colors.transparent, // Divider color (optional)
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveSizer(builder: (context, orientation, deviceType) {
      return GetMaterialApp(
        title: 'Event Planner',
        debugShowCheckedModeBanner: false,
        theme: CustomTheme().lightTheme,
        initialRoute: Splash_screen.routeName,
        onGenerateRoute: Pages.onGenerateRoute,
        defaultTransition: Transition.rightToLeft,
        smartManagement: SmartManagement.full,
      );
    });
  }
}
