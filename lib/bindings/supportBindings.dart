import 'package:event_planner_light/controllers/SupportController.dart';
import 'package:get/get.dart';

class SupportBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SupportController>(() => SupportController());
  }
}
