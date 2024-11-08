import 'package:get/get.dart';
import '../controllers/AddEventController.dart';

class AddeventBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Addeventcontroller>(() => Addeventcontroller());
  }
}
