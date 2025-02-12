import 'dart:convert';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/model/PackagesModel.dart';
import 'package:event_planner_light/shimmer_loaders/event_tile_shimmer.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:event_planner_light/view/screens/Drawer/Screens/MembershipScreens/PaymentScreen.dart';
import 'package:flutter/material.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../../constants/ApiConstant.dart';
import '../../../../../../constants/colors_constants.dart';
import '../../../../../../constants/constants.dart';

void addOnsDailogBox(BuildContext ctx) {
  showDialog(
    context: ctx,
    builder: (BuildContext context) {
      final AddonsdailodboxController controller =
          Get.put(AddonsdailodboxController());
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Stack(
          clipBehavior: Clip.none, // Allow overflow outside the dialog
          children: [
            Column(
              mainAxisSize:
                  MainAxisSize.min, // Constrain the column to its content size
              children: [
                Text("Buy More Invites",
                    style: TextStyle(fontSize: 20, color: Colors.black)),
                k3hSizedBox,
                Obx(() {
                  return controller.isloading.value
                      ? sizedShimmer(height: 3.h)
                      : Text(
                          "1 Invite cost \$${controller.topups?.value?.price ?? 0}",
                          style:
                              TextStyle(fontSize: 14.sp, color: Colors.black));
                }),
                k3hSizedBox,
                Obx(() {
                  return controller.isloading.value
                      ? sizedShimmer(height: 3.h)
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(
                              icon: Icon(Icons.remove),
                              onPressed: () => controller.decrementInvites(),
                            ),
                            Text("${controller.invites.value} Invites",
                                style: TextStyle(
                                    fontSize: 17, color: Colors.black)),
                            IconButton(
                              icon: Icon(Icons.add),
                              onPressed: () => controller.incrementInvites(),
                            ),
                          ],
                        );
                }),
                k1hSizedBox,
                Obx(() {
                  return controller.isloading.value
                      ? sizedShimmer(height: 4.h)
                      : RichText(
                          text: TextSpan(
                            text:
                                "${(controller.topups?.value?.price ?? 0) * controller.invites.value}",
                            style: TextStyle(
                                color: AppColors.kPrimaryColor,
                                fontSize: 17.sp,
                                fontWeight: FontWeight.bold),
                            children: <TextSpan>[
                              TextSpan(
                                text: '/\$',
                                style: TextStyle(
                                  color: AppColors.kPrimaryColor,
                                  fontSize: 14.sp,
                                ),
                              ),
                            ],
                          ),
                        );
                }),
                k1hSizedBox,
                SizedBox(
                  width: double.infinity,
                  child: Obx(() {
                    return controller.isloading.value
                        ? sizedShimmer(height: 5.h)
                        : ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor: WidgetStateProperty.all(
                                  AppColors.kPrimaryColor),
                              foregroundColor:
                                  WidgetStateProperty.all(Colors.white),
                            ),
                            onPressed: () {
                              controller.invites.value != 0
                                  ? Get.toNamed(PaymentScreen.routeName,
                                      arguments: {
                                          "istopupPayment": true,
                                          "packagesModel":
                                              controller.topups?.value,
                                          "noOfInvites":
                                              controller.invites.value
                                        })
                                  : CustomSnackbar.showError(
                                      "Error", "Please add invites");
                            },
                            child: Text("Buy"),
                          );
                  }),
                ),
              ],
            ),
            Positioned(
              top: -5.h,
              right: -4.w,
              child: IconButton.filled(
                color: Colors.white,
                icon: Icon(Icons.cancel_outlined, color: Colors.red),
                onPressed: () {
                  Get.back();
                },
              ),
            ),
          ],
        ),
      );
    },
  ).then((value) {
    Get.delete<AddonsdailodboxController>();
  });
}

class AddonsdailodboxController extends GetxController {
  @override
  void onInit() async {
    super.onInit();
    await getAllPackages();
  }

  Rx<PackagesModel?>? topups = Rx<PackagesModel?>(null);

  RxBool isloading = false.obs;
  RxInt invites = 0.obs;

  void incrementInvites() {
    invites++;
  }

  void decrementInvites() {
    invites.value != 0 ? invites-- : null;
  }

  Future<void> getAllPackages() async {
    isloading.value = true;
    try {
      final response = await http.post(Uri.parse(ApiConstants.getAllPackages),
          body: jsonEncode({"packageType": "addon"}),
          headers: {
            'Content-Type': 'application/json',
            'Authorization': 'Bearer ${authService.authToken}',
          });
      if (response.statusCode == 201) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['data'];
        topups = PackagesModel.fromJson(data[0]).obs;
        isloading.value = false;
      } else {
        isloading.value = false;
        throw Exception('Failed to load topups');
      }
    } catch (e) {
      isloading.value = false;
      Get.back();
      CustomSnackbar.showError('Error', e.toString());
    }
  }

  @override
  void onClose() {
    super.onClose();
  }
}

void demoDailogBoxWithText(BuildContext ctx, String text) {
  showDialog(
    context: ctx,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: Colors.white,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text("$text Under Development",
                style: TextStyle(fontSize: 17.sp, color: Colors.black)),
            k1hSizedBox,
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor:
                    WidgetStateProperty.all(AppColors.kPrimaryColor),
                foregroundColor: WidgetStateProperty.all(Colors.white),
              ),
              onPressed: () {
                Get.back();
              },
              child: Text("Got It"),
            )
          ],
        ),
      );
    },
  );
}
