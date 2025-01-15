import 'package:event_planner_light/bindings/navBarBinding.dart';
import 'package:event_planner_light/bindings/SignInBindings.dart';
import 'package:event_planner_light/bindings/SignUpBindings.dart';
import 'package:event_planner_light/bindings/splash_binding.dart';
import 'package:event_planner_light/services/customPrint.dart';
import 'package:event_planner_light/view/screens/NavBar/NavBarScreen.dart';
import 'package:event_planner_light/view/screens/OtpScreen.dart';
import 'package:event_planner_light/view/screens/SignIn/ForgotMyPasswordScreen.dart';
import 'package:event_planner_light/view/screens/SignUp/ConfirmAccountScreen.dart';
import 'package:event_planner_light/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bindings/OtpBindings.dart';
import '../bindings/auth_binding.dart';
import '../view/screens/SignIn/SignInScreen.dart';
import '../view/screens/SignUp/SignUpScreen.dart';
import '../view/screens/auth_screen.dart';

class Pages {
  static Transition get _routeTransition => Transition.fade;
  static Route<dynamic>? onGenerateRoute(RouteSettings settings) {
    Get.routing.args = settings.arguments;
    ColoredPrint.yellow(
        "Arguments: ${Get.routing.args}  routeName: ${settings.name}");
    switch (settings.name) {
      case SplashScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const SplashScreen(),
          binding: SplashBinding(),
          transition: _routeTransition,
        );

      case AuthScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const AuthScreen(),
          binding: AuthBinding(),
          transition: _routeTransition,
        );
      case SignUpScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => SignUpScreen(),
          binding: SignUpBindings(),
          transition: _routeTransition,
        );
      case SigninScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => SigninScreen(),
          binding: SignInBindings(),
          transition: _routeTransition,
        );
      case NavBarScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => NavBarScreen(),
          binding: NavbarBindings(),
          transition: _routeTransition,
        );
      case Confirmaccountscreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const Confirmaccountscreen(),
          // binding: AuthBinding(),
          transition: _routeTransition,
        );

      case ForgotMyPasswordEmailScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => ForgotMyPasswordEmailScreen(),
          // binding: AuthBinding(),
          transition: _routeTransition,
        );
      case ForgotMyPasswordConfirmScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => ForgotMyPasswordConfirmScreen(),
          // binding: AuthBinding(),
          transition: _routeTransition,
        );
      case OtpScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => OtpScreen(),
          binding: OtpBindings(),
          transition: _routeTransition,
        );

      default:
        return null;
    }
  }
}
