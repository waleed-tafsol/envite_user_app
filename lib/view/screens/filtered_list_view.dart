import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../constants/colors_constants.dart';
import '../../controllers/filters_controller.dart';
import '../../shimmer_loaders/event_tile_shimmer.dart';
import '../widgets/EventTileWidget.dart';

class FilteredListView extends StatefulWidget {
  const FilteredListView({super.key});

  @override
  State<FilteredListView> createState() => _FilteredListViewState();
}

class _FilteredListViewState extends State<FilteredListView> {
  FiltersController controller = Get.find();
  final ScrollController filterScrollController = ScrollController();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    filterScrollController.addListener(_onScroll);
  }

/*  @override
  void dispose() {
    filterScrollController.dispose();
    super.dispose();
  }*/

  Future<void> _onScroll() async {
    if (filterScrollController.position.pixels ==
            filterScrollController.position.maxScrollExtent &&
        controller.hasMore.value) {
      controller.currentPage.value = controller.currentPage.value + 1;
      await controller.getFilteredPaginatedEvents(callFirstTime: false);
      controller.hasMore.value = true;
      if (controller.listResponse.isEmpty) {
        controller.hasMore.value = false;
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return controller.isEventLoading.value
          ? ListView(
              //physics: const NeverScrollableScrollPhysics(),
              shrinkWrap: true,
              children: List.generate(5, (index) => eventTileShimmer()),
            )
          : controller.filteredEventsList.isNotEmpty
              ? ListView.builder(
                  itemCount: controller.filteredEventsList.length +
                      (controller.hasMore.value ? 1 : 0),
                  controller: filterScrollController,
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {
                    if (index == controller.filteredEventsList.length) {
                      return const Center(
                          child: Text(
                        'Loading... ',
                        style: TextStyle(color: Colors.redAccent),
                      ));
                    }
                    return EventTileWidget(
                      event: controller.filteredEventsList[index],
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
                              fontSize: 14.sp, color: AppColors.kBluedarkShade),
                        ),
                      ],
                    ),
                  ),
                );
    });
    ;
  }
}

/*

Widget filteredListView() {
  FiltersController filtersController = Get.find();
  return Obx(() {
    return filtersController.isEventLoading.value
        ? ListView(
            //physics: const NeverScrollableScrollPhysics(),
            shrinkWrap: true,
            children: List.generate(5, (index) => eventTileShimmer()),
          )
        : filtersController.filteredEventsList.isNotEmpty
            ? ListView.builder(
                itemCount:
                filtersController.filteredEventsList.length +
                    (filtersController.hasMore.value ? 1 : 0),
                controller: filtersController.filterScrollController,
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {
                  if (index ==
                      filtersController.filteredEventsList.length) {
                    return const Center(
                        child: Text(
                          'Loading... ',
                          style: TextStyle(color: Colors.redAccent),
                        ));
                  }
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
  });
}
*/
