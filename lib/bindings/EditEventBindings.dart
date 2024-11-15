import 'package:event_planner_light/controllers/editEventController.dart';
import 'package:get/get.dart';

class EditeventBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<Editeventcontroller>(Editeventcontroller());
  }
}