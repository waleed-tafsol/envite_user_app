import 'dart:convert';

import 'package:event_planner_light/utills/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/ApiConstant.dart';
import '../model/event_model.dart';
import 'Auth_services.dart';

class FiltersController extends GetxController {
  RxList<String> categories = <String>[].obs;
  RxString eventType = Events.all.text.obs;
  RxString eventStatus = Events.all.text.obs;

  RxBool isFilterActivated = false.obs;
  TextEditingController searchController = TextEditingController();
  RxBool isEventLoading = false.obs;
  RxString selectScreen = ''.obs;
  RxBool showMyEvents = false.obs;
  RxList<EventModel> listResponse = <EventModel>[].obs;
  RxString selectScreenStatus = Events.all.text.obs;

  RxList<EventModel> filteredEventsList = <EventModel>[].obs;

  RxBool hasMore = false.obs;
  RxInt currentPage = 1.obs;
  final int limit = 10;



  void checkFiltersActive() {
    if ((categories.isNotEmpty) ||
        (eventType.value != Events.all.text) ||
        (eventStatus.value != Events.all.text) ||
        (searchController.text
            .isNotEmpty) /*||
        (selectScreen.value.isNotEmpty) */ /*||
        (selectScreenStatus.value != Events.all.text)*/
    ) {
      isFilterActivated.value = true;
      filteredEventsList.clear();
      getFilteredPaginatedEvents(callFirstTime: true);
    } else {
      isFilterActivated.value = false;
    }
  }

  void clearFilterData({required bool resetSelectScreenStatus}) {
    if(resetSelectScreenStatus){
      selectScreenStatus.value = Events.all.text;
    }
    categories.clear();
    eventType.value = Events.all.text;
    eventStatus.value = Events.all.text;
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

  Future<void> getFilteredPaginatedEvents({required bool callFirstTime}) async {
    if (callFirstTime) {
      hasMore.value = true;
      isEventLoading.value = true;
      currentPage.value = 1;
      filteredEventsList.clear();
    }
    try {
      final response = await http.post(
          Uri.parse(showMyEvents.value
              ? '${ApiConstants.getMyEvents}?page=$currentPage&limit=$limit'
              : '${ApiConstants.getAllEvents}?page=$currentPage&limit=$limit'),
          body: jsonEncode({
            "screen": selectScreen.value,
            "status": eventStatus.value,
            "latestAndPast": selectScreenStatus.value,
            // "eventStatus": eventStatus.value,
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
        listResponse.value = data.map((e) => EventModel.fromJson(e)).toList();
        filteredEventsList.addAll(listResponse);
        if (callFirstTime) {
          if (listResponse.length < 10) {
            hasMore.value = false;
          }
          isEventLoading.value = false;
        }
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
