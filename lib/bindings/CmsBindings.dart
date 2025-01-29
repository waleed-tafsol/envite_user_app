import 'package:event_planner_light/controllers/CmsScreenController.dart';
import 'package:get/get.dart';

class Cmsbindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CmsScreenController>(() => CmsScreenController());
  }
}
