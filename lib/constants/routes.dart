import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/MemberShipScreen.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/choose_plan_screen.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/payment_screen.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/NotiFicationScreens/NotificationScreen.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/home_screen/choose_your_location_screen.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/home_screen/events_detail_screen.dart';
import 'package:event_planner_light/view/screens/OtpScreen.dart';
import 'package:event_planner_light/view/screens/SignIn/ForgotMyPasswordScreen.dart';
import 'package:event_planner_light/view/screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../bindings/OtpBindings.dart';
import '../bindings/SignInBindings.dart';
import '../bindings/SignUpBindings.dart';
import '../bindings/auth_binding.dart';
import '../bindings/navBarBinding.dart';
import '../bindings/splash_binding.dart';
import '../services/customPrint.dart';
import '../view/screens/NavBar/NavBarScreen.dart';
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
      case ChooseyourlocationScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => ChooseyourlocationScreen(),
          binding: OtpBindings(),
          transition: _routeTransition,
        );
      case MyInvitesEventsDetailScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => MyInvitesEventsDetailScreen(),
          binding: OtpBindings(),
          transition: _routeTransition,
        );
      case NotificationScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => NotificationScreen(),
          binding: OtpBindings(),
          transition: _routeTransition,
        );
      case MembershipScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => MembershipScreen(),
          binding: OtpBindings(),
          transition: _routeTransition,
        );
      case ChooseaplanScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => ChooseaplanScreen(),
          binding: OtpBindings(),
          transition: _routeTransition,
        );
      case MemberShipPaymentScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => MemberShipPaymentScreen(),
          binding: OtpBindings(),
          transition: _routeTransition,
        );
      default:
        return null;
    }
  }
}
