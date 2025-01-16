// import 'package:event_planner_light/constants/colors_constants.dart';
// import 'package:event_planner_light/controllers/AdsController.dart';
// import 'package:event_planner_light/view/screens/ads/add_ads_screen.dart';
// import 'package:event_planner_light/view/widgets/ads_container.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// import '../../../constants/constants.dart';

// class AdsScreen extends GetView<AdsController> {
//   static const routeName = 'AdsScreen';
//   const AdsScreen({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: Color(0xffF9F8EF),
//       appBar: AppBar(
//         title: const Text('My Ads'),
//         centerTitle: true,
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             Center(
//               child: Obx(() {
//                 return Row(
//                   mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                   // spacing: 2.w,
//                   children: List<Widget>.generate(
//                     controller.chipLabels.length,
//                     (int index) {
//                       return Expanded(
//                         child: ChoiceChip(
//                           backgroundColor: AppColors.kBlueMediumShade,
//                           selectedColor: AppColors.kPrimaryColor,
//                           shape: RoundedRectangleBorder(
//                               borderRadius: k5BorderRadius,
//                               side: BorderSide(
//                                 color: AppColors.kBlueMediumShade,
//                               )),
//                           label: Text(
//                             controller.chipLabels[index],
//                             style: TextStyle(
//                                 color: controller.chipLabels[index] ==
//                                         controller.selectedChip.value
//                                     ? Colors.white
//                                     : AppColors.kBluedarkShade),
//                           ),
//                           selected: controller.selectedChip.value ==
//                               controller.chipLabels[index],
//                           onSelected: (bool selected) {
//                             if (selected) {
//                               controller.selectedChip.value =
//                                   controller.chipLabels[index];
//                               controller.getAllAds();
//                             }
//                           },
//                         ),
//                       );
//                     },
//                   ).toList(),
//                 );
//               }),
//             ),
//             SizedBox(
//               height: 2.h,
//             ),
//             AdsContainer(),
//             SizedBox(
//               height: 2.h,
//             ),
//             AdsContainer(),
//             SizedBox(
//               height: 2.h,
//             ),
//             AdsContainer(),
//             SizedBox(
//               height: 2.h,
//             ),
//             AdsContainer(),
//             Spacer(),
//             Row(
//               children: [
//                 Expanded(
//                   child: ElevatedButton(
//                       style: ElevatedButton.styleFrom(
//                           backgroundColor: AppColors.kPrimaryColor),
//                       onPressed: () {
//                         Get.toNamed(AddAdsScreen.routeName);
//                       },
//                       child: Text(
//                         'Add Ads',
//                         style: TextStyle(color: Colors.white),
//                       )),
//                 ),
//               ],
//             )
//             // Row(
//             //   children: [
//             //     Spacer(),
//             //     ElevatedButton(
//             //         style: ElevatedButton.styleFrom(
//             //             backgroundColor: AppColors.kPrimaryColor),
//             //         onPressed: () {
//             //           Get.toNamed(AddAdsScreen.routeName);
//             //         },
//             //         child: Text(
//             //           'Add Ads',
//             //           style: TextStyle(color: Colors.white),
//             //         ))
//             //   ],
//             // ),
//             // Myadscontainer(),
//             // SizedBox(
//             //   height: 2.h,
//             // ),
//             // Myadscontainer(),
//             // SizedBox(
//             //   height: 2.h,
//             // ),
//             // Myadscontainer(),
//             // SizedBox(
//             //   height: 2.h,
//             // ),
//             // Myadscontainer(),
//           ],
//         ),
//       ),
//     );
//   }
// }
