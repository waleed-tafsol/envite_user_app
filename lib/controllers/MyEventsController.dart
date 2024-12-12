import 'dart:convert';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/ApiConstant.dart';
import '../model/EventModel.dart';
import 'Auth_services.dart';

class MyEventsController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    isEventLoading.value = true;
    getpaginatedEvents();
  }

  RxList<EventModel> events = <EventModel>[].obs;

  RxBool isloadingCatagories = false.obs;
  RxBool isEventLoading = false.obs;

  // get events
  Future<void> getpaginatedEvents() async {
    // isEventLoading.value = true;
    try {
      final response = await http.post(Uri.parse(ApiConstants.getMyEvents),
          body: jsonEncode({
            // "eventType": "exclusive",
            "packageType": "all"
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
