<<<<<<< HEAD
import 'package:event_planner_light/view/screens/NavBar/NavBarScreen.dart';
import 'package:event_planner_light/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import 'constants/routes.dart';
import 'constants/theme.dart';
import 'controllers/Auth_services.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

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
        initialRoute: authService.isAuthenticated.value
            ? NavBarScreen.routeName
            : SplashScreen.routeName,
        onGenerateRoute: Pages.onGenerateRoute,
        defaultTransition: Transition.rightToLeft,
        smartManagement: SmartManagement.full,
      );
    });
=======
import 'package:envite_user_app/route_generator.dart';
import 'package:envite_user_app/utils/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

final GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();
final RouteObserver<ModalRoute> routeObserver = RouteObserver<ModalRoute>();

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(430, 932),
        //useInheritedMediaQuery: true,
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return GetMaterialApp(
            debugShowCheckedModeBanner: false,
            title: 'Envite',
            theme: CustomTheme().lightTheme,
            navigatorObservers: [routeObserver],
            initialRoute: '/',
            navigatorKey: navigatorKey,
            onGenerateRoute: RouteGenerator.generateRoute,
          );
        });
>>>>>>> 5dca189434dfc941921dc2717b94753e6bf574af
  }
}
