import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/controllers/MyProfileController.dart';
import 'package:event_planner_light/utills/enums.dart';
import 'package:event_planner_light/utills/string_decoration.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/Profile/edit_profile_screen.dart';
import 'package:event_planner_light/view/widgets/membership_container.dart';
import 'package:event_planner_light/view/widgets/topup_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class ProfileScreen extends GetView<MyProfileController> {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
      child: Stack(
        fit: StackFit.passthrough,
        children: [
          Positioned(
              top: 0,
              child: Image.asset(
                Assets.ellips,
                width: 100.w,
                fit: BoxFit.fitWidth,
              )),
          Padding(
            padding: EdgeInsets.only(right: 4.w, left: 4.w, top: 7.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.max,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            Get.toNamed(EditProfileScreen.routeName);
                          },
                          icon: Icon(Icons.mode_edit_outlined)),
                    ),
                  ),
                ),
                Center(
                  child: ClipOval(child: Obx(() {
                    return Image.network(
                      authService.me.value?.photo ?? "",
                      width: 30.w,
                      height: 30.w,
                      fit: BoxFit.cover,
                      errorBuilder: (context, error, stackTrace) =>
                          Icon(Icons.error_outline),
                    );
                  })),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Center(
                  child: Obx(() {
                    return Text(
                      capitalizeFirstLetter(
                          authService.me.value?.fullName ?? "User Name"),
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.kBerkeleyBlue),
                    );
                  }),
                ),

                SizedBox(
                  height: 3.h,
                ),
                // Align(
                //     alignment: Alignment.centerLeft,
                //     child: Text(
                //       'About Me',
                //       style: Theme.of(context)
                //           .textTheme
                //           .titleLarge!
                //           .copyWith(color: Color(0xff457B9D)),
                //     )),
                // k1hSizedBox,
                // Obx(() {
                //   return Text(
                //     authService.me.value?.description ?? "About Me",
                //     style: Theme.of(context)
                //         .textTheme
                //         .bodyLarge!
                //         .copyWith(color: AppColors.kBerkeleyBlue),
                //   );
                // }),

                authService.me.value?.role?.first == UserRoles.user.text
                    ? k3hSizedBox
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'About Me',
                            style: Theme.of(context)
                                .textTheme
                                .titleLarge!
                                .copyWith(color: Color(0xff457B9D)),
                          ),
                          k1hSizedBox,
                          Obx(() {
                            return Text(
                              authService.me.value?.description ?? "About Me",
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColors.kBerkeleyBlue),
                            );
                          }),
                          k3hSizedBox,
                        ],
                      ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Contact Info',
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: Color(0xff457B9D)),
                    )),
                k1hSizedBox,
                Align(
                    alignment: Alignment.centerLeft,
                    child: Obx(() {
                      return Text(
                        'Email: ${authService.me.value?.email ?? "About Me"}',
                        style: Theme.of(context)
                            .textTheme
                            .bodyLarge!
                            .copyWith(color: AppColors.kBerkeleyBlue),
                      );
                    })),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Obx(() {
                      return authService.me.value?.phoneNumber == null
                          ? SizedBox()
                          : Text(
                              'Contact: ${authService.me.value?.phoneNumber ?? ""}',
                              style: Theme.of(context)
                                  .textTheme
                                  .bodyLarge!
                                  .copyWith(color: AppColors.kBerkeleyBlue),
                            );
                    })),
                k3hSizedBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'My Packages',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Color(0xff457B9D)),
                  ),
                ),
                k1hSizedBox,
                Obx(() {
                  final subscriptions = authService.me.value?.subscriptions;
                  if (subscriptions == null || subscriptions.isEmpty) {
                    return Text(
                      'You don\'t have any package right now',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.kBerkeleyBlue),
                    ); // Return an empty widget if the list is null or empty
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: subscriptions.map((item) {
                      return MembershipContainer(
                        subscription: item,
                      );
                    }).toList(),
                  );
                }),
                k3hSizedBox,
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Top Up',
                    style: Theme.of(context)
                        .textTheme
                        .titleLarge!
                        .copyWith(color: Color(0xff457B9D)),
                  ),
                ),
                k1hSizedBox,
                TopupContainer(),
                // CustomOutlinedButton(
                //   contant: [
                //     Padding(
                //       padding: EdgeInsets.symmetric(horizontal: 4.w),
                //       child: Row(
                //         mainAxisSize: MainAxisSize.min,
                //         children: [
                //           const Icon(
                //             Icons.delete_outline,
                //             color: AppColors.kBlueMediumShade,
                //           ),
                //           Text(
                //             "Delete my account",
                //             style:
                //                 TextConstants.bodyLargeMediumBlueBold(context),
                //           ),
                //         ],
                //       ),
                //     ),
                //   ],
                //   ontap: () {
                //     // Get.offAllNamed(SigninScreen.routeName);
                //     // Get.toNamed(CreatePortfolioScreen.routeName);
                //   },
                // ),
                // SizedBox(
                //   height: 5.h,
                // ),
                // SizedBox(
                //   height: 6.h,
                //   width: double.infinity,
                //   child: ElevatedButton(
                //       style: StylesConstants.elevated_b_redBack_whiteFore,
                //       onPressed: () {
                //         Get.toNamed(AddEventsScreens.routeName, arguments: {
                //           "isAddPastEvents": true,
                //         });
                //       },
                //       child: Text('Add past event')),
                // ),
                SizedBox(
                  height: 10.h,
                ),
                InkWell(
                  onTap: () {
                    // _showDeleteConfirmationDialog() {
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return Dialog(
                          child: Padding(
                            padding: EdgeInsets.symmetric(vertical: 2.h),
                            child: Column(
                              mainAxisSize: MainAxisSize.min,
                              children: <Widget>[
                                Text(
                                  'Delete Account',
                                  style: TextStyle(
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                  ),
                                ),
                                k2hSizedBox,
                                Text(
                                  'Are you sure you want to delete your account? This action is irreversible.',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    color: Colors.black,
                                  ),
                                ),
                                k1hSizedBox,
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                    TextButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      child: Text(
                                        'Cancel',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                        ),
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        authService.deleteAccount();
                                      },
                                      child: Text(
                                        'Delete',
                                        style: TextStyle(
                                          fontSize: 16.sp,
                                          color: Colors.red,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    );
                    // }
                  },
                  child: Container(
                    height: 7.h,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: AppColors.kPrimaryColor,
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Center(
                      child: Obx(() {
                        return controller.isloading.value
                            ? CircularProgressIndicator(
                                color: Colors.white,
                              )
                            : Text(
                                "Delete my account",
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              );
                      }),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
