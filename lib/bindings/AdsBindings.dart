import 'package:event_planner_light/controllers/AdsController.dart';
import 'package:get/get.dart';

class AdsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdsController>(() => AdsController());
  }
}
