import 'dart:convert';

import 'package:event_planner_light/constants/ApiConstant.dart';
import 'package:event_planner_light/model/CmsModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../utills/CustomSnackbar.dart';

class CmsScreenController extends GetxController {
  Rx<CmsModel?> cmsModel = Rx<CmsModel?>(null);
  RxBool isLoading = true.obs;
  RxBool isEng = true.obs;
  bool isPrivacyPolicy = false;

  @override
  void onInit() async {
    super.onInit();
    isPrivacyPolicy = Get.arguments ?? false;
    await fetchCms();
  }

  Future<void> fetchCms() async {
    isLoading.value = true;
    try {
      final response = await http.get(Uri.parse(ApiConstants.getallCms));
      final data = json.decode(response.body);
      if (response.statusCode == 200) {
        if (data['status'] == 'success' && data['data'] is List) {
          cmsModel.value = CmsModel.fromJson(data);
        }
      } else {
        throw data["message"]["error"][0] ?? "An error occurred";
      }
    } catch (e) {
      CustomSnackbar.showError("Error", e.toString());
    } finally {
      isLoading.value = false;
    }
  }
}
