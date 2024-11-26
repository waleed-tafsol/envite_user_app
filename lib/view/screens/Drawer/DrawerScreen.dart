import 'dart:math';
import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/MemberShipScreen.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/couponScreen.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/supportScreen/supportScreen.dart';
import 'package:event_planner_light/view/screens/ads/ads_screen.dart';
import 'package:event_planner_light/view/screens/top_ups/top_up_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../NavBar/NavBarScreen.dart';
import '../SignIn/SignInScreen.dart';

class DrawerScreen extends StatefulWidget {
  const DrawerScreen({super.key});
  static const routeName = "DrawerScreen";

  @override
  State<DrawerScreen> createState() => _DrawerScreenState();
}

class _DrawerScreenState extends State<DrawerScreen> {
  double value = 0;

  void toggleDrawer() {
    setState(() {
      value == 0 ? value = 1 : value = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Scaffold(
          body: Container(
            padding: EdgeInsets.only(top: 4.h, left: 4.w),
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                colors: [
                  Color.fromARGB(255, 89, 139, 182),
                  AppColors.kBerkeleyBlue,
                ],
                begin: Alignment.centerRight,
                end: Alignment.centerLeft,
              ),
            ),
            child: Column(
              children: [
                Align(
                  alignment: Alignment(0, 0.0),
                  child: IconButton(
                      onPressed: () {
                        toggleDrawer();
                      },
                      icon: Icon(
                        size: 10.w,
                        Icons.cancel_outlined,
                        color: AppColors.kBlueMediumShade,
                      )),
                ),
                Row(
                  children: [
                    ClipOval(
                      child: Container(
                        height: 8.h,
                        width: 8.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          image: const DecorationImage(
                              image: AssetImage(Assets.squareImage)),
                          boxShadow: [
                            BoxShadow(
                              color:
                                  AppColors.kBlueMediumShade.withOpacity(0.6),
                              spreadRadius: 10,
                              blurRadius: 2,
                              offset: const Offset(1, 1),
                            ),
                          ],
                        ),
                        // child: Image.asset(
                        //   Assets.squareImage,
                        //   height: 8.h,
                        //   width: 8.h,
                        // ),
                      ),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text("Ghanem Abdallah",
                        style: Theme.of(context)
                            .textTheme
                            .headlineLarge!
                            .copyWith(color: AppColors.kBlueMediumShade)),
                  ],
                ),
                SizedBox(
                  height: 4.h,
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(AdsScreen.routeName);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.support_agent,
                        color: AppColors.kBlueMediumShade,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text("Ads",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.kBlueMediumShade)),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 40.w,
                    child: const Divider(
                      // thickness: 2,

                      color: AppColors.kBlueMediumShade,
                    ),
                  ),
                ),
                // InkWell(
                //   onTap: () {
                //     Get.toNamed(TopUpScreen.routeName);
                //   },
                //   child: Row(
                //     children: [
                //       const Icon(
                //         Icons.support_agent,
                //         color: AppColors.kBlueMediumShade,
                //       ),
                //       SizedBox(
                //         width: 4.w,
                //       ),
                //       Text("Top Ups",
                //           style: Theme.of(context)
                //               .textTheme
                //               .bodyMedium!
                //               .copyWith(color: AppColors.kBlueMediumShade)),
                //     ],
                //   ),
                // ),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: SizedBox(
                //     width: 40.w,
                //     child: const Divider(
                //       // thickness: 2,

                //       color: AppColors.kBlueMediumShade,
                //     ),
                //   ),
                // ),
                Row(
                  children: [
                    const Icon(
                      Icons.settings_outlined,
                      color: AppColors.kBlueMediumShade,
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    Text("Settings",
                        style: Theme.of(context)
                            .textTheme
                            .bodyMedium!
                            .copyWith(color: AppColors.kBlueMediumShade)),
                  ],
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 40.w,
                    child: const Divider(
                      // thickness: 2,

                      color: AppColors.kBlueMediumShade,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(SupportScreen.routeName);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.support_agent,
                        color: AppColors.kBlueMediumShade,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text("Support",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.kBlueMediumShade)),
                    ],
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 40.w,
                    child: const Divider(
                      // thickness: 2,

                      color: AppColors.kBlueMediumShade,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () {
                    Get.toNamed(CouponScreen.routeName);
                  },
                  child: Row(
                    children: [
                      const Icon(
                        Icons.discount_outlined,
                        color: AppColors.kBlueMediumShade,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text("Coupon",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(color: AppColors.kBlueMediumShade)),
                    ],
                  ),
                ),
                SizedBox(
                  height: 4.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 60.w,
                    height: 6.h,
                    child: OutlinedButton(
                      onPressed: () async {
                        Get.toNamed(MembershipScreen.routeName);
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: AppColors.kBlueMediumShade,
                        side: const BorderSide(
                            width: 1, color: AppColors.kBlueMediumShade),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.upload_rounded,
                            color: AppColors.kBerkeleyBlue,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text('Upgrade your account',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(
                                      color: AppColors.kBerkeleyBlue,
                                      fontSize: 14.sp)),
                        ],
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: SizedBox(
                    width: 60.w,
                    height: 6.h,
                    child: OutlinedButton(
                      onPressed: () async {
                        // authService.logout();
                        authService.deleteAuthTokenAndNavigate();
                      },
                      style: OutlinedButton.styleFrom(
                        backgroundColor: Colors.transparent,
                        side: const BorderSide(
                            width: 1, color: AppColors.kBlueMediumShade),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 24, vertical: 12),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5),
                        ),
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Icon(
                            Icons.logout,
                            color: AppColors.kBlueMediumShade,
                          ),
                          SizedBox(
                            width: 2.w,
                          ),
                          Text('Log out',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: AppColors.kBlueMediumShade)),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),

        // Drawer animation (NavBarScreen)
        TweenAnimationBuilder(
          curve: Easing.linear,
          tween: Tween<double>(begin: 0.0, end: value),
          duration: const Duration(milliseconds: 500),
          builder: (_, double value, __) {
            return Transform(
              transform: Matrix4.identity()
                ..setEntry(3, 2, 0.002)
                ..setEntry(0, 3, 250 * value)
                ..rotateY((pi / 6) * value),
              alignment: Alignment.center,
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(30),
                  child: NavBarScreen(
                    onDrawerToggle: toggleDrawer,
                  )),
            );
          },
        ),
      ],
    );
  }
}
