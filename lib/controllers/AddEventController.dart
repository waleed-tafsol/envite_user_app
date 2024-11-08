import 'package:get/get.dart';

class Addeventcontroller extends GetxController {
  List<String> options = ['Public', 'Private', 'Exclusive'];
  Rx<String?> selectedOption = Rx<String?>(null);

  void setSelectedOption(String option) {
    selectedOption.value = option;
  }
}
