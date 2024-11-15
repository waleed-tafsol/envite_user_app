import 'package:event_planner_light/controllers/membership_controller.dart';
import 'package:get/get.dart';


class MembershipBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<MembershipController>(() => MembershipController());
  }
}
