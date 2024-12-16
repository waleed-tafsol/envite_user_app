import 'package:event_planner_light/controllers/ChooseYourLocationController.dart';
import 'package:get/get.dart';

class ChooseyourLocationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Chooseyourlocationcontroller>(
        () => Chooseyourlocationcontroller());
  }
}
