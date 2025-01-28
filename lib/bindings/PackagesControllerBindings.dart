import 'package:event_planner_light/controllers/PackagesController.dart';
import 'package:get/get.dart';

class Packagescontrollerbindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PackagesController>(() => PackagesController());
  }
}
