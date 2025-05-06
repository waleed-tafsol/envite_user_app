import 'dart:convert';
import 'dart:io';

import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/model/TicketModel.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';

import '../constants/ApiConstant.dart';

class SupportController extends GetxController {
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
  Rx<File?> pickedImage = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  RxBool isloading = false.obs;

  Future<void> pickImage() async {
    try {
      final XFile? file = await _picker.pickImage(source: ImageSource.gallery);

      pickedImage.value = File(file!.path);
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image or video: $e');
    }
  }
  Future<void> removeImage() async {

      pickedImage.value = null;
  }

  // Create Ticket
  Future<void> createTicket() async {
    isloading.value = true;
    try {
      final url = Uri.parse(ApiConstants.generateTicket);
      final request = http.MultipartRequest('POST', url);

      request.fields['title'] = titleController.value.text;
      request.fields['description'] = descriptionController.value.text;

      if (pickedImage.value!= null) {
        
      final mimeType = lookupMimeType(pickedImage
          .value!.path);
      final mediaType = mimeType != null
          ? MediaType.parse(mimeType)
          : MediaType('image', 'jpeg');

      var multipartFile = await http.MultipartFile.fromPath(
        'image',
        pickedImage.value!.path,
        // filename: file.uri.pathSegments.last,
        contentType: mediaType,
      );

      request.files.add(multipartFile);
      }

      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ${authService.authToken}',
      });

      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);
         final jsonResponse = json.decode(response.body);

      if (response.statusCode == 201) {
        isloading.value = false;
        // Map<String, dynamic> jsonResponseData =
          // Map<String, dynamic>.from(jsonResponse['data']);
        tickets.insert(0,
           TicketModel.fromJson(jsonResponse["data"]));
        
        clearValues();
        Get.back();
        CustomSnackbar.showSuccess('Success', "Ticket Created Successfully");
      } else {
        isloading.value = false;
        throw Exception(jsonResponse["message"]["error"][0]);
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

  void clearValues(){
    removeImage();
    titleController.text ="";
    descriptionController.text ="";
  }
}
