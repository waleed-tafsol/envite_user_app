import 'dart:convert';

import 'package:event_planner_light/model/TicketModel.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

import '../constants/ApiConstant.dart';
import 'package:http/http.dart' as http;

import '../utills/CustomSnackbar.dart';
import 'Auth_services.dart';

class Supportcontroller extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await getAllTickets();
  }

  TextEditingController titleController = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxList<TicketModel> tickets = <TicketModel>[].obs;
  List allTypes = ["all", "pending", "resolved", "rejected"];
  RxString selectedType = "pending".obs;

  RxBool isloading = false.obs;

  // Create Ticket
  Future<void> createTicket() async {
    isloading.value = true;
    try {
      final response = await http.post(Uri.parse(ApiConstants.generateTicket),
          body: jsonEncode({
            "title": titleController.value.text,
            "description": descriptionController.value.text
          }),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authService.authToken}',
          });
      if (response.statusCode == 201) {
        CustomSnackbar.showSuccess('Success', "Ticket Created Successfully");
        isloading.value = false;
        getAllTickets();
      } else {
        isloading.value = false;
        throw Exception('Failed to load topups');
      }
    } catch (e) {
      isloading.value = false;
      CustomSnackbar.showError('Error', e.toString());
    }
  }

  // get catagories
  Future<void> getAllTickets() async {
    isloading.value = true;
    try {
      final response = await http.get(
          Uri.parse(ApiConstants.getTickets + selectedType.value),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authService.authToken}',
          });

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);

        // Ensure jsonResponse['data'] is a List of Maps
        List<Map<String, dynamic>> jsonResponseData =
            List<Map<String, dynamic>>.from(jsonResponse['data']);

        tickets.clear();
        tickets.addAll(
            jsonResponseData.map((e) => TicketModel.fromJson(e)).toList());

        isloading.value = false;
      } else {
        isloading.value = false;
        throw Exception('Failed to load Tickets');
      }
    } catch (e) {
      isloading.value = false;
      CustomSnackbar.showError('Error', e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}
