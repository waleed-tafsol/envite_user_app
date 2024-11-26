import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/view/screens/NavBar/Screens/Profile/edit_profile_screen.dart';
import 'package:event_planner_light/view/widgets/membership_container.dart';
import 'package:event_planner_light/view/widgets/topup_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../widgets/CircleButton.dart';
import '../../../Drawer/Screens/MembershipScreens/MemberShipScreen.dart';

class Profilescreen extends StatelessWidget {
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
                    Text(
                      "Imane Al Khassim",
                      style: Theme.of(context)
                          .textTheme
                          .titleLarge!
                          .copyWith(color: AppColors.kBerkeleyBlue),
                    ),
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
                Text(
                  "Event Planner",
                  style: TextConstants.bodySmall_black_normal(context),
                ),
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
                Text(
                  'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Nullam scelerisque tincidunt mi. Suspendisse in libero eu lorem vehicula blandit a ut mauris. Curabitur tincidunt mattis arcu vitae finibus. Morbi eleifend felis sit amet est efficitur, sit amet venenatis metus rhoncus.',
                  style: Theme.of(context)
                      .textTheme
                      .bodyLarge!
                      .copyWith(color: AppColors.kBerkeleyBlue),
                ),
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
                    child: Text(
                      'Email: examplemail@gmail.com',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.kBerkeleyBlue),
                    )),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Contact: 97644 2078789',
                      style: Theme.of(context)
                          .textTheme
                          .bodyLarge!
                          .copyWith(color: AppColors.kBerkeleyBlue),
                    )),
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
                MembershipContainer(),
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
                TopupContainer(),

                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Total events attendant",
                //       style: TextConstants.bodymedium_darkBlue_normal(context),
                //     ),
                //     SizedBox(
                //       width: 4.w,
                //     ),
                //     CircleIcon()
                //   ],
                // ),
                // SizedBox(
                //   height: 1.h,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Public events    ",
                //       style: TextConstants.bodySmall_black_normal(context),
                //     ),
                //     Text(
                //       "24",
                //       style: TextConstants.bodySmall_black_bold(context),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 1.h,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Total score",
                //       style: TextConstants.bodymedium_darkBlue_normal(context),
                //     ),
                //     SizedBox(
                //       width: 4.w,
                //     ),
                //     CircleIcon()
                //   ],
                // ),
                // SizedBox(
                //   height: 1.h,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Total points    ",
                //       style: TextConstants.bodySmall_black_normal(context),
                //     ),
                //     Text(
                //       "126",
                //       style: TextConstants.bodySmall_black_bold(context),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 1.h,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Credit in Wallet for Invitation",
                //       style: TextConstants.bodymedium_darkBlue_normal(context),
                //     ),
                //     SizedBox(
                //       width: 4.w,
                //     ),
                //     CircleIcon()
                //   ],
                // ),
                // SizedBox(
                //   height: 1.h,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Credit points    ",
                //       style: TextConstants.bodySmall_black_normal(context),
                //     ),
                //     Text(
                //       "69",
                //       style: TextConstants.bodySmall_black_bold(context),
                //     ),
                //   ],
                // ),
                // SizedBox(
                //   height: 1.h,
                // ),
                // Row(
                //   mainAxisAlignment: MainAxisAlignment.start,
                //   children: [
                //     Text(
                //       "Languages",
                //       style: TextConstants.bodymedium_darkBlue_normal(context),
                //     ),
                //     SizedBox(
                //       width: 4.w,
                //     ),
                //     CircleIcon()
                //   ],
                // ),
                // SizedBox(
                //   height: 1.h,
                // ),
                // Align(
                //   alignment: Alignment.centerLeft,
                //   child: Container(
                //     padding:
                //         EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 2.w),
                //     decoration: BoxDecoration(
                //         color: AppColors.kBlueMediumShade,
                //         borderRadius: k5BorderRadius),
                //     child: Text(
                //       "English",
                //       style: TextConstants.bodySmall_black_normal(context),
                //     ),
                //   ),
                // ),
                CustomOutlinedButton(
                  contant: [
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 4.w),
                      child: Row(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          const Icon(
                            Icons.delete_outline,
                            color: AppColors.kBlueMediumShade,
                          ),
                          Text(
                            "Delete my account",
                            style:
                                TextConstants.bodyLargeMediumBlueBold(context),
                          ),
                        ],
                      ),
                    ),
                  ],
                  ontap: () {
                    // Get.offAllNamed(SigninScreen.routeName);
                    // Get.toNamed(CreatePortfolioScreen.routeName);
                  },
                ),
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
