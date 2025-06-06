import 'package:event_planner_light/bindings/AdsBindings.dart';
import 'package:event_planner_light/bindings/CuponsBindings.dart';
import 'package:event_planner_light/bindings/EditProfileBindings.dart';
import 'package:event_planner_light/bindings/NotificationScreen.dart';
import 'package:event_planner_light/bindings/SignInBindings.dart';
import 'package:event_planner_light/bindings/SignUpBindings.dart';
import 'package:event_planner_light/bindings/event_detail_bindings.dart';
import 'package:event_planner_light/bindings/navBarBinding.dart';
import 'package:event_planner_light/bindings/splash_binding.dart';
import 'package:event_planner_light/bindings/supportBindings.dart';
import 'package:event_planner_light/services/customPrint.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/AddEventsScreen/AddEventsScreens.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/AddEventsScreen/CreateAnInvitation.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/couponScreen.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/supportScreen/generate_ticket_screen.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/supportScreen/supportScreen.dart';
import 'package:event_planner_light/view/screens/NavBar/NavBarScreen.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/EventDetailScreen/events_detail_screen.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/Home/ChooseYourLocation.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/Home/nearby_events.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/Profile/edit_profile_screen.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/my_events/edit_event_details.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/my_events/my_events_screen.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/my_events/send_invite_screen.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/my_invites/PaymentWebView.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/my_invites/my_invites_event_detail_screen.dart';
import 'package:event_planner_light/view/screens/OtpScreen.dart';
import 'package:event_planner_light/view/screens/SignIn/ForgotMyPasswordScreen.dart';
import 'package:event_planner_light/view/screens/SignUp/ConfirmAccountScreen.dart';
import 'package:event_planner_light/view/screens/ads/add_ads_screen.dart';
import 'package:event_planner_light/view/screens/ads/ads_screen.dart';
import 'package:event_planner_light/view/screens/splash_screen.dart';
import 'package:event_planner_light/view/screens/view_all_my_events_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../bindings/AddEAnventsBindings.dart';
import '../bindings/ChooseYourLocationBindings.dart';
import '../bindings/CmsBindings.dart';
import '../bindings/ContactsSelectionBindings.dart';
import '../bindings/OtpBindings.dart';
import '../bindings/auth_binding.dart';
import '../view/screens/Drawer/Screens/AddEventsScreen/ConfirmOrAddMoreEvents.dart';
import '../view/screens/Drawer/Screens/NotificationScreens/NotificationScreen.dart';
import '../view/screens/NavBar/Screens/EventDetailScreen/ContactsScreen.dart';
import '../view/screens/NavBar/Screens/Home/HomeScreen.dart';
// import '../view/screens/NavBar/SuggestedEventDetailScreen.dart';
import '../view/screens/SignIn/SignInScreen.dart';
import '../view/screens/SignUp/SignUpScreen.dart';
import '../view/screens/auth_screen.dart';
import '../view/screens/cms/CmsScreen.dart';
import '../view_all_explorer_event_screen.dart';

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
      case ViewAllMyEventsScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const ViewAllMyEventsScreen(),
          transition: _routeTransition,
        );
      case ViewAllExplorerEventScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const ViewAllExplorerEventScreen(),
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
      case ChooseYourLocationScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => ChooseYourLocationScreen(),
          binding: ChooseyourLocationBindings(),
          transition: _routeTransition,
        );
      // case DrawerScreen.routeName:
      //   return GetPageRoute(
      //     settings: settings,
      //     page: () => const DrawerScreen(),
      //     binding: DrawerBindings(),
      //     transition: _routeTransition,
      //   );
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
      case HomeScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const HomeScreen(),
          // binding: AuthBinding(),
          transition: _routeTransition,
        );
      case MyInvitesEventsDetailScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const MyInvitesEventsDetailScreen(),
          // binding: AuthBinding(),
          transition: _routeTransition,
        );
      case Confirmaccountscreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const Confirmaccountscreen(),
          // binding: AuthBinding(),
          transition: _routeTransition,
        );
      case NotificationScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => const NotificationScreen(),
          binding: NotificationBindings(),
          transition: _routeTransition,
        );
      // case MembershipScreen.routeName:
      //   return GetPageRoute(
      //     settings: settings,
      //     page: () => const MembershipScreen(),
      //     binding: MembershipBindings(),
      //     transition: _routeTransition,
      //   );
      // case PaymentScreen.routeName:
      //   return GetPageRoute(
      //     settings: settings,
      //     page: () => PaymentScreen(),
      //     binding: PaymentControllerBindings(),
      //     // binding: AuthBinding(),
      //     transition: _routeTransition,
      //   );

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
      case AddEventsScreens.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => AddEventsScreens(),
          binding: AddeventBindings(),
          transition: _routeTransition,
        );
      case OtpScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => OtpScreen(),
          binding: OtpBindings(),
          transition: _routeTransition,
        );
      case CreateAnInvitationScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => CreateAnInvitationScreen(),
          // binding: AuthBinding(),
          transition: _routeTransition,
        );
      case ConfirmorAddMoreEvents.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => ConfirmorAddMoreEvents(),
          // binding: AuthBinding(),
          transition: _routeTransition,
        );
      // case CreatePortfolioScreen.routeName:
      //   return GetPageRoute(
      //     settings: settings,
      //     page: () => CreatePortfolioScreen(),
      //     binding: Createportfoliobindings(),
      //     transition: _routeTransition,
      //   );
      case SupportScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => SupportScreen(),
          binding: SupportBindings(),
          transition: _routeTransition,
        );
      case CouponScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => CouponScreen(),
          binding: CouponsBindings(),
          transition: _routeTransition,
        );
      case GenerateTicketScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => GenerateTicketScreen(),
          // binding: Createportfoliobindings(),
          transition: _routeTransition,
        );
      case AdsScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => AdsScreen(),
          binding: AdsBindings(),
          transition: _routeTransition,
        );
      case AddAdsScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => AddAdsScreen(),
          // binding: Createportfoliobindings(),
          transition: _routeTransition,
        );

      case EditProfileScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => EditProfileScreen(),
          binding: EditProfileBindings(),
          transition: _routeTransition,
        );
      // case Buytopups.routeName:
      //   return GetPageRoute(
      //     settings: settings,
      //     page: () => Buytopups(),
      //     binding: AddTopupsBindings(),
      //     transition: _routeTransition,
      //   );
      // case BuyPackagesScreen.routeName:
      //   return GetPageRoute(
      //     settings: settings,
      //     page: () => BuyPackagesScreen(),
      //     binding: PackagesControllerBindings(),
      //     transition: _routeTransition,
      //   );
      // case MembershipScreen.routeName:
      //   return GetPageRoute(
      //     settings: settings,
      //     page: () => Member(),
      //     binding: MembershipBindings(),
      //     transition: _routeTransition,
      //   );

      case MyEventsScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => MyEventsScreen(),
          // binding: MembershipBindings(),
          transition: _routeTransition,
        );
      case EventsDetailScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => EventsDetailScreen(),
          binding: EventDetailBindings(),
          transition: _routeTransition,
        );
      // case SuggestedEventsDetailScreen.routeName:
      //   return GetPageRoute(
      //     settings: settings,
      //     page: () => SuggestedEventsDetailScreen(),
      //     // binding: EventDetailBindings(),
      //     transition: _routeTransition,
      //   );
      case SendInviteScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => SendInviteScreen(),
          // binding: MembershipBindings(),
          transition: _routeTransition,
        );
      // case PackagesScreen.routeName:
      //   return GetPageRoute(
      //     settings: settings,
      //     page: () => PackagesScreen(),
      //     // binding: MembershipBindings(),
      //     transition: _routeTransition,
      //   );
      case NearbyEvents.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => NearbyEvents(),
          // binding: MembershipBindings(),
          transition: _routeTransition,
        );
      // case\
      case CmsScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => CmsScreen(),
          binding: Cmsbindings(),
          transition: _routeTransition,
        );

      case EditEventsDetailScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => EditEventsDetailScreen(),
          transition: _routeTransition,
        );
      case ContactsSelectionScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => ContactsSelectionScreen(),
          binding: ContactSelectionBindings(),
          transition: _routeTransition,
        );
      case PaymentWebviewScreen.routeName:
        return GetPageRoute(
          settings: settings,
          page: () => PaymentWebviewScreen(),
          transition: _routeTransition,
        );

      default:
        return null;
    }
  }
}
