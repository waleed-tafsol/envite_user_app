import 'dart:convert';
import 'dart:io';
import 'package:http/http.dart' as http;
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:get_thumbnail_video/video_thumbnail.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import '../constants/ApiConstant.dart';
import 'package:http_parser/http_parser.dart';

import 'package:event_planner_light/model/TicketModel.dart';

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
  Rx<File?> pickedImages = Rx<File?>(null);
  final ImagePicker _picker = ImagePicker();

  RxBool isloading = false.obs;

  Future<void> pickImage() async {
    try {
      final XFile? file = await _picker.pickImage(source: ImageSource.gallery);

      pickedImages.value = File(file!.path);
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image or video: $e');
    }
  }

  // Create Ticket
  Future<void> createTicket() async {
    isloading.value = true;
    try {
      final url = Uri.parse(ApiConstants.generateTicket);
      final request = http.MultipartRequest('POST', url);

      request.fields['title'] = titleController.value.text;
      request.fields['description'] = descriptionController.value.text;
      final mimeType = lookupMimeType(pickedImages
          .value!.path); // Get MIME type based on the file extension
      final mediaType = mimeType != null
          ? MediaType.parse(mimeType)
          : MediaType('image', 'jpeg'); // Default to 'image/jpeg'

      var multipartFile = await http.MultipartFile.fromPath(
        'image',
        pickedImages.value!.path,
        // filename: file.uri.pathSegments.last,
        contentType: mediaType,
      );

      request.files.add(multipartFile);

      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ${authService.authToken}',
      });

      // Send the request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        CustomSnackbar.showSuccess('Success', "Ticket Created Successfully");
        isloading.value = false;
        getAllTickets();
      } else {
        isloading.value = false;
        throw Exception('Failed to load ticket');
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
