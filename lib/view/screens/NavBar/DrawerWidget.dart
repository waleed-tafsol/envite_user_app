import 'package:event_planner_light/view/screens/NavBar/Screens/MembershipScreens/MemberShipScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import '../../../constants/assets.dart';
import '../../../constants/colors_constants.dart';
import '../../../controllers/Auth_services.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.topLeft,
      child: SizedBox(
        height: 776.h,
        width: 396.w,
        child: Drawer(
          backgroundColor: AppColors.kBerkeleyBlue,
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.only(
                  top: 50.h, bottom: 61.h, left: 38.w, right: 38.w),
              child: Column(
                children: [
                  Row(
                    children: [
                      ClipOval(
                        child: Container(
                          width: 73.w,
                          height: 73.h,
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
                        width: 14.w,
                      ),
                      Text(authService.me.value?.fullName ?? "",
                          style: Theme.of(context)
                              .textTheme
                              .headlineLarge!
                              .copyWith(color: AppColors.kBlueMediumShade)),
                    ],
                  ),
                  SizedBox(
                    height: 49.h,
                  ),
                  InkWell(
                    onTap: () {
                      // Get.toNamed(AdsScreen.routeName);
                    },
                    child: Row(
                      children: [
                        SvgPicture.asset(
                          SvgAssets.navigationArrow,
                          color: Color(0xffA8DADC),
                          width: 22.w,
                        ),
                        SizedBox(
                          width: 11.w,
                        ),
                        Text("Invites",
                            style: TextStyle(
                              fontSize: 21.sp,
                              color: Color(0xffA8DADC),
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Divider(
                      thickness: 0.1,
                      color: AppColors.kBlueMediumShade,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  InkWell(
                    onTap: () {
                      // Get.toNamed(SupportScreen.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(
                          size: 22.h,
                          Icons.history_toggle_off_outlined,
                          color: Color(0xffA8DADC),
                        ),
                        SizedBox(
                          width: 11.w,
                        ),
                        Text("History",
                            style: TextStyle(
                              fontSize: 21.sp,
                              color: Color(0xffA8DADC),
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Divider(
                      thickness: 0.1,
                      color: AppColors.kBlueMediumShade,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  Row(children: [
                    Icon(
                      size: 22.h,
                      Icons.settings_outlined,
                      color: Color(0xffA8DADC),
                    ),
                    SizedBox(
                      width: 11.w,
                    ),
                    Text("Settings",
                        style: TextStyle(
                          fontSize: 21.sp,
                          color: Color(0xffA8DADC),
                          fontWeight: FontWeight.w600,
                        )),
                  ]),
                  SizedBox(
                    height: 12.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: const Divider(
                      thickness: 0.5,
                      color: AppColors.kBlueMediumShade,
                    ),
                  ),
                  SizedBox(
                    height: 12.h,
                  ),
                  InkWell(
                    onTap: () {
                      // Get.toNamed(CouponScreen.routeName);
                    },
                    child: Row(
                      children: [
                        Icon(
                          size: 22.h,
                          Icons.notifications_none_outlined,
                          color: Color(0xffA8DADC),
                        ),
                        SizedBox(
                          width: 11.w,
                        ),
                        Text("Notifications",
                            style: TextStyle(
                              fontSize: 21.sp,
                              color: Color(0xffA8DADC),
                              fontWeight: FontWeight.w600,
                            )),
                      ],
                    ),
                  ),
                  Spacer(),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 60.h,
                      child: OutlinedButton(
                        onPressed: () async {
                          Get.toNamed(MembershipScreen.routeName);
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: AppColors.kBlueMediumShade,
                          side: const BorderSide(
                              width: 1, color: AppColors.kBlueMediumShade),
                          padding: EdgeInsets.symmetric(
                              horizontal: 00.w, vertical: 15.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5.r),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              size: 22.h,
                              Icons.upload_rounded,
                              color: AppColors.kBerkeleyBlue,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text('Upgrade your account',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        color: AppColors.kBerkeleyBlue,
                                        fontSize: 16.sp)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 20.h,
                  ),
                  Align(
                    alignment: Alignment.centerLeft,
                    child: SizedBox(
                      height: 60.h,
                      child: OutlinedButton(
                        onPressed: () async {
                          // authService.logout();
                          authService.deleteAuthTokenAndNavigate();
                        },
                        style: OutlinedButton.styleFrom(
                          backgroundColor: Colors.transparent,
                          side: const BorderSide(
                              width: 1, color: AppColors.kBlueMediumShade),
                          padding: EdgeInsets.symmetric(
                              horizontal: 63.w, vertical: 15.h),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(5),
                          ),
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              size: 22.h,
                              Icons.logout,
                              color: AppColors.kBlueMediumShade,
                            ),
                            SizedBox(
                              width: 15.w,
                            ),
                            Text('Log out',
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineMedium!
                                    .copyWith(
                                        color: AppColors.kBlueMediumShade,
                                        fontSize: 16.sp)),
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
