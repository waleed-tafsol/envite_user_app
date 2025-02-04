import 'package:event_planner_light/controllers/PackagesController.dart';
import 'package:get/get.dart';

class PackagesControllerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PackagesController>(() => PackagesController());
  }
}
