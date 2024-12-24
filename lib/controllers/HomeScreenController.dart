import 'dart:convert';
import 'package:event_planner_light/model/event_model.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/ApiConstant.dart';
import '../model/CatagoryModel.dart';
import 'Auth_services.dart';

class HomeScreenController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    isEventLoading.value = true;
    isloadingCatagories.value = true;
    await getcatagories();
    // isloadingCatagories.value = false;
    await getpaginatedEvents();
    // isEventLoading.value = false;
  }

  RxList<CatagoryModel> categories = <CatagoryModel>[].obs;
  RxList<EventModel> events = <EventModel>[].obs;

  RxBool isloadingCatagories = false.obs;
  RxBool isEventLoading = false.obs;

  // get catagories
  Future<void> getcatagories() async {
    // isloadingCatagories.value = true;
    try {
      final response = await http.get(Uri.parse(ApiConstants.categories));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['data'];
        categories.value = data.map((e) => CatagoryModel.fromJson(e)).toList();
        isloadingCatagories.value = false;
      } else {
        isloadingCatagories.value = false;
        final errorData = jsonDecode(response.body);
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      isloadingCatagories.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  // get events
  Future<void> getpaginatedEvents() async {
    // isEventLoading.value = true;
    try {
      final response = await http.post(Uri.parse(ApiConstants.getAllEvents),
          body: jsonEncode({
            // "eventType": "exclusive",
            "packageType": "all"
          }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authService.authToken}',
          });
      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['data'];
        events.value = data.map((e) => EventModel.fromJson(e)).toList();
        isEventLoading.value = false;
      } else {
        isEventLoading.value = false;
        final errorData = jsonDecode(response.body);
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      isEventLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
