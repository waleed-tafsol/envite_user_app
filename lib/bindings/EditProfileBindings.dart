import 'package:get/get.dart';

import '../controllers/EditProfileController.dart';

class EditProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<EditProfileController>(EditProfileController());
  }
}
