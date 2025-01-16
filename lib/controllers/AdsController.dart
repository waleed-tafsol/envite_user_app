// import 'dart:convert';

// import 'package:get/get.dart';
// import 'package:http/http.dart' as http;
// import '../constants/ApiConstant.dart';
// import '../utills/CustomSnackbar.dart';
// import 'Auth_services.dart';

// class AdsController extends GetxController {
//   @override
//   void onInit() async {
//     super.onInit();
//     isloading.value = true;
//     await getAllAds();
//     isloading.value = false;
//   }

//   RxBool isloading = true.obs;
//   final List<String> chipLabels = ['approved', 'pending', 'all', 'rejected'];
//   RxString selectedChip = 'Approved'.obs;

//   Future<void> getAllAds() async {
//     try {
//       final response = await http.post(Uri.parse(ApiConstants.getMyAds), body: {
//         "status": selectedChip.value,
//         "search": "event"
//       }, headers: {
//         'Authorization': 'Bearer ${authService.authToken}',
//         'Content-Type': 'application/json',
//       });
//       if (response.statusCode == 200) {
//         final jsonResponse = json.decode(response.body);
//         final List<dynamic> data = jsonResponse['data'];
//         // categories.value = data.map((e) => CatagoryModel.fromJson(e)).toList();
//       } else {
//         final errorData = jsonDecode(response.body);
//         throw Exception(
//             errorData["message"]["error"][0] ?? "An error occurred");
//       }
//     } catch (e) {
//       CustomSnackbar.showError('Error', e.toString());
//     }
//   }
// }
