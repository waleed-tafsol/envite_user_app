// import 'package:event_planner_light/constants/colors_constants.dart';
// import 'package:event_planner_light/controllers/SupportController.dart';
// import 'package:flutter/material.dart';
// import 'package:get/get.dart';
// import 'package:responsive_sizer/responsive_sizer.dart';

// class GenerateTicketScreen extends GetView<Supportcontroller> {
//   static const routeName = 'GenerateTicketScreen';
//   GenerateTicketScreen({super.key});
//   final _formKey = GlobalKey<FormState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         centerTitle: true,
//         title: const Text('Support'),
//       ),
//       body: Padding(
//         padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
//         child: Form(
//           key: _formKey,
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               Divider(),
//               SizedBox(
//                 height: 2.h,
//               ),
//               Text(
//                 'Generate Ticket',
//                 style: TextStyle(
//                     color: AppColors.kBerkeleyBlue,
//                     fontWeight: FontWeight.bold),
//               ),
//               SizedBox(
//                 height: 1.5.h,
//               ),
//               TextFormField(
//                   validator: (value) => value!.isEmpty ? 'Enter Title' : null,
//                   controller: controller.titleController,
//                   decoration: InputDecoration(
//                     hintText: "Title",
//                     // prefixIcon: Icon(Icons.email_outlined),
//                   )),
//               SizedBox(
//                 height: 1.h,
//               ),
//               TextFormField(
//                   validator: (value) =>
//                       value!.isEmpty ? 'Enter Description' : null,
//                   controller: controller.descriptionController,
//                   maxLines: 4,
//                   decoration: InputDecoration(
//                     hintText: "Description",

//                     // prefixIcon: Icon(Icons.email_outlined),
//                   )),
//               Spacer(),
//               Row(
//                 children: [
//                   Expanded(
//                     child: Obx(() {
//                       return controller.isloading.value
//                           ? Center(child: CircularProgressIndicator())
//                           : ElevatedButton(
//                               style: ElevatedButton.styleFrom(
//                                   backgroundColor: AppColors.kPrimaryColor),
//                               onPressed: () {
//                                 if (_formKey.currentState!.validate()) {
//                                   controller.createTicket();
//                                 }
//                               },
//                               child: Text(
//                                 'Send',
//                                 style: TextStyle(color: Colors.white),
//                               ));
//                     }),
//                   ),
//                 ],
//               )
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
