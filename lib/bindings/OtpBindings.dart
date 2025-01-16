import 'package:event_planner_light/view/screens/OtpScreen.dart';
import 'package:get/get.dart';

class OtpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
  }
}
