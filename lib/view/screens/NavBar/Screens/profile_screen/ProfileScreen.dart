import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/state_manager.dart';
import '../../../../../constants/TextConstant.dart';
import '../../../../../constants/assets.dart';
import '../../../../../constants/colors_constants.dart';
import '../../../../../controllers/Auth_services.dart';

class ProfileScreen extends StatelessWidget {
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
              right: 0,
              left: 0,
              child: Image.asset(
                Assets.ellips,
                // width: 504.w,
              )),
          Padding(
            padding: EdgeInsets.only(right: 28.w, left: 28.w, top: 7.h),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: CircleAvatar(
                    backgroundColor: Colors.white,
                    child: Center(
                      child: IconButton(
                          onPressed: () {
                            // Get.toNamed(EditProfileScreen.routeName);
                          },
                          icon: Icon(Icons.mode_edit_outlined)),
                    ),
                  ),
                ),
                Center(
                  child: ClipOval(
                      child: Image.asset(
                    Assets.squareImage,
                    width: 110.w,
                    // height: 30.w,
                    fit: BoxFit.cover,
                  )),
                ),
                SizedBox(
                  height: 8.h,
                ),
                Center(
                  child: Obx(() {
                    return Text(
                      authService.me.value?.fullName ?? "User Name",
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: AppColors.kBerkeleyBlue,
                          fontSize: 24.sp,
                          fontWeight: FontWeight.bold),
                    );
                  }),
                ),
                Center(
                  child: Obx(() {
                    final roles = authService.me.value?.role;
                    if (roles == null || roles.isEmpty) {
                      return SizedBox();
                    }
                    return Column(
                      mainAxisSize: MainAxisSize.min,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: roles.map((item) {
                        return Padding(
                          padding: EdgeInsets.symmetric(vertical: 0.5.h),
                          child: Text(
                            item,
                            style: TextConstants.bodyLargeBlackBold(context),
                          ),
                        );
                      }).toList(),
                    );
                  }),
                ),

                SizedBox(
                  height: 20.h,
                ),
                Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'About Me',
                      style: Theme.of(context).textTheme.titleLarge!.copyWith(
                          color: Color(0xff457B9D),
                          fontSize: 21.sp,
                          fontWeight: FontWeight.w600),
                    )),
                SizedBox(
                  height: 10.sp,
                ),
                Obx(() {
                  return Text(
                    authService.me.value?.description ?? "About Me",
                    style: Theme.of(context).textTheme.bodyLarge!.copyWith(
                        color: AppColors.kBerkeleyBlue, fontSize: 11.sp),
                  );
                }),
                SizedBox(
                  height: 32.sp,
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
                SizedBox(
                  height: 10.sp,
                ),
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
                SizedBox(
                  height: 32.sp,
                ),
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
                SizedBox(
                  height: 10.sp,
                ),
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
                  return SizedBox();
                  // return Column(
                  //   mainAxisSize: MainAxisSize.min,
                  //   crossAxisAlignment: CrossAxisAlignment.start,
                  //   children: subscriptions.map((item) {
                  //     return MembershipContainer(
                  //       price: item.price ?? 0,
                  //       type: item.type ?? "",
                  //     );
                  //   }).toList(),
                  // );
                }),

                SizedBox(
                  height: 32.sp,
                ),

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
                //         // var controller = Get.put(AddEventController());
                //         // controller.isAddPastEvents.value = true;
                //         // Get.toNamed(AddEventsScreens.routeName);
                //       },
                //       child: Text('Add past event')),
                // ),
                SizedBox(
                  height: 10.h,
                ),
              ],
            ),
          )
        ],
      ),
    ));
  }
}
