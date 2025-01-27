import 'dart:convert';
import 'package:event_planner_light/model/events_list_response.dart';
import 'package:event_planner_light/utills/enums.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/ApiConstant.dart';
import '../model/event_model.dart';
import 'Auth_services.dart';

class MyEventsController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    scrollController.addListener(_onScroll);
    getMyPaginatedEvents(callFirstTime: true);
  }

  Rx<String> myEventsScreenType = Events.myEvents.text.obs;
  RxList<EventModel> myAllEvents = <EventModel>[].obs;

  // RxList<EventModel> myUpcomingEvents = <EventModel>[].obs;
  RxList<EventModel> myEventsViewAllList = <EventModel>[].obs;
  Rx<EventsListResponse> myEventModel = EventsListResponse().obs;

  int currentPage = 1;
  final int limit = 10;
  final ScrollController scrollController = ScrollController();

  //final RxBool isPaginationLoading = false.obs;
  RxBool hasMore = false.obs;

  RxBool isEventLoading = false.obs;

  Future<void> _onScroll() async {
    if (scrollController.position.pixels ==
                scrollController.position.maxScrollExtent &&
            hasMore.value /*&&
        !isPaginationLoading.value*/
        ) {
      currentPage++;
      //   isPaginationLoading.value = true;
      await getMyPaginatedEvents(callFirstTime: false);
      hasMore.value = true;

      // isPaginationLoading.value = false;
      if (myAllEvents.isEmpty) {
        hasMore.value = false;
      }
    }
  }

  // get events
  Future<void> getMyPaginatedEvents({required bool callFirstTime}) async {
    if (callFirstTime) {
      hasMore.value = true;
      isEventLoading.value = true;
      currentPage = 1;
      myEventsViewAllList.clear();
      // myUpcomingEvents.clear();
    }
    try {
      myAllEvents.clear();
      final response = await http.post(
          Uri.parse(
              '${ApiConstants.getMyEvents}?page=$currentPage&limit=$limit'),
          body: myEventsScreenType.value == Events.myEvents.text
              ? jsonEncode({
                  "screen": 'my-events',
                })
              : jsonEncode({
                  "screen": 'my-events-view-all',
                  "status": myEventsScreenType.value == Events.myPastEvents.text
                      ? 'past-events'
                      : 'upcoming-events'
                }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authService.authToken}',
          });
      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        if (myEventsScreenType.value == Events.myEvents.text) {
          myEventModel(EventsListResponse.fromJson(jsonResponse));
        } else {
          final List<dynamic> data = jsonResponse['data'];
          myAllEvents.value = data.map((e) => EventModel.fromJson(e)).toList();
          myEventsViewAllList.addAll(myAllEvents);
        }
        if (callFirstTime) {
          if(myAllEvents.length < 10){
            hasMore.value = false;
          }
          isEventLoading.value = false;
        }
      } else {
        if (callFirstTime) {
          isEventLoading.value = false;
        }
        final errorData = jsonDecode(response.body);
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      if (callFirstTime) {
        isEventLoading.value = false;
      }
      Get.snackbar('Error', e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
