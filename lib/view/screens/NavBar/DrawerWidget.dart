import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/assets.dart';
import '../../../constants/colors_constants.dart';
import '../../../controllers/Auth_services.dart';

class MyDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 90.h,
        width: 90.w,
        child: Drawer(
          backgroundColor: AppColors.kBerkeleyBlue,
          child: SafeArea(
            child: Padding(
              padding:
                  EdgeInsets.only(top: 2.h, bottom: 2.h, left: 4.w, right: 8.w),
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
                      // Get.toNamed(AdsScreen.routeName);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          SvgAssets.navigationArrow,
                          color: AppColors.kBlueMediumShade,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text("Invites",
                            style: Theme.of(context)
                                .textTheme
                                .bodyLarge!
                                .copyWith(
                                    color: AppColors.kBlueMediumShade,
                                    fontSize: 16.sp)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Divider(
                      thickness: 0.1,
                      color: AppColors.kBlueMediumShade,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  InkWell(
                    onTap: () {
                      // Get.toNamed(SupportScreen.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(
                          size: 2.h,
                          Icons.event,
                          color: AppColors.kBlueMediumShade,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text("Events",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: AppColors.kBlueMediumShade,
                                    fontSize: 16.sp)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Divider(
                      thickness: 0.1,
                      color: AppColors.kBlueMediumShade,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Row(
                    children: [
                      Icon(
                        size: 2.h,
                        Icons.card_membership_rounded,
                        color: AppColors.kBlueMediumShade,
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      Text("Membership",
                          style: Theme.of(context)
                              .textTheme
                              .bodyMedium!
                              .copyWith(
                                  color: AppColors.kBlueMediumShade,
                                  fontSize: 16.sp)),
                    ],
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Divider(
                      thickness: 0.1,
                      color: AppColors.kBlueMediumShade,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  InkWell(
                    onTap: () {
                      // Get.toNamed(CouponScreen.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(
                          size: 2.h,
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
                                .copyWith(
                                    color: AppColors.kBlueMediumShade,
                                    fontSize: 16.sp)),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Divider(
                      thickness: 0.1,
                      color: AppColors.kBlueMediumShade,
                    ),
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  InkWell(
                    onTap: () {
                      // Get.toNamed(CouponScreen.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(
                          size: 2.h,
                          Icons.notifications_outlined,
                          color: AppColors.kBlueMediumShade,
                        ),
                        SizedBox(
                          width: 4.w,
                        ),
                        Text("Notifications",
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium!
                                .copyWith(
                                    color: AppColors.kBlueMediumShade,
                                    fontSize: 16.sp)),
                      ],
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 6.h,
                      child: OutlinedButton(
                        onPressed: () async {
                          // Get.toNamed(MembershipScreen.routeName);
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
                            Icon(
                              size: 2.h,
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
                            Icon(
                              size: 2.h,
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
                                    .copyWith(
                                        color: AppColors.kBlueMediumShade,
                                        fontSize: 14.sp)),
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
      ),
    );
  }
}
