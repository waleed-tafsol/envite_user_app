// import 'package:event_planner_light/constants/TextConstant.dart';
// import 'package:event_planner_light/constants/colors_constants.dart';
// import 'package:event_planner_light/constants/constants.dart';
// import 'package:event_planner_light/model/PackagesModel.dart';
// import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/PaymentScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class ChoosePlanContainer extends StatelessWidget {
//   const ChoosePlanContainer({
//     super.key,
//     required this.package,
//   });
//   final PackagesModel? package;
//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         Get.toNamed(MemberShipPaymentScreen.routeName,
//             arguments: package?.slug ?? "");
//       },
//       child: Container(
//         padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
//         decoration: BoxDecoration(
//             border: Border.all(color: AppColors.kBluedarkShade, width: 2),
//             borderRadius: k5BorderRadius),
//         child: Column(
//           children: [
//             const Icon(
//               Icons.circle,
//               color: AppColors.kBlueLightShade,
//             ),
//             Text(
//               "Change Plan to",
//               style: TextConstants.bodySmall_darkblue_bold(context),
//             ),
//             Text(
//               package?.name?.en ?? "",
//               style: TextConstants.headlineLarge_darkBlue_Bold(context),
//             ),
//             Text(
//               "\$ ${package?.price.toString()} ",
//               style: TextConstants.bodySmall_darkblue_bold(context),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 1.h,
//             ),
//             SizedBox(
//               width: 30.w,
//               child: Row(
//                 children: [
//                   Text(
//                     'Duration: ',
//                     style: TextConstants.bodySmall_darkblue_bold(context),
//                   ),
//                   SizedBox(
//                     width: 2.w,
//                   ),
//                   Text(
//                     "${package?.duration.toString()} month",
//                     style: TextConstants.bodySmall_darkblue_bold(context),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 0.5.h,
//             ),
//             SizedBox(
//               width: 30.w,
//               child: Row(
//                 children: [
//                   Text(
//                     'Event Type:',
//                     style: TextConstants.bodySmall_darkblue_bold(context),
//                   ),
//                   SizedBox(
//                     width: 2.w,
//                   ),
//                   Text(
//                     package?.eventType ?? "",
//                     style: TextConstants.bodySmall_darkblue_bold(context),
//                   ),
//                 ],
//               ),
//             ),
//             SizedBox(
//               height: 0.5.h,
//             ),
//             SizedBox(
//               width: 30.w,
//               child: Row(
//                 children: [
//                   Text(
//                     'Number of invites:',
//                     style: TextConstants.bodySmall_darkblue_bold(context),
//                   ),
//                   SizedBox(
//                     width: 2.w,
//                   ),
//                   Text(
//                     package?.invites.toString() ?? "",
//                     style: TextConstants.bodySmall_darkblue_bold(context),
//                   ),
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
