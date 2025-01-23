import 'dart:convert';
import 'package:event_planner_light/constants/ApiConstant.dart';
import 'package:event_planner_light/controllers/Auth_services.dart';

import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../model/my_event_model.dart';

class MyEventController extends GetxController {

Future<void> onInit() async {
  super.onInit();
  await getMyEvents();
}

  RxList<MyEventModel> events = <MyEventModel>[].obs;
  RxList<MyEventData> myEvents = <MyEventData>[].obs;
 RxBool isLoadingCategories = false.obs;
  RxBool isEventLoading = false.obs;

getMyEvents() async {
try   {
      final response = await http.post(Uri.parse(ApiConstants.getMyEvents),headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authService.authToken}',
        },);
      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
    
        final List<dynamic> data = jsonResponse['data'];
        myEvents.value = data.map((e) => MyEventData.fromJson(e)).toList();
       
        isLoadingCategories.value = false;
      } else {
        isLoadingCategories.value = false;
        final errorData = jsonDecode(response.body);
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      isLoadingCategories.value = false;
      Get.snackbar('Error', e.toString());
    }
  }


}