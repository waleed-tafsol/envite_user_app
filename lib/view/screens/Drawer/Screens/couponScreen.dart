// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';
// import '../../../../controllers/CouponsController.dart';
// import '../../../../utills/ConvertDateTime.dart';

// class CouponScreen extends GetView<CouponsController> {
//   const CouponScreen({super.key});
//   static const routeName = "CuponScreen";

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Coupons"),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
//         child: Obx(() {
//           return ListView.builder(
//               itemCount: controller.coupons.length,
//               itemBuilder: (context, index) {
//                 return controller.isloading.value
//                     ? Center(
//                         child: CircularProgressIndicator(),
//                       )
//                     : Card(
//                         elevation: 10,
//                         child: Padding(
//                           padding: EdgeInsets.symmetric(
//                               vertical: 1.h, horizontal: 4.w),
//                           child: Column(
//                             children: [
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("Title:",
//                                       style: TextStyle(
//                                           color: Colors.grey, fontSize: 17.sp)),
//                                   Text(controller.coupons[index].name ?? "",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 17.sp)),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 1.h,
//                               ),
//                               Divider(),
//                               SizedBox(
//                                 height: 1.h,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("Coupon Code:",
//                                       style: TextStyle(
//                                           color: Colors.grey, fontSize: 17.sp)),
//                                   Text(controller.coupons[index].code ?? "",
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 17.sp)),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 1.h,
//                               ),
//                               Divider(),
//                               SizedBox(
//                                 height: 1.h,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("Uses Per Coupon:",
//                                       style: TextStyle(
//                                           color: Colors.grey, fontSize: 17.sp)),
//                                   Text(
//                                       controller.coupons[index].usesPerCoupon
//                                           .toString(),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 17.sp)),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 1.h,
//                               ),
//                               Divider(),
//                               SizedBox(
//                                 height: 1.h,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("Start Date:",
//                                       style: TextStyle(
//                                           color: Colors.grey, fontSize: 17.sp)),
//                                   Text(
//                                       convertToDateFormat(
//                                           controller.coupons[index].startDate ??
//                                               ""),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 17.sp)),
//                                 ],
//                               ),
//                               SizedBox(
//                                 height: 1.h,
//                               ),
//                               Divider(),
//                               SizedBox(
//                                 height: 1.h,
//                               ),
//                               Row(
//                                 mainAxisAlignment:
//                                     MainAxisAlignment.spaceBetween,
//                                 children: [
//                                   Text("End Date:",
//                                       style: TextStyle(
//                                           color: Colors.grey, fontSize: 17.sp)),
//                                   Text(
//                                       convertToDateFormat(
//                                           controller.coupons[index].endDate ??
//                                               ""),
//                                       style: TextStyle(
//                                           color: Colors.black,
//                                           fontSize: 17.sp)),
//                                 ],
//                               ),
//                             ],
//                           ),
//                         ),
//                       );
//               });
//         }),
//       ),
//     );
//   }
// }
