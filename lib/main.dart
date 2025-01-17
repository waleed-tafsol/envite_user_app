import 'package:event_planner_light/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'constants/routes.dart';
import 'constants/theme.dart';
import 'controllers/Auth_services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  // Create and initialize AuthService
  Get.put(AuthService(), permanent: true);
  await authService.initialize();

  // Optionally delay for other setups
  await Future.delayed(Durations.medium1);

  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        //useInheritedMediaQuery: true,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            navigatorKey: navigatorKey,
            title: 'Envite User App',
            debugShowCheckedModeBanner: false,
            theme: CustomTheme().lightTheme,
            initialRoute: SplashScreen.routeName,
            // initialRoute: authService.isAuthenticated.value
            //     ? NavBarScreen.routeName
            //     : SplashScreen.routeName,
            onGenerateRoute: Pages.onGenerateRoute,
            defaultTransition: Transition.rightToLeft,
            smartManagement: SmartManagement.full,
          );
        });
  }
}
