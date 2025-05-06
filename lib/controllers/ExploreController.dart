import 'dart:convert';

import 'package:event_planner_light/model/events_list_response.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/ApiConstant.dart';
import '../model/event_model.dart';
import '../utills/enums.dart';
import 'Auth_services.dart';

class ExploreController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    scrollController.addListener(_onScroll);
    getExplorerPaginatedEvents(callFirstTime: true);
  }

  Rx<String> exploreEventsScreenType = Events.explorerEvents.text.obs;
  RxList<EventModel> listResponse = <EventModel>[].obs;
  RxList<EventModel> exploreEventsViewAllList = <EventModel>[].obs;
  Rx<EventsListResponse> exploreEventModel = EventsListResponse().obs;

  int currentPage = 1;
  final int limit = 10;
  final ScrollController scrollController = ScrollController();
  RxBool hasMore = false.obs;

  RxBool isEventLoading = false.obs;

  Future<void> _onScroll() async {
    if (scrollController.position.pixels ==
            scrollController.position.maxScrollExtent &&
        hasMore.value) {
      currentPage++;
      await getExplorerPaginatedEvents(callFirstTime: false);
      hasMore.value = true;
      if (listResponse.isEmpty) {
        hasMore.value = false;
      }
    }
  }

  Future<void> getExplorerPaginatedEvents({required bool callFirstTime}) async {
    if (callFirstTime) {
      hasMore.value = true;
      isEventLoading.value = true;
      currentPage = 1;
      exploreEventsViewAllList.clear();
    }
    try {
      final response = await http.post(
          Uri.parse(
              '${ApiConstants.getAllEvents}?page=$currentPage&limit=$limit'),
          body: exploreEventsScreenType.value == Events.explorerEvents.text
              ? jsonEncode({
                  "screen": 'explore-events',
                })
              : jsonEncode({
                  "screen": 'explore-events-view-all',
            "latestAndPast": exploreEventsScreenType.value ==
                          Events.explorerPastEvent.text
                      ? 'past-events'
                      : 'upcoming-events'
                }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authService.authToken}',
          });
      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        if (exploreEventsScreenType.value == Events.explorerEvents.text) {
          exploreEventModel(EventsListResponse.fromJson(jsonResponse));
        } else {
          final List<dynamic> data = jsonResponse['data'];
          listResponse.value = data.map((e) => EventModel.fromJson(e)).toList();
          exploreEventsViewAllList.addAll(listResponse);
        }
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
