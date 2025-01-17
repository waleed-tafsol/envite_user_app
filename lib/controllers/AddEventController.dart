import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEventController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController avnueController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  List<TextEditingController> emailController =
      <TextEditingController>[TextEditingController()].obs;
  List<TextEditingController> socialLinkController =
      <TextEditingController>[TextEditingController()].obs;
  TextEditingController descriptionController = TextEditingController();
}
