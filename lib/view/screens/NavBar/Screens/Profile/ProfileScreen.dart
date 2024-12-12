import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/controllers/MyProfileController.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/Profile/edit_profile_screen.dart';
import 'package:event_planner_light/view/widgets/membership_container.dart';
import 'package:event_planner_light/view/widgets/topup_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../widgets/CircleButton.dart';

class Profilescreen extends GetView<MyProfileController> {
  const Profilescreen({super.key});

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
              )),
          Padding(
            padding: EdgeInsets.only(right: 4.w, left: 4.w, top: 7.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.max,
              children: [
                Stack(
                  children: [
                    ClipOval(
                        child: Image.asset(
                      Assets.squareImage,
                      width: 30.w,
                      height: 30.w,
                      fit: BoxFit.cover,
                    )),
                    Positioned(
                      top: 0,
                      right: 0,
                      child: CircleAvatar(
                        backgroundColor: Colors.white,
                        child: Center(
                          child: IconButton(
                              onPressed: () {},
                              icon: Icon(Icons.mode_edit_outlined)),
                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Obx(() {
                      return Text(
                        authService.me.value?.fullName ?? "User Name",
                        style: Theme.of(context)
                            .textTheme
                            .titleLarge!
                            .copyWith(color: AppColors.kBerkeleyBlue),
                      );
                    }),
                    SizedBox(
                      width: 4.w,
                    ),
                    InkWell(
                        onTap: () {
                          Get.toNamed(EditProfileScreen.routeName);
                        },
                        child: CircleIcon())
                  ],
                ),
                Obx(() {
                  final roles = authService.me.value?.role;
                  if (roles == null || roles.isEmpty) {
                    return SizedBox();
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: roles.map((item) {
                      return Padding(
                        padding: EdgeInsets.symmetric(vertical: 1.h),
                        child: Text(
                          item,
                          style: TextConstants.bodySmall_black_normal(context),
                        ),
                      );
                    }).toList(),
                  );
                }),

                SizedBox(
                  height: 3.h,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          'About Me',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Color(0xff457B9D)),
                        ),
                        k3wSizedBox,
                        InkWell(
                            onTap: () {
                              Get.toNamed(EditProfileScreen.routeName);
                            },
                            child: CircleIcon())
                      ],
                    )),
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
                Align(
                    alignment: Alignment.centerLeft,
                    child: Row(
                      children: [
                        Text(
                          'Contact Info',
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(color: Color(0xff457B9D)),
                        ),
                        k3wSizedBox,
                        InkWell(
                            onTap: () {
                              Get.toNamed(EditProfileScreen.routeName);
                            },
                            child: CircleIcon())
                      ],
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
                      return Text(
                        'Contact: ${authService.me.value?.phoneNumber ?? "About Me"}',
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
                    return SizedBox(); // Return an empty widget if the list is null or empty
                  }
                  return Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: subscriptions.map((item) {
                      return MembershipContainer(
                        price: item.price ?? 0,
                        type: item.type ?? "",
                      );
                    }).toList(),
                  );
                }),

                k1hSizedBox,
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
                SizedBox(
                  height: 5.h,
                )
              ],
            ),
          )
        ],
      ),
    ));
  }
}
