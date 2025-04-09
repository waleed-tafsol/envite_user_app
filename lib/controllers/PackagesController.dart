// import 'dart:convert';
// import 'package:event_planner_light/controllers/Auth_services.dart';
// import 'package:event_planner_light/model/PackagesModel.dart';
// import 'package:event_planner_light/utills/CustomSnackbar.dart';
// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import '../constants/ApiConstant.dart';

// class PackagesController extends GetxController {
//   Map<String, dynamic> args = Get.arguments;
//   @override
//   void onInit() async {
//     super.onInit();

//     await getAllPackages(args["type"]);
//   }

//   RxList<PackagesModel> packages = <PackagesModel>[].obs;

//   RxBool isloading = false.obs;

//   // get catagories
//   Future<void> getAllPackages(String? type) async {
//     isloading.value = true;
//     try {
//       final response = await http.post(Uri.parse(ApiConstants.getAllPackages),
//           body: jsonEncode({
//             /*type == null ? null : "eventType": type,*/ "packageType": type
//           }),
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer ${authService.authToken}',
//           });
//       if (response.statusCode == 201) {
//         final jsonResponse = json.decode(response.body);
//         final List<dynamic> data = jsonResponse['data'];
//         packages.value = data.map((e) => PackagesModel.fromJson(e)).toList();
//         isloading.value = false;
//       } else {
//         isloading.value = false;
//         throw Exception('Failed to load packages');
//       }
//     } catch (e) {
//       isloading.value = false;
//       CustomSnackbar.showError('Error', e.toString());
//     }
//   }

//   Future<void> canclePackages(String? id) async {
//     isloading.value = true;
//     try {
//       final response = await http.patch(Uri.parse(ApiConstants.getAllPackages),
//           body: jsonEncode({
//             /*type == null ? null : "eventType": type,*/ "subscriptionId": id
//           }),
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer ${authService.authToken}',
//           });
//       if (response.statusCode == 201) {
//         final jsonResponse = json.decode(response.body);
//         final List<dynamic> data = jsonResponse['data'];
//         packages.value = data.map((e) => PackagesModel.fromJson(e)).toList();
//         isloading.value = false;
//       } else {
//         isloading.value = false;
//         throw Exception('Failed to load package');
//       }
//     } catch (e) {
//       isloading.value = false;
//       CustomSnackbar.showError('Error', e.toString());
//     }
//   }

// }
