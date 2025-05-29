import 'package:cached_network_image/cached_network_image.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/AdsController.dart';
import 'package:event_planner_light/view/screens/ads/add_ads_screen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../constants/constants.dart';
import '../../../shimmer_loaders/event_tile_shimmer.dart';
import '../../../utills/string_decoration.dart';
import '../../widgets/TagContainer.dart';

class AdsScreen extends GetView<AdsController> {
  static const routeName = 'AdsScreen';

  const AdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F8EF),
      appBar: AppBar(
        title: const Text('My Ads'),
        centerTitle: true,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 3.h),
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Obx(() {
                return Wrap(
                  //mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  spacing: 1.w,
                  children: List<Widget>.generate(
                    controller.chipLabels.length,
                    (int index) {
                      return ChoiceChip(
                        backgroundColor: AppColors.kBlueMediumShade,
                        selectedColor: AppColors.kPrimaryColor,
                        shape: RoundedRectangleBorder(
                            borderRadius: k5BorderRadius,
                            side: BorderSide(
                              color: AppColors.kBlueMediumShade,
                            )),
                        label: Text(
                          capitalizeFirstLetter(controller.chipLabels[index]),
                          style: TextStyle(
                              color: controller.chipLabels[index] ==
                                      controller.selectedChip.value
                                  ? Colors.white
                                  : AppColors.kBluedarkShade),
                        ),
                        selected: controller.selectedChip.value ==
                            controller.chipLabels[index],
                        onSelected: (bool selected) {
                          if (selected) {
                            controller.selectedChip.value =
                                controller.chipLabels[index];
                            controller.getAllAds(callFirstTime: true);
                          }
                        },
                      );
                    },
                  ).toList(),
                );
              }),
              SizedBox(
                height: 2.h,
              ),
              Obx(() {
                return Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(vertical: 2.h),
                    child: controller.isLoading.value
                        ? SingleChildScrollView(
                            child: Center(
                              child: Column(
                                children: List.generate(
                                  5,
                                  (index) => Padding(
                                    padding:
                                        EdgeInsets.symmetric(vertical: 1.h),
                                    child: sizedShimmer(
                                        height: 20.h, width: double.infinity),
                                  ),
                                ),
                              ),
                            ),
                          )
                        : controller.adsList.isEmpty
                            ? Center(
                                child: Text(
                                  "No Ads Found",
                                  style: TextStyle(
                                      fontSize: 14.sp,
                                      color: AppColors.kBluedarkShade),
                                ),
                              )
                            : ListView.builder(
                                controller: controller.scrollController,
                                shrinkWrap: true,
                                itemCount: controller.adsList.length +
                                    (controller.pagiNationLoading.value
                                        ? 1
                                        : 0),
                                itemBuilder: (context, index) {
                                  if (index == controller.adsList.length) {
                                    // Show shimmer only when paginated data is loading
                                    return controller.pagiNationLoading.value
                                        ? Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Center(
                                                child:
                                                    CircularProgressIndicator()),
                                          )
                                        : SizedBox.shrink();
                                  }
                                  return Padding(
                                    padding: EdgeInsets.only(bottom: 3.0.h),
                                    child: Stack(
                                      children: [
                                        controller.adsList[index].image == null
                                            ? Container(
                                                height: 25.h,
                                                decoration: BoxDecoration(
                                                  color:
                                                      AppColors.kBerkeleyBlue,
                                                  borderRadius:
                                                      BorderRadius.circular(20),
                                                ),
                                              )
                                            : CachedNetworkImage(
                                                imageUrl: controller
                                                        .adsList[index].image ??
                                                    "",
                                                imageBuilder:
                                                    (context, imageProvider) =>
                                                        Container(
                                                  height: 25.h,
                                                  decoration: BoxDecoration(
                                                    color:
                                                        AppColors.kBerkeleyBlue,
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            20),
                                                    image: DecorationImage(
                                                      image: imageProvider,
                                                      fit: BoxFit.contain,
                                                    ),
                                                  ),
                                                ),
                                                placeholder: (context, url) =>
                                                    Center(
                                                  child:
                                                      CircularProgressIndicator(
                                                    color: Colors.white,
                                                  ),
                                                ),
                                                cacheKey: controller
                                                    .adsList[index].image,
                                                errorWidget:
                                                    (context, url, error) =>
                                                        Icon(
                                                  Icons.error,
                                                  color: Colors.white,
                                                ),
                                              ),
                                        Positioned(
                                          left: 2.h,
                                          bottom: 2.h,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                capitalizeFirstLetter(controller
                                                        .adsList[index].name ??
                                                    ""),
                                                style: TextStyle(
                                                  color: Colors.white,
                                                  fontSize: 15.sp,
                                                ),
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              controller.adsList[index].tags ==
                                                      null
                                                  ? SizedBox()
                                                  : Wrap(
                                                      spacing: 1.w,
                                                      runSpacing: 1.h,
                                                      children: controller
                                                          .adsList[index].tags!
                                                          .map((element) {
                                                        return TagsContainer(
                                                          tag: element,
                                                        );
                                                      }).toList(),
                                                    ),
                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                  ),
                );
              }),

              /* AdsContainer(),
              SizedBox(
                height: 2.h,
              ),
              AdsContainer(),
              SizedBox(
                height: 2.h,
              ),
              AdsContainer(),
              SizedBox(
                height: 2.h,
              ),
              AdsContainer(),*/
              //Spacer(),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.kPrimaryColor),
                    onPressed: () {
                      controller.clearData();
                      Get.toNamed(AddAdsScreen.routeName);
                    },
                    child: Text(
                      'Add Ads',
                      style: TextStyle(color: Colors.white),
                    )),
              )
              // Row(
              //   children: [
              //     Spacer(),
              //     ElevatedButton(
              //         style: ElevatedButton.styleFrom(
              //             backgroundColor: AppColors.kPrimaryColor),
              //         onPressed: () {
              //           Get.toNamed(AddAdsScreen.routeName);
              //         },
              //         child: Text(
              //           'Add Ads',
              //           style: TextStyle(color: Colors.white),
              //         ))
              //   ],
              // ),
              // Myadscontainer(),
              // SizedBox(
              //   height: 2.h,
              // ),
              // Myadscontainer(),
              // SizedBox(
              //   height: 2.h,
              // ),
              // Myadscontainer(),
              // SizedBox(
              //   height: 2.h,
              // ),
              // Myadscontainer(),
            ],
          ),
        ),
      ),
    );
  }
}
