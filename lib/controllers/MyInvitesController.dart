import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:event_planner_light/constants/ApiConstant.dart';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/model/getAllEventsModel.dart';
import 'package:get/get.dart';

class MyInvitesController extends GetxController {
  @override
  Future<void> onInit() async {
    super.onInit();
    await getAllEvents();
  }
    //https://envite-backend-dd-d3e9220ccbc0.herokuapp.com/api/v1
List <Data> data = [];
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
    data = getAllEvents.data!;

        
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }
}


