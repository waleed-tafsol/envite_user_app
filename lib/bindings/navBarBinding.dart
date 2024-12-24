import 'package:event_planner_light/controllers/ExploreController.dart';
import 'package:event_planner_light/controllers/HomeScreenController.dart';
import 'package:event_planner_light/controllers/MyEventsController.dart';
import 'package:event_planner_light/controllers/MyInvitesController.dart';
import 'package:event_planner_light/controllers/MyProfileController.dart';
import 'package:get/get.dart';

import '../controllers/view_all_events_controller.dart';

class NavbarBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ViewAllEventsController>(() => ViewAllEventsController());
    Get.lazyPut<HomeScreenController>(() => HomeScreenController());
    Get.lazyPut<ExploreController>(() => ExploreController());
    Get.lazyPut<MyInvitesController>(() => MyInvitesController());
    Get.lazyPut<MyEventsController>(() => MyEventsController());
    Get.lazyPut<MyProfileController>(() => MyProfileController());
  }
}
