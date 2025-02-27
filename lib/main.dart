import 'package:event_planner_light/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'constants/routes.dart';
import 'constants/theme.dart';
import 'controllers/Auth_services.dart';
import 'services/FirebaseServices.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await FirebaseService.initializeFirebase();
  SystemChrome.setEnabledSystemUIMode(
    SystemUiMode.edgeToEdge,
    overlays: [SystemUiOverlay.bottom],
  );
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  Get.put(AuthService(), permanent: true);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
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
