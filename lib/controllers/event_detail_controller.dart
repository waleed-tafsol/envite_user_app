import 'dart:convert';
import 'package:event_planner_light/model/event_detail_response.dart';
import 'package:event_planner_light/services/ShareServices.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:event_planner_light/utills/enums.dart';
import 'package:event_planner_light/view/widgets/BottomModelSheet.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/ApiConstant.dart';
import '../utills/UrlLauncherUtills.dart';
import 'Auth_services.dart';
import 'MyInvitesController.dart';

class EventDetailController extends GetxController {
  RxBool isLoading = true.obs;
  RxBool isFavouritLoading = false.obs;
  RxBool isAttendEventLoading = false.obs;
  RxString selectedEventId = ''.obs;
  Rx<EventDetailResponse> eventDetailResponse = EventDetailResponse().obs;

  @override
  void onInit() async {
    super.onInit();
    if (Get.arguments != null) {
      selectedEventId.value = Get.arguments["slug"];
      await getEventsDetail();
    }
  }

  void attendEvent(BuildContext context) {
    final hasExclusivePackage = authService.me.value!.subscriptions!
        .where((element) => element.eventType == Events.exclusive.text)
        .isNotEmpty;
    final isPublicEvent =
        eventDetailResponse.value.data!.eventType == Events.public.text;
    if (hasExclusivePackage || isPublicEvent) {
      callAttendEventApi();
    } else {
      BottomSheetManager.buySubscriptionForExclusive(context);
    }
  }

  void sendInvites(BuildContext context) {
    final hasInvites = authService.me.value!.remainingInvites! > 0;
    if (hasInvites) {
      ShareService.shareMessage("I am inviting you to this event");
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
      } else {
        throw Exception('Failed to load events Details');
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      isLoading.value = false;
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
        final oldResponse = eventDetailResponse.value;
        oldResponse.data?.isFavorite =
            jsonResponse["data"]['event']["isFavorite"];
        eventDetailResponse.value = oldResponse;
        MyInvitesController myInvitesController = Get.find();
        await myInvitesController.getPaginatedEvents(callFirstTime: true);
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

  void callAttendEventApi() async {
    isAttendEventLoading.value = true;
    try {
      final response = await http.post(
          Uri.parse(ApiConstants.attendEvent + selectedEventId.value),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authService.authToken}',
          });
      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 201) {
        final oldResponse = eventDetailResponse.value;
        oldResponse.data?.isAttending = true;
        oldResponse.data?.attendees?.add(Attendees());
        eventDetailResponse.value = oldResponse;
        MyInvitesController myInvitesController = Get.find();
        await myInvitesController.getPaginatedEvents(callFirstTime: true);
      } else {
        throw Exception(jsonResponse["message"]?["error"]?[0] ??
            'Could Not Add To Favourits');
      }
    } catch (e) {
      CustomSnackbar.showError('Error', e.toString());
    } finally {
      isAttendEventLoading.value = false;
    }
  }

  void launchSocialLink(String url) async {
    launchUrlWeb(validateAndCorrectUrl(url));
  }
}
