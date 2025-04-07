import 'package:get/get.dart';
import '../controllers/ContactSelectionController.dart';

class ContactSelectionBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ContactSelectionController>(() => ContactSelectionController());
  }
}
