import 'dart:convert';

import 'package:event_planner_light/constants/ApiConstant.dart';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/model/CatagoryModel.dart';
import 'package:event_planner_light/model/event_model.dart';
import 'package:event_planner_light/model/getAllEventsModel.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class HomeScreenController extends GetxController {
 @override
  void onInit() async {
    super.onInit();
    isEventLoading.value = true;
    isLoadingCategories.value = true;
    await getCategories();
   
  }

//https://envite-backend-dd-d3e9220ccbc0.herokuapp.com/api/v1
List <Data> allEvents = [];
RxList<EventModel> events = <EventModel>[].obs;
 RxList<CatagoryModel> categories = <CatagoryModel>[].obs;
  final Rx<CatagoryModel> selectedCategory = CatagoryModel().obs;
 RxBool isLoadingCategories = false.obs;
  RxBool isEventLoading = false.obs;
  
    getAllEvents() async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.getAllEvents),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authService.authToken}',
        },
      );
      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
    GetAllEventsModel getAllEvents = GetAllEventsModel.fromJson(jsonResponse);
    allEvents = getAllEvents.data!;

        
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> getCategories() async {
    // isloadingCatagories.value = true;
    try {
      final response = await http.get(Uri.parse(ApiConstants.getCategories));
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['data'];
        categories.value = data.map((e) => CatagoryModel.fromJson(e)).toList();
        if(categories.isNotEmpty){
          selectedCategory.value = categories[0];
          await getPaginatedEvents();
        }
        isLoadingCategories.value = false;
      } else {
        isLoadingCategories.value = false;
        final errorData = jsonDecode(response.body);
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      isLoadingCategories.value = false;
      Get.snackbar('Error', e.toString());
    }
  }
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
