import 'dart:convert';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../constants/ApiConstant.dart';
import '../model/NotificationResponseModel.dart';
import 'Auth_services.dart';

class NotificationController extends GetxController {
  // List of notifications
  RxList<NotificationModel> notificationList = <NotificationModel>[].obs;
  // Pagination state
  RxBool isLoading = false.obs;
  RxBool isPaginationLoading = false.obs;
  int currentPage = 1;
  final int limit = 15;
  int? totalRecords;

  @override
  void onInit() {
    super.onInit();
    getPaginatedNotification();
    scrollController.addListener(scrollListener);
  }

  // Refresh notifications
  Future<void> refereshNotification() async {
    currentPage = 1;
    await getPaginatedNotification();
  }

  // Get paginated notifications
  Future<void> getPaginatedNotification() async {
    try {
      if (currentPage > 1) {
        isPaginationLoading.value = true; // Pagination loading state
      } else {
        isLoading.value = true; // Initial loading state
      }

      final response = await http.get(
        Uri.parse(
            '${ApiConstants.getNotifications}?page=$currentPage&limit=13'),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authService.authToken}',
        },
      );

      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        // NotificationResponseModel newNotifications =
        //     NotificationResponseModel.fromJson(jsonResponse);

        // Update totalRecords for pagination
        totalRecords = jsonResponse ['totalRecords'];

        if (currentPage == 1) {
          // Reset the list on the first page
          notificationList.value = jsonResponse['data'] != null
              ? List<NotificationModel>.from(jsonResponse['data']
                  .map((v) => NotificationModel.fromJson(v)))
              : [];
        } else {
          // Append new notifications to the existing list

          notificationList.insertAll(
            0,
            jsonResponse['data'] != null
                ? List<NotificationModel>.from(jsonResponse['data']
                    .map((v) => NotificationModel.fromJson(v)))
                : [],
          );
        }
      }
    } catch (e) {
      Get.snackbar('Error', e.toString());
    } finally {
      if (currentPage > 1) {
        isPaginationLoading.value = false; // End pagination loading
      } else {
        isLoading.value = false; // End initial loading
      }
    }
  }

  final ScrollController scrollController = ScrollController();

  // Scroll listener to detect when the user reaches the bottom of the list
  void scrollListener() {
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      if (!isLoading.value &&
          !isPaginationLoading.value &&
          (notificationList.length) < (totalRecords ?? 0)) {
        // Load more data when scrolled to the bottom
        currentPage++;
        isPaginationLoading.value = true;
        getPaginatedNotification().then((_) {
          isPaginationLoading.value = false;
        });
      }
    }
  }
}
