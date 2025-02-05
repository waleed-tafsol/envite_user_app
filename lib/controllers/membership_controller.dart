import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/model/SubscriptionModel.dart';
import 'package:get/get.dart';

class MembershipController extends GetxController {
  var selectedChipIndex = 1.obs;
  List<Subscriptions> membershipPlans = [];

  @override
  void onInit() {
    membershipPlans = authService.me.value?.subscriptions ?? [];
    super.onInit();
  }

  void updateSelectedChip(int index) {
    selectedChipIndex.value = index;
  }
}
