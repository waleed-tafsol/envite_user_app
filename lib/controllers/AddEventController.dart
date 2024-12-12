import 'dart:convert';

import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/services/customPrint.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/AddEventsScreen/ConfirmOrAddMoreEvents.dart';
import 'package:flutter/widgets.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/ApiConstant.dart';
import '../model/CatagoryModel.dart';
import '../services/LocationServices.dart';
import '../utills/ConvertDateTime.dart';

class Addeventcontroller extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    isloading.value = true;
    await getcatagories();
    isloading.value = false;
  }

  TextEditingController emailController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  TextEditingController avnueController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController socialLink1Controller = TextEditingController();
  TextEditingController socialLink2Controller = TextEditingController();
  TextEditingController socialLink3Controller = TextEditingController();
  TextEditingController descriptionController = TextEditingController();
  RxList<CatagoryModel> categories = <CatagoryModel>[].obs;
  Rx<CatagoryModel?> selectedCategory = CatagoryModel().obs;
  RxBool isloading = true.obs;
  List<String> options = ['public', 'private', 'exclusive'];
  Rx<String?> selectedOption = Rx<String?>(null);

  var selectedStartDate = DateTime.now().obs;
  var selectedEndDate = DateTime.now().obs;

  void setStartDate(DateTime date) {
    selectedStartDate.value = date;
  }

  void setEndDate(DateTime date) {
    selectedEndDate.value = date;
  }

  Future<void> getcatagories() async {
    try {
      final response =
          await http.get(Uri.parse(ApiConstants.getMyCatagories), headers: {
        'Authorization': 'Bearer ${authService.authToken}',
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['data'];
        categories.value = data.map((e) => CatagoryModel.fromJson(e)).toList();
        isloading.value = false;
      } else {
        isloading.value = false;
        final errorData = jsonDecode(response.body);
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      isloading.value = false;
      CustomSnackbar.showError('Error', e.toString());
    }
  }

  void setSelectedOption(String option) {
    selectedOption.value = option;
  }

  Future<void> addEvent() async {
    final url = Uri.parse(ApiConstants.addEvent);
    Position position = await LocationServices.getCurrentLocation();

    try {
      isloading.value = true;

      final request = http.MultipartRequest('POST', url);
      ColoredPrint.green(formatDateTime(selectedStartDate.value));
      ColoredPrint.green(formatDateTime(selectedEndDate.value));

      request.fields['name'] = nameController.value.text;
      request.fields['latitude'] = "0.00";
      request.fields['longitude'] = "0.00";
      request.fields['email'] = emailController.value.text;
      request.fields['eventType'] = selectedOption.value ?? "";
      request.fields['startDate'] = formatDateTime(selectedStartDate.value);
      request.fields['endDate'] = formatDateTime(selectedEndDate.value);
      request.fields['description'] = descriptionController.value.text;
      request.fields['avenue'] = avnueController.value.text;
      request.fields['address'] = addressController.value.text;
      request.fields['categorySlug'] = selectedCategory.value?.slug ?? "";
      request.fields['socialLinks[0]'] =
          '{"name":"Facebook","url":"${socialLink1Controller.value.text}"}';

      // if (selectedCategories.isNotEmpty) {
      //   for (var i = 0; i < selectedCategories.length; i++) {
      //     request.fields['categories[$i]'] = selectedCategories[i]!;
      //   }
      // }

      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ${authService.authToken}',
      });

      final streamedResponse = await request.send();

      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        CustomSnackbar.showSuccess('Success', responseData["message"]);
        isloading.value = false;
        Get.offAndToNamed(ConfirmorAddMoreEvents.routeName);

        return responseData;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      isloading.value = false;
      CustomSnackbar.showError("Error", e.toString());
    }
  }
}
