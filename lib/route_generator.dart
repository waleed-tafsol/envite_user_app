import 'package:envite_user_app/screens/sign_up_screen.dart';
import 'package:envite_user_app/screens/splash_screen.dart';
import 'package:envite_user_app/screens/welcome_screen.dart';
import 'package:flutter/material.dart';

const String splashRoute = '/';
const String loginRoute = '/login';
const String welcomeRoute = '/welcome';
const String signupRoute = '/signup';

class RouteGenerator {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    // final args = settings.arguments;

    switch (settings.name) {
      case splashRoute:
        return MaterialPageRoute(builder: (_) => const SplashScreen());
      case '/tasting_details':
      /*return MaterialPageRoute(
            builder: (_) => const TastingDetailsScreen(),
            settings: const RouteSettings(name: '/tasting_details'));*/
      case '/wines_details':
      /*return MaterialPageRoute(
            builder: (_) => WinesDetailScreen(
                  reviewButton: args,
                ));*/
      case welcomeRoute:
        return MaterialPageRoute(builder: (_) => const WelcomeScreen());
      case signupRoute:
        return MaterialPageRoute(builder: (_) => const SignUpScreen());

      default:
        return _errorRoute();
    }
  }

  static Route<dynamic> _errorRoute() {
    return MaterialPageRoute(builder: (_) {
      return const Scaffold(
        body: Center(
          child: Text('Something wrong in routes'),
        ),
      );
    });
  }
}
