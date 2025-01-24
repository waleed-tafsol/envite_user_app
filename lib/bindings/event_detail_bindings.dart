import 'package:event_planner_light/controllers/event_detail_controller.dart';
import 'package:get/get.dart';

class EventDetailBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<EventDetailController>(() => EventDetailController());
  }
}
