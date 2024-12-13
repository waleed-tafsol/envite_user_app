import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/assets.dart';
import '../../../constants/colors_constants.dart';
import '../../../controllers/Auth_services.dart';
import '../Drawer/Screens/MembershipScreens/MemberShipScreen.dart';
import '../Drawer/Screens/couponScreen.dart';
import '../Drawer/Screens/supportScreen/supportScreen.dart';
import '../ads/ads_screen.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: AppColors.kBerkeleyBlue,
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
          child: SizedBox(
            height: 400,
            child: Column(
              children: [
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
                    Text(authService.me.value?.fullName ?? "",
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
      ),
    );
  }
}
