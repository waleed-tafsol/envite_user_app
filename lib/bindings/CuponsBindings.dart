import 'package:event_planner_light/controllers/CouponsController.dart';
import 'package:get/get.dart';

class CouponsBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CouponsController>(() => CouponsController());
  }
}
