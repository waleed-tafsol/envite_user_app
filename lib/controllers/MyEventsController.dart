import 'dart:convert';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:http/http.dart' as http;
import 'package:event_planner_light/constants/ApiConstant.dart';
import 'package:event_planner_light/model/event_model.dart';
import 'package:event_planner_light/model/events_list_response.dart';
import 'package:event_planner_light/utills/enums.dart';
import 'package:get/get.dart';

class Myeventscontroller extends GetxController {
  
  @override
  void onInit() async {
    super.onInit();
    getMyPaginatedEvents();
  }

  Rx<String> myEventsScreenType = Events.myEvents.text.obs;
  RxList<EventModel> myUpcomingEvents = <EventModel>[].obs;
  RxList<EventModel> myPastEvents = <EventModel>[].obs;
  Rx<EventsListResponse> myEventModel = EventsListResponse().obs;


  RxBool isEventLoading = false.obs;

  // get events
  Future<void> getMyPaginatedEvents() async {
    isEventLoading.value = true;
    try {
      final response = await http.post(Uri.parse(ApiConstants.getMyEvents),
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
          ;
          if (myEventsScreenType.value == Events.myPastEvents.text) {
            myPastEvents.value = data.map((e) => EventModel.fromJson(e)).toList();
          } else {
            myUpcomingEvents.value =
                data.map((e) => EventModel.fromJson(e)).toList();
          }
        }

        // final List<dynamic> data = jsonResponse['data'];
        // upcomingEvents.value = data.map((e) => EventModel.fromJson(e)).toList();
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

