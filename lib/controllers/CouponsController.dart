// import 'dart:convert';
// import 'package:event_planner_light/model/CuponsModel.dart';
// import 'package:get/get.dart';
// import '../constants/ApiConstant.dart';
// import 'package:http/http.dart' as http;
// import '../utills/CustomSnackbar.dart';
// import 'Auth_services.dart';

// class CouponsController extends GetxController {
//   @override
//   void onInit() async {
//     super.onInit();
//     await getCoupons();
//   }

//   RxList<CuponsModel> coupons = <CuponsModel>[].obs;
//   List allTypes = ['all', 'basic', 'premium', 'enterprise', 'addon'];
//   RxString selectedType = "all".obs;

//   RxBool isloading = false.obs;

//   Future<void> getCoupons() async {
//     isloading.value = true;
//     try {
//       final response = await http.post(Uri.parse(ApiConstants.getCoupons),
//           body: jsonEncode({
//             "packageType": selectedType.value,
//             "packageFor": authService.me.value?.role?[0] ?? ""
//           }),
//           headers: {
//             'Content-Type': 'application/json',
//             'Authorization': 'Bearer ${authService.authToken}',
//           });
//       if (response.statusCode == 201) {
//         final jsonResponse = json.decode(response.body);

//         List<Map<String, dynamic>> jsonResponseData =
//             List<Map<String, dynamic>>.from(jsonResponse['data']);
//         coupons.clear();
//         coupons.addAll(
//             jsonResponseData.map((e) => CuponsModel.fromJson(e)).toList());
//         isloading.value = false;
//       } else {
//         isloading.value = false;
//         throw Exception('Failed to load Coupons');
//       }
//     } catch (e) {
//       isloading.value = false;
//       CustomSnackbar.showError('Error', e.toString());
//     }
//   }

//   @override
//   void onClose() {
//     super.onClose();
//   }
// }
