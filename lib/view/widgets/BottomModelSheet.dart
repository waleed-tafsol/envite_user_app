import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/controllers/HomeScreenController.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/AddEventsScreen/ConfirmOrAddMoreEvents.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/ButPackagesScreen.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/my_events/packages_screen.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/my_events/send_invite_screen.dart';
import 'package:event_planner_light/view/screens/SignIn/SignInScreen.dart';
import 'package:event_planner_light/view/widgets/CustomChipWidgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/assets.dart';
import '../../constants/colors_constants.dart';
import '../../controllers/AddEventController.dart';
import '../screens/Drawer/Screens/AddEventsScreen/AddEventsScreens.dart';
import '../screens/Drawer/Screens/MembershipScreens/ChooseAPlan.dart';

class BottomSheetManager {
  static void _customBottomSheet(BuildContext context, List<Widget> children) {
    showModalBottomSheet(
      context: context,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(50)),
      ),
      backgroundColor: AppColors.kBluedarkShade,
      builder: (BuildContext context) {
        return SafeArea(
          child: Padding(
              padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
              child: Column(
                children: children,
              )),
        );
      },
    );
  }

  static void showAttendenceBottomSheet(BuildContext context) {
    _customBottomSheet(context, [
      Text(
        'You confirmed your attendance to the event',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 15.sp, color: Colors.white),
      ),
      SizedBox(height: 1.h),
      SvgPicture.asset(SvgAssets.clapping),
      SizedBox(height: 2.h),
      Text(
        'Invites App increase more your score',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Colors.white),
      ),
      SizedBox(height: 8.h),
      ElevatedButton(
        onPressed: () {
          // Action to rate the event
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          minimumSize: Size(double.infinity, 6.h),
          // primary: Colors.blueAccent, // Background color
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: const Text('Rate the event'),
      ),
      SizedBox(height: 0.5.h),
      SizedBox(
        width: double.infinity,
        height: 6.h,
        child: OutlinedButton(
          onPressed: () {},
          style: OutlinedButton.styleFrom(
            side: const BorderSide(color: Colors.white),
            padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(5),
            ),
          ),
          child: const Text(
            'See my score',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    ]);
  }

  static void youAreAlmostThere(BuildContext context) {
    _customBottomSheet(context, [
      Text(
        'You’re almost there!',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Colors.white),
      ),
      SizedBox(height: 1.h),
      SvgPicture.asset(SvgAssets.clapping),
      SizedBox(height: 2.h),
      Text(
        'Our admin team will review your account soon.',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 15.sp, color: Colors.white),
      ),
      SizedBox(height: 8.h),
      ElevatedButton(
        onPressed: () {
          // Action to rate the event
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          minimumSize: Size(double.infinity, 6.h),
          // primary: Colors.blueAccent, // Background color
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: const Text('Go to the Main page'),
      ),
    ]);
  }

  static void eventAdded(
    BuildContext context,
  ) {
    _customBottomSheet(context, [
      Text('Send Invite!',
          textAlign: TextAlign.center,
          style: TextConstants.bodyMedium_white_bold(context)
              .copyWith(fontSize: 17.sp)),
      SizedBox(height: 2.h),
      SvgPicture.asset(SvgAssets.sendArrow),
      Text('Send it to a private list of contacts',
          textAlign: TextAlign.center,
          style: TextConstants.bodyMedium_white_normal(context)),
      SizedBox(height: 2.h),
      SizedBox(
        width: double.infinity,
        height: 6.h,
        child: ElevatedButton(
          onPressed: () {
            Get.toNamed(ConfirmorAddMoreEvents.routeName);
          },
          child: const Text('Send now'),
        ),
      ),
    ]);
  }

  static void addPastEvents(BuildContext context) {
    _customBottomSheet(context, [
      Text(
        'Add Past Events',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .headlineMedium!
            .copyWith(color: Colors.white),
      ),
      SizedBox(height: 1.h),
      SvgPicture.asset(SvgAssets.clapping),
      SizedBox(height: 2.h),
      Text(
        'Do you have any past event to add into your portfolio? You can also add them later from edit portfolio screen.',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 15.sp, color: Colors.white),
      ),
      SizedBox(height: 4.h),
      ElevatedButton(
        onPressed: () {
          Get.back();
          var controller = Get.put(AddEventController());
          controller.isAddPastEvents.value = true;
          Get.toNamed(AddEventsScreens.routeName);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          minimumSize: Size(double.infinity, 6.h),
          // primary: Colors.blueAccent, // Background color
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: const Text('Yes I Have'),
      ),
      SizedBox(height: 2.h),
      ElevatedButton(
        onPressed: () {
          Get.back();
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          minimumSize: Size(double.infinity, 6.h),
          // primary: Colors.blueAccent, // Background color
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: const Text('Not Now'),
      ),
    ]);
  }

  // static void sendInvite(
  //   BuildContext context,
  // ) {
  //   _customBottomSheet(context, [
  //     k3hSizedBox,
  //     Center(
  //       child: Text('Send Invite!',
  //           textAlign: TextAlign.center,
  //           style: TextConstants.bodyMedium_white_bold(context)
  //               .copyWith(fontSize: 17.sp)),
  //     ),
  //     k4hSizedBox,
  //     Center(child: SvgPicture.asset(SvgAssets.sendArrow)),
  //     Text('Send it to a private list of contacts',
  //         textAlign: TextAlign.center,
  //         style: TextConstants.bodyMedium_white_normal(context)),
  //     // SizedBox(height: 2.h),
  //     Spacer(),
  //     SizedBox(
  //       width: double.infinity,
  //       height: 6.h,
  //       child: ElevatedButton(
  //         onPressed: () {
  //           Get.toNamed(SendInviteScreen.routeName);
  //         },
  //         child: const Text('Send now'),
  //       ),
  //     ),
  //   ]);
  // }

  static void adminWillConfirmAndSendYouTeQrCode(
    BuildContext context,
  ) {
    _customBottomSheet(context, [
      SvgPicture.asset(SvgAssets.sendArrow),
      SizedBox(height: 2.h),
      Text(
        'Admin will confirm and send you the QR Code',
        textAlign: TextAlign.center,
        style: Theme.of(context)
            .textTheme
            .bodyMedium!
            .copyWith(fontSize: 15.sp, color: Colors.white),
      ),
      SizedBox(height: 8.h),
      ElevatedButton(
        onPressed: () {
          // Action to rate the event
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          minimumSize: Size(double.infinity, 6.h),
          // primary: Colors.blueAccent, // Background color
          textStyle: const TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        child: const Text('Back to main page'),
      ),
    ]);
  }

  static void congratulationsAccountCreated(
    BuildContext context,
  ) {
    _customBottomSheet(context, [
      // const Spacer(),
      Text(
        'Congratulations!',
        textAlign: TextAlign.center,
        style: TextConstants.bodyMedium_white_bold(context),
      ),
      SizedBox(height: 2.h),
      SvgPicture.asset(SvgAssets.clapping),
      SizedBox(height: 2.h),
      Text(
        'Your account has been created successfully',
        textAlign: TextAlign.center,
        style: TextConstants.bodysmall_white_normal(context),
      ),
      SizedBox(height: 2.h),
      ElevatedButton(
        onPressed: () {
          Get.offAllNamed(SigninScreen.routeName);
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          minimumSize: Size(double.infinity, 6.h),
          // primary: Colors.blueAccent, // Background color
        ),
        child: const Text('Sign In'),
      ),
    ]);
  }

  static void upgradePlan(
    BuildContext context,
  ) {
    _customBottomSheet(context, [
      // const Spacer(),
      SizedBox(
        height: 5.h,
      ),
      Text(
        'Upgrade Your Plan!',
        textAlign: TextAlign.center,
        style: TextConstants.bodyMedium_white_bold(context),
      ),
      SizedBox(height: 2.h),
      SvgPicture.asset(SvgAssets.clapping),
      SizedBox(height: 2.h),
      Text(
        'You Need to upgrade Your plan',
        textAlign: TextAlign.center,
        style: TextConstants.bodysmall_white_normal(context),
      ),
      SizedBox(height: 2.h),
      ElevatedButton(
        onPressed: () {
          Get.toNamed(
            BuyPackagesScreen.routeName,
          );
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          minimumSize: Size(double.infinity, 6.h),
          // primary: Colors.blueAccent, // Background color
        ),
        child: const Text('Upgrade Your Plan'),
      ),
    ]);
  }

  static void upgradEvent(
    BuildContext context,
  ) {
    _customBottomSheet(context, [
      // const Spacer(),
      SizedBox(
        height: 5.h,
      ),
      Text(
        'You Have consume your invites upgrade your package or Purchase The Top Up ',
        textAlign: TextAlign.center,
        style: TextConstants.bodyMedium_white_bold(context),
      ),
      SizedBox(height: 2.h),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(SvgAssets.up),
        ],
      ),
      SizedBox(height: 2.h),
      Text(
        'You Need to upgrade Your plan',
        textAlign: TextAlign.center,
        style: TextConstants.bodysmall_white_normal(context),
      ),
      // SizedBox(height: 2.h),
      Spacer(),
      ElevatedButton(
        onPressed: () {
          Get.toNamed(BuyPackagesScreen.routeName, arguments: {"type": "all"});
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          minimumSize: Size(double.infinity, 6.h),
          // primary: Colors.blueAccent, // Background color
        ),
        child: const Text('Upgrade Now'),
      ),
    ]);
  }

  static void buySubscriptionForPublic(
    BuildContext context,
  ) {
    _customBottomSheet(context, [
      // const Spacer(),
      SizedBox(
        height: 5.h,
      ),
      Text(
        'You do not Have the Subscription to Create Public Events',
        textAlign: TextAlign.center,
        style: TextConstants.bodyMedium_white_bold(context),
      ),
      SizedBox(height: 2.h),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(SvgAssets.up),
        ],
      ),
      SizedBox(height: 2.h),
      Text(
        'You Need to Buy A plan For Public Events',
        textAlign: TextAlign.center,
        style: TextConstants.bodysmall_white_normal(context),
      ),
      // SizedBox(height: 2.h),
      Spacer(),
      ElevatedButton(
        onPressed: () {
          Get.toNamed(BuyPackagesScreen.routeName, arguments: {"type": "all"});
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          minimumSize: Size(double.infinity, 6.h),
          // primary: Colors.blueAccent, // Background color
        ),
        child: const Text('Buy Now'),
      ),
    ]);
  }

  static void buySubscriptionForExclusive(
    BuildContext context,
  ) {
    _customBottomSheet(context, [
      // const Spacer(),
      SizedBox(
        height: 5.h,
      ),
      Text(
        'You do not Have the Subscription to Attend Exclusive Events',
        textAlign: TextAlign.center,
        style: TextConstants.bodyMedium_white_bold(context),
      ),
      SizedBox(height: 2.h),
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          SvgPicture.asset(SvgAssets.up),
        ],
      ),
      SizedBox(height: 2.h),
      Text(
        'You Need to Buy A plan For Exclusive Events',
        textAlign: TextAlign.center,
        style: TextConstants.bodysmall_white_normal(context),
      ),

      Spacer(),
      ElevatedButton(
        onPressed: () {
          Get.toNamed(BuyPackagesScreen.routeName, arguments: {"type": "all"});
        },
        style: ElevatedButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          minimumSize: Size(double.infinity, 6.h),
          // primary: Colors.blueAccent, // Background color
        ),
        child: const Text('Buy Now'),
      ),
    ]);
  }

  // Method to show a bottom sheet with form fields
  void showFormBottomSheet(BuildContext context, List<Widget> children) {
    _customBottomSheet(context, children);
  }
}
