// import 'dart:convert';

// import 'package:event_planner_light/constants/TextConstant.dart';
// import 'package:event_planner_light/constants/colors_constants.dart';
// import 'package:event_planner_light/constants/constants.dart';
// import 'package:event_planner_light/model/PackagesModel.dart';
// import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/PaymentScreen.dart';
// import 'package:event_planner_light/view/screens/NavBar/NavBarScreen.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import 'package:responsive_sizer/responsive_sizer.dart';

// import '../../../../../constants/ApiConstant.dart';
// import '../../../../../controllers/Auth_services.dart';
// import '../../../../../utills/CustomSnackbar.dart';
// import '../../../../../utills/string_decoration.dart';

// class ChoosePlanContainer extends StatelessWidget {
//   const ChoosePlanContainer({
//     super.key,
//     required this.package,
//   });
//   final PackagesModel? package;

//   paymentConfirmed() async {
//     try {
//       Get.dialog(Center(child: CircularProgressIndicator()),
//           barrierDismissible: false);
//       final response =
//           await http.patch(Uri.parse(ApiConstants.buyPackages + package!.slug!),
//               body: jsonEncode({
//                 "noOfInvites": package?.invites,
//               }),
//               headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer ${authService.authToken}',
//           });
//       if (response.statusCode == 200) {
//         await authService.getMe();
//         // isloading.value = false;
//         CustomSnackbar.showSuccess("Successful", "payment was successful");
//         Get.until((route) => route.settings.name == NavBarScreen.routeName);
//       } else {
//         // isloading.value = false;
//         final jsonResponse = jsonDecode(response.body);
//         throw Exception(jsonResponse["message"]["error"][0] ??
//             "SomeThing Went Wrong Payment was not successful");
//       }
//     } catch (e) {
//       Get.back();
//       // isloading.value = false;
//       CustomSnackbar.showError('Error', e.toString());
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return InkWell(
//       onTap: () {
//         package?.price == 0
//             ? paymentConfirmed()
//             : Get.toNamed(PaymentScreen.routeName, arguments: {
//                 "istopupPayment": false,
//                 "packagesModel": package,
//                 "noOfInvites": package?.invites ?? 0,
//                 "routeToPopTill": Get.currentRoute
//               });
//       },
//       child: Container(
//         width: double.infinity,
//         padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
//         decoration: BoxDecoration(
//             border: Border.all(color: AppColors.kBluedarkShade, width: 2),
//             borderRadius: k5BorderRadius),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.center,
//           children: [
//             /*  const Icon(
//               Icons.circle,
//               color: AppColors.kBlueLightShade,
//             ),*/
//             /* Text(
//               "Change Plan to",
//               style: TextConstants.bodySmall_darkblue_bold(context),
//             ),*/
//             Text(
//               '${capitalizeFirstLetter(package?.name?.en ?? "")} / ${capitalizeFirstLetter(package?.name?.ar ?? "")}',
//               style: TextConstants.headlineLarge_darkBlue_Bold(context),
//             ),
//             SizedBox(
//               height: 1.h,
//             ),
//             Text(
//               "\$ ${package?.price == 0 ? " 0 / Free" : package?.price} ",
//               style: TextStyle(
//                   color: AppColors.kBluedarkShade,
//                   fontSize: 18.sp,
//                   fontWeight: FontWeight.w700),
//               textAlign: TextAlign.center,
//             ),
//             SizedBox(
//               height: 1.h,
//             ),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'Duration: ',
//                   style: TextConstants.bodySmall_darkblue_bold(context),
//                 ),
//                 SizedBox(
//                   width: 2.w,
//                 ),
//                 Text(
//                   "${package?.duration.toString()} Month",
//                   style: TextConstants.bodySmall_darkblue_bold(context),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 0.5.h,
//             ),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'Event Type:',
//                   style: TextConstants.bodySmall_darkblue_bold(context),
//                 ),
//                 SizedBox(
//                   width: 2.w,
//                 ),
//                 Text(
//                   capitalizeFirstLetter(package?.eventType ?? ""),
//                   style: TextConstants.bodySmall_darkblue_bold(context),
//                 ),
//               ],
//             ),
//             SizedBox(
//               height: 0.5.h,
//             ),
//             Row(
//               mainAxisSize: MainAxisSize.min,
//               children: [
//                 Text(
//                   'Number of invites:',
//                   style: TextConstants.bodySmall_darkblue_bold(context),
//                 ),
//                 SizedBox(
//                   width: 2.w,
//                 ),
//                 Text(
//                   package?.invites.toString() ?? "",
//                   style: TextConstants.bodySmall_darkblue_bold(context),
//                 ),
//               ],
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
