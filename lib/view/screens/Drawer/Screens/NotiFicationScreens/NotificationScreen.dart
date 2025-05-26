import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constants/colors_constants.dart';
import '../../../../../controllers/NotificationController.dart';
import '../../../../../shimmer_loaders/event_tile_shimmer.dart';
import 'Widgets/MynotificationTile.dart';

class NotificationScreen extends GetView<NotificationController> {
  const NotificationScreen({super.key});
  static const routeName = "NotificationScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("My notifications"),
        centerTitle: true,
      ),
      body: Obx(() {
        return RefreshIndicator(
          onRefresh: () async {
            await controller.refereshNotification();
          },
          child: controller.isLoading.value
              ? ListView(
                  shrinkWrap: true,
                  children: List.generate(
                      10,
                      (index) => Padding(
                          padding: EdgeInsets.all(8.0),
                          child: sizedShimmer(height: 10.h))),
                )
              : controller.notificationList.isNotEmpty
                  ? ListView.builder(
                      itemCount: controller.notificationList.length,
                      controller: controller.scrollController,
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        if (index == controller.notificationList.length - 1) {
                          // Show shimmer only when paginated data is loading
                          return Obx(() {
                            return controller.isPaginationLoading.value
                                ? Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Center(
                                        child: CircularProgressIndicator()),
                                  )
                                : SizedBox.shrink();
                          });
                        }

                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 2.w),
                          child: MyNotificationTile(
                            notification: controller.notificationList[index],
                          ),
                        );
                      },
                    )
                  : SingleChildScrollView(
                      physics: AlwaysScrollableScrollPhysics(),
                      // padding: EdgeInsets.symmetric(vertical: 20.h),
                      child: SizedBox(
                        height: 80.h,
                        width: double.infinity,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Icon(Icons.event_busy_outlined,
                                color: AppColors.kBluedarkShade),
                            Text(
                              "No notifications available",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.kBluedarkShade),
                            ),
                          ],
                        ),
                      ),
                    ),
        );
      }),
    );
  }
}
