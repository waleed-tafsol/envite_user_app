import 'package:get/get.dart';

import '../controllers/CreateProfileController.dart';

class Createportfoliobindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<Createprofilecontroller>(() => Createprofilecontroller());
  }
}
