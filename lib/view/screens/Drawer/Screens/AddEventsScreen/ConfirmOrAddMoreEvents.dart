// import 'package:event_planner_light/constants/StyleConstants.dart';
// import 'package:event_planner_light/constants/TextConstant.dart';
// import 'package:event_planner_light/constants/colors_constants.dart';
// import 'package:event_planner_light/constants/constants.dart';
// import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/MemberShipScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import '../../../../../constants/assets.dart';

// class ConfirmorAddMoreEvents extends StatelessWidget {
//   const ConfirmorAddMoreEvents({super.key});
//   static const routeName = "ConfirmorAddMoreEvents";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text("Events You Have planned Before"),
//       ),
//       body: SingleChildScrollView(
//         child: SafeArea(
//           child: Padding(
//             padding: kpaddingH4V2,
//             child: Column(
//               children: [
//                 Text(
//                   "Events You Have planned Before",
//                   style: TextConstants.bodySmall_black_normal(context),
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 Align(
//                   alignment: Alignment.centerLeft,
//                   child: Text(
//                     "Previous planned events",
//                     style: TextConstants.bodyLargeBlackBold(context),
//                   ),
//                 ),
//                 SizedBox(
//                   height: 27.h,
//                   child: ListView.builder(
//                       scrollDirection: Axis.horizontal,
//                       itemCount: 5,
//                       shrinkWrap: true,
//                       itemBuilder: (context, index) {
//                         return PreviouslyPlannedEventWidget();
//                       }),
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 SizedBox(
//                   height: 6.h,
//                   width: double.infinity,
//                   child: ElevatedButton(
//                       style: StylesConstants.elevated_b_redBack_whiteFore,
//                       onPressed: () {
//                         Get.until((route) => route.isFirst);
//                       },
//                       child: Text("Confirm and go to the next")),
//                 ),
//                 SizedBox(
//                   height: 2.h,
//                 ),
//                 SizedBox(
//                   height: 6.h,
//                   width: double.infinity,
//                   child: CustomOutlinedButton(
//                       ontap: () {
//                         Get.back();
//                       },
//                       contant: [Text("Add more events")]),
//                 ),
//               ],
//             ),
//           ),
//         ),
//       ),
//     );
//   }
// }

// class PreviouslyPlannedEventWidget extends StatelessWidget {
//   const PreviouslyPlannedEventWidget({
//     super.key,
//   });

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: EdgeInsets.symmetric(horizontal: 1.w),
//       // height: 0.h,
//       width: 40.w,
//       padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 2.w),
//       decoration:
//           BoxDecoration(borderRadius: k5BorderRadius, color: Colors.white),
//       child: Column(
//         children: [
//           Stack(
//             children: [
//               Image.asset(
//                 Assets.squareImage,
//                 fit: BoxFit.fitWidth,
//                 width: double.infinity,
//               ),
//               Positioned(
//                 top: 0.5.h,
//                 left: 1.w,
//                 child: Container(
//                   padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
//                   decoration: BoxDecoration(
//                       color: AppColors.kBluedarkShade,
//                       borderRadius: k5BorderRadius),
//                   child: Column(
//                     children: [
//                       Text(
//                         "12",
//                         style: TextConstants.bodyLarge_white_bold(context),
//                       ),
//                       Text(
//                         "Apr",
//                         style: TextConstants.bodysmall_white_normal(context),
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//             ],
//           ),
//           SizedBox(
//             height: 1.h,
//           ),
//           Text(
//             "Met Gala 2024: Celebrities, Red Carpet",
//             style: TextConstants.bodyMedium_white_bold(context)
//                 .copyWith(color: Colors.black),
//           )
//         ],
//       ),
//     );
//   }
// }
