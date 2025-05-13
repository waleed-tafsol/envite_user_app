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
    isLoadingCategories.value = true;
    await getCategories();
  }

  RxList<CategoryModel> categories = <CategoryModel>[].obs;
  final Rx<CategoryModel> selectedCategory = CategoryModel().obs;
  RxList<EventModel> events = <EventModel>[].obs;
  RxBool isLoadingCategories = false.obs;
  RxBool isEventLoading = false.obs;

  // get catagories
  Future<void> getCategories() async {
    // isloadingCatagories.value = true;
    try {
      final response = await http.get(Uri.parse(ApiConstants.getCategories));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['data'];
        categories.value = data.map((e) => CategoryModel.fromJson(e)).toList();
        if (categories.isNotEmpty) {
          selectedCategory.value = categories[0];
          await getPaginatedEvents();
        }
        isLoadingCategories.value = false;
      } else {
        isLoadingCategories.value = false;
        final errorData = jsonDecode(response.body);
        throw errorData["message"]["error"][0] ?? "An error occurred";
      }
    } catch (e) {
      isLoadingCategories.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  // get events
  Future<void> getPaginatedEvents() async {
    // isEventLoading.value = true;
    try {
      final response = await http.post(Uri.parse(ApiConstants.getAllEvents),
          body: jsonEncode({
            // "eventType": "exclusive",
            "categorySlugs": [selectedCategory.value.slug],
            // "packageType": "all"
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
        throw errorData["message"]["error"][0] ?? "An error occurred";
      }
    } catch (e) {
      isEventLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }
}
