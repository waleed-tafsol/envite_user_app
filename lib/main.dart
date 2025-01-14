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
  }
}
