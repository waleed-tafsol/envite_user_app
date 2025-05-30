import 'dart:convert';

import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/model/TopupsModel.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/ApiConstant.dart';

class TopupsController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await getAllTopups();
  }

  RxList<TopupsModel> topups = <TopupsModel>[].obs;

  RxBool isloading = false.obs;

  // get catagories
  Future<void> getAllTopups() async {
    isloading.value = true;
    try {
      final response = await http.post(Uri.parse(ApiConstants.getAllPackages),
          body: jsonEncode({
            "packageType": "addon",
            // "packageFor": authService.me.value?.role?[0] ?? "user"
          }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authService.authToken}',
          });
      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['data'];
        topups.value = data.map((e) => TopupsModel.fromJson(e)).toList();
        isloading.value = false;
      } else {
        isloading.value = false;
        throw 'Failed to load topups';
      }
    } catch (e) {
      isloading.value = false;
      CustomSnackbar.showError('Error', e.toString());
    }
  }
}
