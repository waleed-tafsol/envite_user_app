import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/ApiConstant.dart';
import '../model/event_model.dart';
import '../model/events_list_response.dart';
import 'Auth_services.dart';

class MyInvitesController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    scrollController.addListener(_onScroll);
    getFavouritPaginatedEvents(callFirstTime: true);
  }

  // Rx<String> exploreEventsScreenType = Events.explorerEvents.text.obs;
  final List<String> chipLabels = [
    'Pinned',
    'Planned events',
  ];
  final RxInt selectedChipIndex = 0.obs;
  List<EventModel> eventList = <EventModel>[].obs;

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
      await getFavouritPaginatedEvents(callFirstTime: false);
      hasMore.value = true;
      if (eventList.isEmpty) {
        hasMore.value = false;
      }
    }
  }

  Future<void> getFavouritPaginatedEvents({required bool callFirstTime}) async {
    if (callFirstTime) {
      hasMore.value = true;
      isEventLoading.value = true;
      currentPage = 1;
      eventList.clear();
    }
    try {
      final response = await http.get(
          Uri.parse(
              '${ApiConstants.getAllfavourite}?page=$currentPage&limit=$limit'),
          // body: exploreEventsScreenType.value == Events.explorerEvents.text
          //     ? jsonEncode({
          //         "screen": 'explore-events',
          //       })
          //     : jsonEncode({
          //         "screen": 'explore-events-view-all',
          //   "latestAndPast": exploreEventsScreenType.value ==
          //                 Events.explorerPastEvent.text
          //             ? 'past-events'
          //             : 'upcoming-events'
          //       }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authService.authToken}',
          });
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        // if (exploreEventsScreenType.value == Events.explorerEvents.text) {
        //   exploreEventModel(EventsListResponse.fromJson(jsonResponse));
        // } else {
        final List<dynamic> data = jsonResponse['data'];
        eventList = data.map((e) => EventModel.fromJson(e["event"])).toList();
        // exploreEventsViewAllList.addAll(listResponse);
        // }
        if (callFirstTime) {
          if (eventList.length < 10) {
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

  @override
  void onClose() {
    super.onClose();
  }
}
