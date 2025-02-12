import 'dart:convert';
import 'package:event_planner_light/model/event_detail_response.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:event_planner_light/utills/enums.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/Widget/AddonsDailodBox.dart';
import 'package:event_planner_light/view/widgets/BottomModelSheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/ApiConstant.dart';
import 'Auth_services.dart';
import 'MyInvitesController.dart';

class EventDetailController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isFavouritLoading = false.obs;
  RxString selectedEventId = ''.obs;
  Rx<EventDetailResponse> eventDetailResponse = EventDetailResponse().obs;
  RxBool isFavourit = false.obs;

  void attendEvent(BuildContext context) {
    //  final isexclusive = eventDetailResponse.value.data?.eventType == Events.exclusive.text;
    final hasExclusivePackage = authService.me.value!.subscriptions!
            .where((element) => element.eventType == Events.exclusive.text)
            .length >
        0;
    if (hasExclusivePackage) {
      demoDailogBoxWithText(context, "Attending Event Flow");
    } else {
      BottomSheetManager.buySubscriptionForExclusive(context);
    }
  }

  void sendInvites(BuildContext context) {
    //  final isexclusive = eventDetailResponse.value.data?.eventType == Events.exclusive.text;
    final hasInvites = authService.me.value!.totalAddonInvites! > 0;
    if (hasInvites) {
      demoDailogBoxWithText(context, "Invitition of Event Flow");
    } else {
      BottomSheetManager.upgradEvent(context);
    }
  }

  Future<void> getEventsDetail() async {
    isLoading.value = true;
    try {
      final response = await http.get(
          Uri.parse(ApiConstants.eventDetail + selectedEventId.value),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authService.authToken}',
          });
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        eventDetailResponse.value = EventDetailResponse.fromJson(jsonResponse);
        isFavourit.value = eventDetailResponse.value.data!.isFavorite ?? false;
        isLoading.value = false;
      } else {
        isLoading.value = false;
        throw Exception('Failed to load events Details');
      }
    } catch (e) {
      isLoading.value = false;
      Get.snackbar('Error', e.toString());
    }
  }

  Future<void> addToFavourits() async {
    isFavouritLoading.value = true;
    try {
      final response = await http.post(
          Uri.parse(ApiConstants.addTofavourite + selectedEventId.value),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authService.authToken}',
          });
      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 201) {
        // eventDetailResponse.value = EventDetailResponse.fromJson(jsonResponse);
        isFavourit.value = jsonResponse["data"]['event']["isFavorite"];
        MyInvitesController myInvitesController = Get.find();
        await myInvitesController.getFavouritPaginatedEvents(
            callFirstTime: true);
        isLoading.value = false;
      } else {
        throw Exception(jsonResponse["message"]?["error"]?[0] ??
            'Could Not Add To Favourits');
      }
    } catch (e) {
      CustomSnackbar.showError('Error', e.toString());
    } finally {
      isFavouritLoading.value = false;
    }
  }
}
