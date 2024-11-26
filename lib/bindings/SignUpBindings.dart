import 'package:event_planner_light/controllers/SignUpController.dart';
import 'package:get/get.dart';

class SignUpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Signupcontroller>(() => Signupcontroller());
  }
}
