import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:event_planner_light/constants/StyleConstants.dart';
import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/controllers/AddEventController.dart';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/model/CatagoryModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../constants/colors_constants.dart';
import '../../../../../constants/constants.dart';
import '../../../../../utills/ConvertDateTime.dart';
import '../../../../../utills/CustomSnackbar.dart';
import '../../../../widgets/BottomModelSheet.dart';
import '../../../../widgets/VideoWidget.dart';

class AddEventsScreens extends GetView<AddEventController> {
  AddEventsScreens({super.key});

  static const routeName = "AddEventsScreens";
  final formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.isAddPastEvents.value
            ? 'Add Past Events'
            : 'Add Your event'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
          child: Obx(() {
            return controller.isloading.value
                ? SizedBox(
              height: double.infinity,
                  child: Center(
                      child: CircularProgressIndicator(),
                    ),
                )
                : Form(
                    key: formKey,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          InkWell(
                            onTap: () {
                              controller.pickImage();
                            },
                            child: Obx(() {
                              return controller.pickedImages.isEmpty
                                  ? DottedBorder(
                                      color: AppColors.kBluedarkShade,
                                      dashPattern: [5],
                                      borderType: BorderType.RRect,
                                      radius: Radius.circular(5),
                                      child: SizedBox(
                                        height: 20.h,
                                        width: double.infinity,
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Icon(
                                              size: 5.h,
                                              Icons.photo_library_outlined,
                                              color: AppColors.kBluedarkShade,
                                            ),
                                            Text(
                                              "Upload avenue image",
                                              style: TextStyle(
                                                fontSize: 14.sp,
                                                color: AppColors.kBluedarkShade,
                                                decoration:
                                                    TextDecoration.underline,
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    )
                                  : ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.file(
                                        controller.pickedImages[0],
                                        height: 20.h,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ));
                            }),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextFormField(
                              controller: controller.nameController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter Event Name";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.name,
                              decoration: InputDecoration(
                                hintText: "Event Name",
                                prefixIcon: Icon(Icons.person_2_outlined),
                              )),
                          SizedBox(
                            height: 2.h,
                          ),
                          GooglePlaceAutoCompleteTextField(
                            textEditingController:
                                controller.googlemapfieldController,
                            googleAPIKey: googleAPIKey,
                            inputDecoration: InputDecoration(
                                prefixIcon: Icon(Icons.location_on_outlined),
                                hintText: "Avenue Location",
                                fillColor: Colors.transparent),
                            boxDecoration: BoxDecoration(
                              color: AppColors.kTextfieldColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            debounceTime: 800,
                            isLatLngRequired: true,
                            getPlaceDetailWithLatLng: (Prediction prediction) {
                              controller.lat = prediction.lat;
                              controller.lng = prediction.lng;
                            },
                            itemClick: (Prediction prediction) {
                              String description = prediction.description ?? "";

                              controller.googlemapfieldController.text =
                                  description;

                              int cursorPosition = description.length;

                              controller.googlemapfieldController.selection =
                                  TextSelection.fromPosition(
                                TextPosition(offset: cursorPosition),
                              );
                            },
                            itemBuilder:
                                (context, index, Prediction prediction) {
                              return Container(
                                padding: EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  color: AppColors.kTextfieldColor,
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                child: Row(
                                  children: [
                                    Icon(
                                      Icons.location_on,
                                      color: AppColors.kIconColor,
                                    ),
                                    SizedBox(
                                      width: 7,
                                    ),
                                    Expanded(
                                        child: Text(
                                            "${prediction.description ?? ""}",
                                            style: TextStyle(
                                                color: Colors.black))),
                                  ],
                                ),
                              );
                            },
                            seperatedBuilder: Divider(),
                            isCrossBtnShown: true,
                            containerHorizontalPadding: 10,
                            placeType: PlaceType.geocode,
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Visibility(
                            visible: !controller.isAddPastEvents.value,
                            child: Column(
                              children: [
                                TextFormField(
                                    controller:
                                        controller.socialLink1Controller,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please enter a Facebook link to your event";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.streetAddress,
                                    decoration: InputDecoration(
                                      hintText: "Facebook link",
                                      prefixIcon: Icon(Icons.link),
                                    )),
                                SizedBox(
                                  height: 2.h,
                                ),
                                TextFormField(
                                    controller:
                                        controller.socialLink2Controller,
                                    // validator: (value) {
                                    //   if (value!.isEmpty) {
                                    //     return "Please enter a Social link to your event";
                                    //   }
                                    //   return null;
                                    // },
                                    keyboardType: TextInputType.streetAddress,
                                    decoration: InputDecoration(
                                      hintText: "Instagram link",
                                      prefixIcon: Icon(Icons.link),
                                    )),
                                SizedBox(
                                  height: 2.h,
                                ),
                                TextFormField(
                                    controller:
                                        controller.socialLink3Controller,
                                    keyboardType: TextInputType.streetAddress,
                                    decoration: InputDecoration(
                                      hintText: "X link",
                                      prefixIcon: Icon(Icons.link),
                                    )),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
                            ),
                          ),
                          TextFormField(
                              controller: controller.avnueController,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter the Avenue name";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.streetAddress,
                              decoration: InputDecoration(
                                hintText: "Avenue name",
                                prefixIcon: Icon(Icons.houseboat_outlined),
                              )),
                          SizedBox(
                            height: 2.h,
                          ),
                          TextFormField(
                              controller: controller.descriptionController,
                              maxLines: 5,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter the Description";
                                }
                                return null;
                              },
                              keyboardType: TextInputType.multiline,
                              decoration: InputDecoration(
                                hintText: "Description",
                                // prefixIcon: Icon(Icons.description_outlined),
                              )),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    DateTime now = DateTime.now();
                                    DateTime lastDate =
                                        now.add(Duration(days: 365 * 10));

                                    // Show DatePicker to pick a date
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: now,
                                      firstDate: now,
                                      lastDate: lastDate,
                                    );

                                    if (pickedDate != null) {
                                      TimeOfDay? pickedTime =
                                          await showTimePicker(
                                        context: context,
                                        initialTime:
                                            TimeOfDay.fromDateTime(now),
                                      );

                                      if (pickedTime != null) {
                                        DateTime finalDateTime = DateTime(
                                          pickedDate.year,
                                          pickedDate.month,
                                          pickedDate.day,
                                          pickedTime.hour,
                                          pickedTime.minute,
                                        );

                                        controller.setStartDate(finalDateTime);
                                      }
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4.w, horizontal: 1.h),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.kTextfieldColor),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.event,
                                          color: AppColors.kIconColor,
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            formatISOToCustom(controller
                                                .selectedStartDate.value
                                                .toIso8601String()),
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.black,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 2.w,
                              ),
                              Expanded(
                                child: GestureDetector(
                                  onTap: () async {
                                    DateTime now = DateTime.now();
                                    DateTime lastDate =
                                        now.add(Duration(days: 365 * 10));

                                    // Show DatePicker to pick a date
                                    DateTime? pickedDate = await showDatePicker(
                                      context: context,
                                      initialDate: now,
                                      firstDate: now,
                                      lastDate: lastDate,
                                    );

                                    if (pickedDate != null) {
                                      // Show TimePicker to pick a time
                                      TimeOfDay? pickedTime =
                                          await showTimePicker(
                                        context: context,
                                        initialTime:
                                            TimeOfDay.fromDateTime(now),
                                      );

                                      if (pickedTime != null) {
                                        // Combine date and time
                                        DateTime finalDateTime = DateTime(
                                          pickedDate.year,
                                          pickedDate.month,
                                          pickedDate.day,
                                          pickedTime.hour,
                                          pickedTime.minute,
                                        );

                                        controller.setEndDate(finalDateTime);
                                      }
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 4.w, horizontal: 1.h),
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.kTextfieldColor),
                                    child: Row(
                                      children: [
                                        Icon(
                                          Icons.event,
                                          color: AppColors.kIconColor,
                                        ),
                                        SizedBox(
                                          width: 1.w,
                                        ),
                                        Expanded(
                                          child: Text(
                                            formatISOToCustom(controller
                                                .selectedEndDate.value
                                                .toIso8601String()),
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.black,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.normal),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            tileColor: AppColors.kTextfieldColor,
                            leading: const Icon(
                              Icons.group_work_outlined,
                              color: AppColors.kPrimaryColor,
                            ),
                            title: Obx(() {
                              return Text(
                                controller.selectedCategory.value?.name?.en ??
                                    "Catagory of events",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: AppColors.kTextBlack),
                              );
                            }),
                            trailing: PopupMenuButton<String>(
                              icon: const Icon(
                                Icons.arrow_downward_rounded,
                                color: AppColors.kPrimaryColor,
                              ),
                              onSelected: (String value) {
                                controller.selectedCategory.value =
                                    controller.categories.firstWhere((element) {
                                  return element.name?.en == value;
                                });
                              },
                              itemBuilder: (BuildContext context) {
                                return controller.categories
                                    .map((CatagoryModel choice) {
                                  return PopupMenuItem<String>(
                                    textStyle:
                                        TextConstants.bodySmall_black_normal(
                                            context),
                                    value: choice.name?.en ?? "",
                                    child: Text(
                                      choice.name?.en ?? "",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: AppColors.kTextBlack),
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          ListTile(
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10)),
                            tileColor: AppColors.kTextfieldColor,
                            leading: const Icon(
                              Icons.group_work_outlined,
                              color: AppColors.kPrimaryColor,
                            ),
                            title: Obx(() {
                              return Text(
                                controller.selectedOption.value ??
                                    "Type of events",
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyMedium!
                                    .copyWith(color: AppColors.kTextBlack),
                              );
                            }),
                            trailing: PopupMenuButton<String>(
                              icon: const Icon(
                                Icons.arrow_downward_rounded,
                                color: AppColors.kPrimaryColor,
                              ),
                              onSelected: (String value) {
                                if (value == "public") {
                                  final user = authService.me.value;
                                  if (user!.role!.contains("event-planner")) {
                                    if (user.subscriptions!.isEmpty) {
                                      BottomSheetManager
                                          .buySubscriptionForPublic(context);
                                    } else if (user.subscriptions!.any(
                                        (subscription) =>
                                            subscription.eventType !=
                                            "public")) {
                                      // BottomSheetManager.upgradEvent(context);
                                    } else {
                                      controller.setSelectedOption(value);
                                    }
                                  }
                                } else {
                                  controller.setSelectedOption(value);
                                }
                              },
                              itemBuilder: (BuildContext context) {
                                return controller.options.map((String choice) {
                                  return PopupMenuItem<String>(
                                    value: choice,
                                    child: Text(
                                      choice,
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: AppColors.kTextBlack),
                                    ),
                                  );
                                }).toList();
                              },
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Obx(() {
                            return Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                controller.pickedImages.isEmpty
                                    ? InkWell(
                                        onTap: () {
                                          controller.pickImage();
                                        },
                                        child: DottedBorder(
                                          color: AppColors.kBluedarkShade,
                                          dashPattern: [5],
                                          borderType: BorderType.RRect,
                                          radius: Radius.circular(5),
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0.w),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  size: 5.h,
                                                  Icons.image_outlined,
                                                  color:
                                                      AppColors.kBluedarkShade,
                                                ),
                                                Text(
                                                  "Event Image 1",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: AppColors
                                                        .kBluedarkShade,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.file(
                                          controller.pickedImages[0],
                                          fit: BoxFit.cover,
                                          height: 25.w,
                                          width: 25.w,
                                        ),
                                      ),
                                controller.pickedImages.length != 2
                                    ? InkWell(
                                        onTap: () {
                                          controller.pickImage();
                                        },
                                        child: DottedBorder(
                                          color: AppColors.kBluedarkShade,
                                          dashPattern: [5],
                                          borderType: BorderType.RRect,
                                          radius: Radius.circular(5),
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0.w),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  size: 5.h,
                                                  Icons.image_outlined,
                                                  color:
                                                      AppColors.kBluedarkShade,
                                                ),
                                                Text(
                                                  "Event Image 1",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: AppColors
                                                        .kBluedarkShade,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.file(
                                          controller.pickedImages[1],
                                          fit: BoxFit.cover,
                                          height: 25.w,
                                          width: 25.w,
                                        ),
                                      ),
                                controller.pickedImages.length != 3
                                    ? InkWell(
                                        onTap: () {
                                          controller.pickImage();
                                        },
                                        child: DottedBorder(
                                          color: AppColors.kBluedarkShade,
                                          dashPattern: [5],
                                          borderType: BorderType.RRect,
                                          radius: Radius.circular(5),
                                          child: Padding(
                                            padding: EdgeInsets.all(4.0.w),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  size: 5.h,
                                                  Icons.image_outlined,
                                                  color:
                                                      AppColors.kBluedarkShade,
                                                ),
                                                Text(
                                                  "Event Image 1",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: AppColors
                                                        .kBluedarkShade,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                )
                                              ],
                                            ),
                                          ),
                                        ),
                                      )
                                    : ClipRRect(
                                        borderRadius: BorderRadius.circular(5),
                                        child: Image.file(
                                          controller.pickedImages[2],
                                          fit: BoxFit.cover,
                                          height: 25.w,
                                          width: 25.w,
                                        ),
                                      ),
                              ],
                            );
                          }),
                          SizedBox(
                            height: 2.h,
                          ),
                          Obx(() {
                            return controller.pickedVideo.value == null
                                ? InkWell(
                                    onTap: () {
                                      controller.pickVideo();
                                    },
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: DottedBorder(
                                        color: AppColors.kBluedarkShade,
                                        dashPattern: [5],
                                        borderType: BorderType.RRect,
                                        radius: Radius.circular(5),
                                        child: Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 4.0.w),
                                          child: Center(
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Icon(
                                                  size: 5.h,
                                                  Icons.movie_creation_outlined,
                                                  color:
                                                      AppColors.kBluedarkShade,
                                                ),
                                                Text(
                                                  "Upload Event Video of max 30 MB",
                                                  style: TextStyle(
                                                    fontSize: 14.sp,
                                                    color: AppColors
                                                        .kBluedarkShade,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  )
                                : GestureDetector(
                                    onTap: () {
                                      controller.playVideo(
                                          controller.pickedVideo.value?.path ??
                                              "");
                                      showVideoDialog(context);
                                    },
                                    child: FutureBuilder<String>(
                                      future: controller.getThumbnail(
                                          controller.pickedVideo.value?.path ??
                                              ""),
                                      builder: (context, snapshot) {
                                        if (snapshot.connectionState ==
                                            ConnectionState.done) {
                                          return Container(
                                            height: 12.h,
                                            width: double.infinity,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: FileImage(
                                                    File(snapshot.data ?? "")),
                                                fit: BoxFit.cover,
                                              ),
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                            ),
                                            child: Center(
                                              child: Icon(
                                                Icons.play_circle_fill,
                                                size: 50,
                                                color: Colors.white
                                                    .withOpacity(0.7),
                                              ),
                                            ),
                                          );
                                        } else {
                                          return CircularProgressIndicator(); // Loading state
                                        }
                                      },
                                    ),
                                  );
                          }),
                          SizedBox(
                            height: 2.h,
                          ),
                          SizedBox(
                            height: 6.h,
                            width: double.infinity,
                            child: ElevatedButton(
                                style: StylesConstants
                                    .elevated_b_redBack_whiteFore,
                                onPressed: () {
                                  if (formKey.currentState!.validate()) {
                                    if (controller.selectedCategory.value !=
                                        null) {
                                      if (controller.selectedOption.value !=
                                          null) {
                                        controller.addEvent();
                                      } else {
                                        CustomSnackbar.showError("Error",
                                            "Please select the type of event");
                                      }
                                    } else {
                                      CustomSnackbar.showError("Error",
                                          "Please select the catagory of event");
                                    }
                                  }
                                },
                                child: Text(controller.isAddPastEvents.value
                                    ? 'Add past event'
                                    : 'Add the event')),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ),
                  );
          }),
        ),
      ),
    );
  }

  void showVideoDialog(BuildContext context) {
    showDialog(
      context: context,
      barrierDismissible: true,
      builder: (context) {
        return Dialog(
          backgroundColor: Colors.black,
          child: VideoPlayerScreen(
              videoPath: controller.pickedVideo.value?.path ?? ""),
        );
      },
    );
  }
}
