import 'package:event_planner_light/view/screens/OtpScreen.dart';
import 'package:get/get.dart';

import '../controllers/otp_controller.dart';

class OtpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
  }
}
