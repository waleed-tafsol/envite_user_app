import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/CreatePortfolioScreens/CreatePortfolioScreen.dart';
import 'package:event_planner_light/view/screens/SignIn/SignInScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../widgets/CircleButton.dart';
import '../../../Drawer/Screens/MembershipScreens/ChooseAPlan.dart';
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
                      "Ghanem Abdallah",
                      style: TextConstants.bodyLargeBlackBold(context),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    CircleIcon()
                  ],
                ),
                Text(
                  "Basic Plan (Free)",
                  style: TextConstants.bodySmall_black_normal(context),
                ),
                SizedBox(
                  height: 1.h,
                ),
                SizedBox(
                  height: 25.h,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      const Expanded(
                        child: ChoosePlanContainer(
                          title: 'Standard Plan',
                        ),
                      ),
                      SizedBox(
                        width: 4.w,
                      ),
                      const Expanded(
                        child: ChoosePlanContainer(
                          title: 'Premium Plan',
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Total events attendant",
                      style: TextConstants.bodymedium_darkBlue_normal(context),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    CircleIcon()
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Public events    ",
                      style: TextConstants.bodySmall_black_normal(context),
                    ),
                    Text(
                      "24",
                      style: TextConstants.bodySmall_black_bold(context),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Total score",
                      style: TextConstants.bodymedium_darkBlue_normal(context),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    CircleIcon()
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Total points    ",
                      style: TextConstants.bodySmall_black_normal(context),
                    ),
                    Text(
                      "126",
                      style: TextConstants.bodySmall_black_bold(context),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Credit in Wallet for Invitation",
                      style: TextConstants.bodymedium_darkBlue_normal(context),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    CircleIcon()
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Credit points    ",
                      style: TextConstants.bodySmall_black_normal(context),
                    ),
                    Text(
                      "69",
                      style: TextConstants.bodySmall_black_bold(context),
                    ),
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Text(
                      "Languages",
                      style: TextConstants.bodymedium_darkBlue_normal(context),
                    ),
                    SizedBox(
                      width: 4.w,
                    ),
                    CircleIcon()
                  ],
                ),
                SizedBox(
                  height: 1.h,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    padding:
                        EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 2.w),
                    decoration: BoxDecoration(
                        color: AppColors.kBlueMediumShade,
                        borderRadius: k5BorderRadius),
                    child: Text(
                      "English",
                      style: TextConstants.bodySmall_black_normal(context),
                    ),
                  ),
                ),
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
                    Get.toNamed(CreatePortfolioScreen.routeName);
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
