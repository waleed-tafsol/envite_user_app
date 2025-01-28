import 'package:get/get.dart';

class MembershipController extends GetxController {
  var selectedChipIndex = 1.obs;

  void updateSelectedChip(int index) {
    selectedChipIndex.value = index;
  }
}
