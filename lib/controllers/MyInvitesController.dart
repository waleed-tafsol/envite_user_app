import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/ApiConstant.dart';
import '../model/event_model.dart';
import '../utills/enums.dart';
import 'Auth_services.dart';

class MyInvitesController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    scrollController.addListener(_onScroll);
    getPaginatedEvents(callFirstTime: true);
  }

  // Rx<String> exploreEventsScreenType = Events.explorerEvents.text.obs;
  final List<String> chipLabels = [
    MyInvitesTabs.pinned.text,
    MyInvitesTabs.plannedEvents.text,
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
      await getPaginatedEvents(callFirstTime: false);
      hasMore.value = true;
      if (eventList.isEmpty) {
        hasMore.value = false;
      }
    }
  }

  void changeMyInvitesTabs(bool selected, int index) {
    if (selected) {
      selectedChipIndex.value = index;
      getPaginatedEvents(callFirstTime: true);
    }
  }

  Future<void> getPaginatedEvents({required bool callFirstTime}) async {
    if (callFirstTime) {
      hasMore.value = true;
      isEventLoading.value = true;
      currentPage = 1;
      eventList.clear();
    }
    try {
      final response = await http.get(
          Uri.parse(
              '${selectedChipIndex.value == 0 ? ApiConstants.getAllfavourite : ApiConstants.getPlannedEvent}?page=$currentPage&limit=$limit'),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authService.authToken}',
          });
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        final List<dynamic> data = jsonResponse['data'];
        eventList = data
            .map((e) => EventModel.fromJson(
                selectedChipIndex.value == 0 ? e["event"] : e))
            .toList();
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

  // Future<void> getPlannedPaginatedEvents({required bool callFirstTime}) async {
  //   if (callFirstTime) {
  //     hasMore.value = true;
  //     isEventLoading.value = true;
  //     currentPage = 1;
  //     eventList.clear();
  //   }
  //   try {
  //     final response = await http.get(
  //         Uri.parse(
  //             '${ApiConstants.getPlannedEvent}?page=$currentPage&limit=$limit'),
  //         headers: {
  //           'Content-Type': 'application/json',
  //           'Authorization': 'Bearer ${authService.authToken}',
  //         });
  //     if (response.statusCode == 200) {
  //       final jsonResponse = json.decode(response.body);
  //       final List<dynamic> data = jsonResponse['data'];
  //       eventList = data.map((e) => EventModel.fromJson(e)).toList();
  //       if (callFirstTime) {
  //         if (eventList.length < 10) {
  //           hasMore.value = false;
  //         }
  //         isEventLoading.value = false;
  //       }
  //     } else {
  //       isEventLoading.value = false;
  //       final errorData = jsonDecode(response.body);
  //       throw Exception(
  //           errorData["message"]["error"][0] ?? "An error occurred");
  //     }
  //   } catch (e) {
  //     isEventLoading.value = false;
  //     Get.snackbar('Error', e.toString());
  //   }
  // }

}
