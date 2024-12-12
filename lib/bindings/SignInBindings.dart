import 'package:event_planner_light/controllers/SigninController.dart';
import 'package:get/get.dart';

class SignInBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SignIncontroller>(() => SignIncontroller());
  }
}
