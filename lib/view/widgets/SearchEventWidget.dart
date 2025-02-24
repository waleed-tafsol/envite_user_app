import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../controllers/filters_controller.dart';
import 'filters_bottom_sheet.dart';

class SearchEventWidget extends StatelessWidget {
  SearchEventWidget({
    super.key,
  });
  final FiltersController filtersController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(
          width: 10.w,
          child: InkWell(
              onTap: () => filterBottomSheet(
                    screenContext: context,
                  ),
              child: Obx(() {
                return Stack(
                  children: [
                    SvgPicture.asset(
                      SvgAssets.filter,
                      width: 5.w,
                    ),
                    Visibility(
                        visible: filtersController.isFilterActivated.value,
                        child: Badge(
                          backgroundColor: AppColors.kBluedarkShade,
                        ))
                  ],
                );
              })),
        ),
        SizedBox(
          width: 1.w,
        ),
        Expanded(
          child: TextField(
            controller: filtersController.searchController,
            onSubmitted: (value) {
              filtersController.checkFiltersActive();
            },
            decoration: InputDecoration(
                suffixIcon: InkWell(
                    onTap: () {
                      filtersController.checkFiltersActive();
                    },
                    child: Icon(Icons.search)),
                hintText: "Search an event"),
          ),
        )
      ],
    );
  }
}
