import 'dart:convert';
import 'package:event_planner_light/model/event_detail_response.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/ApiConstant.dart';
import 'Auth_services.dart';

class EventDetailController extends GetxController {

  
  RxBool isLoading = true.obs;
  RxString selectedEventId = ''.obs;
  Rx<EventDetailResponse> eventDetailResponse = EventDetailResponse().obs;



  Future<void> getEventsDetail() async {
    isLoading.value = true;
    try {
      final response = await http.get(
          Uri.parse(ApiConstants.eventDetail + selectedEventId.value),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authService.authToken}',
          });
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        eventDetailResponse.value = EventDetailResponse.fromJson(jsonResponse);
        isLoading.value = false;
      } else {
        isLoading.value = false;
        throw Exception('Failed to load events Details');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }
}
