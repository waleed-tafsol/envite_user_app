import 'dart:convert';

import 'package:event_planner_light/utills/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:http/http.dart' as http;

import '../constants/ApiConstant.dart';
import '../model/event_model.dart';
import 'Auth_services.dart';

class FiltersController extends GetxController {
  RxList<String> categories = <String>[].obs;
  RxString eventType = Events.all.text.obs;
  RxBool isFilterActivated = false.obs;
  TextEditingController searchController = TextEditingController();
  RxBool isEventLoading = false.obs;
  RxString selectScreen = ''.obs;
  RxBool showMyEvents = false.obs;
  RxString selectScreenStatus = Events.all.text.obs;
  RxList<EventModel> filteredEventsList = <EventModel>[].obs;

  void checkFiltersActive() {
    if ((categories.isNotEmpty) ||
        (eventType.value != Events.all.text) ||
        (searchController.text.isNotEmpty) /*||
        (selectScreen.value.isNotEmpty) */||
        (selectScreenStatus.value != Events.all.text)) {
      isFilterActivated.value = true;
      filteredEventsList.clear();
      getFilteredPaginatedEvents();
    } else {
      isFilterActivated.value = false;
    }
  }

  void clearFilterData() {
    selectScreenStatus.value = Events.all.text;
    categories.clear();
    eventType.value = Events.all.text;
    searchController.text = '';
    isFilterActivated.value = false;
  }

  void addAndRemoveCategories(String categorySlug) {
    if (categories.contains(categorySlug)) {
      categories.removeWhere((item) => item == categorySlug);
    } else {
      categories.add(categorySlug);
    }
  }

  void setSelectedScreen({required String value}) {
    if (value == Events.explorerEvents.text) {
      selectScreen.value = 'explore-events-view-all';
      selectScreenStatus.value = 'all';
    } else if (value == Events.explorerPastEvent.text) {
      selectScreen.value = 'explore-events-view-all';
      selectScreenStatus.value = 'past-events';
    } else if (value == Events.explorerUpcomingEvent.text) {
      selectScreen.value = 'explore-events-view-all';
      selectScreenStatus.value = 'upcoming-events';
    } else if (value == Events.myEvents.text) {
      selectScreen.value = 'my-events-view-all';
      selectScreenStatus.value = 'all';
    } else if (value == Events.myPastEvents.text) {
      selectScreen.value = 'my-events-view-all';
      selectScreenStatus.value = 'past-events';
    } else {
      selectScreen.value = 'my-events-view-all';
      selectScreenStatus.value = 'upcoming-events';
    }
  }

  Future<void> getFilteredPaginatedEvents() async {
    isEventLoading.value = true;
    try {
      final response = await http.post(
          Uri.parse(showMyEvents.value
              ? ApiConstants.getMyEvents
              : ApiConstants.getAllEvents),
          body: jsonEncode({
            "screen": selectScreen.value,
            "status": selectScreenStatus.value,
            "eventType": eventType.value,
            "categorySlugs": categories,
            "search": searchController.text
          }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authService.authToken}',
          });
      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['data'];
        filteredEventsList.value =
            data.map((e) => EventModel.fromJson(e)).toList();
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
}
