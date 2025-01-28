import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors_constants.dart';
import '../../controllers/filters_controller.dart';
import '../../shimmer_loaders/event_tile_shimmer.dart';
import '../widgets/EventTileWidget.dart';

Widget filteredListView() {
  FiltersController filtersController = Get.find();

  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Obx(() {
          return filtersController.isEventLoading.value
              ? ListView(
                  physics: const NeverScrollableScrollPhysics(),
                  shrinkWrap: true,
                  children: List.generate(5, (index) => eventTileShimmer()),
                )
              : filtersController.filteredEventsList.isNotEmpty
                  ? ListView.builder(
                      itemCount: filtersController.filteredEventsList.length,
                      physics: const NeverScrollableScrollPhysics(),
                      shrinkWrap: true,
                      itemBuilder: (BuildContext context, int index) {
                        return EventTileWidget(
                          event: filtersController.filteredEventsList[index],
                        );
                      })
                  : SizedBox(
                      height: 40.h,
                      child: Center(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.event_busy_outlined,
                              color: AppColors.kBluedarkShade,
                            ),
                            Text(
                              "No Events are available",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  color: AppColors.kBluedarkShade),
                            ),
                          ],
                        ),
                      ),
                    );
        }),
      ],
    ),
  );
}
