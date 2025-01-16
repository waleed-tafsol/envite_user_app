import 'package:get/get.dart';

class Editeventcontroller extends GetxController {
  List<String> options = ['Public', 'Private', 'Exclusive'];
  Rx<String?> selectedOption = Rx<String?>(null);

  void setSelectedOption(String option) {
    selectedOption.value = option;
  }
}
