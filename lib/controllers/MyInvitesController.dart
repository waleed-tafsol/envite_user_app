import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/ApiConstant.dart';
import '../model/CatagoryModel.dart';

class MyInvitesController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
  }

  RxList<CatagoryModel> categories = <CatagoryModel>[].obs;

  RxBool isloading = false.obs;

  // get catagories
  Future<void> getcatagories() async {
    isloading.value = true;
    try {
      final response = await http.get(Uri.parse(ApiConstants.categories));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['data'];
        categories.value = data.map((e) => CatagoryModel.fromJson(e)).toList();
        isloading.value = false;
      } else {
        isloading.value = false;
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      isloading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
