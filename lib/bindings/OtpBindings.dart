import 'package:get/get.dart';

import '../controllers/otp_controller.dart';

class OtpBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<OtpController>(() => OtpController());
  }
}
