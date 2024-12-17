import 'package:get/get.dart';
import '../controllers/EditProfileController.dart';
import '../controllers/editEventController.dart';

class EditProfileBindings extends Bindings {
  @override
  void dependencies() {
    Get.put<EditProfileController>(EditProfileController());
  }
}
