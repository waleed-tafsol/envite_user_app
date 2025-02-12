import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:event_planner_light/constants/StyleConstants.dart';
import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/controllers/AddEventController.dart';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/controllers/HomeScreenController.dart';
import 'package:event_planner_light/controllers/MyEventsController.dart';
import 'package:event_planner_light/model/CatagoryModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../constants/colors_constants.dart';
import '../../../../../utills/ConvertDateTime.dart';
import '../../../../../utills/enums.dart';
import '../../../../widgets/BottomModelSheet.dart';
import '../../../../widgets/VideoWidget.dart';

class AddEventsScreens extends GetView<AddEventController> {
  AddEventsScreens({super.key});

  static const routeName = "AddEventsScreens";
  final formKey = GlobalKey<FormState>();
  final MyEventsController myEventsController = Get.find();
  final HomeScreenController homeScreenController = Get.find();

  final FocusNode avenueFocusNode = FocusNode();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.isAddPastEvents.value
            ? 'Add Past Events'
            : 'Add Your event'),
      ),
      body: GestureDetector(
        onTap: () => FocusScope.of(context).unfocus(),
        child: SingleChildScrollView(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
              child: Obx(() {
                return controller.isloading.value
                    ? Center(
                        child: CircularProgressIndicator(),
                      )
                    : Form(
                        key: formKey,
                        child: Column(
                          children: [
                            Obx(() {
                              return controller.pickedImages.isEmpty
                                  ? InkWell(
                                      onTap: () {
                                        controller.pickImage();
                                      },
                                      child: DottedBorder(
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
                                                "Upload Venue image",
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color:
                                                      AppColors.kBluedarkShade,
                                                  decoration:
                                                      TextDecoration.underline,
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
                                        height: 20.h,
                                        fit: BoxFit.contain,
                                        width: double.infinity,
                                      ));
                            }),
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
                            Obx(
                              () {
                                return Column(
                                  children: List.generate(
                                      controller.emailController.length,
                                      (index) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.h),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: controller
                                                  .emailController[index],
                                              validator: (value) {
                                                if (value!.isNotEmpty) {
                                                  if (value.isEmail) {
                                                    return null;
                                                  }
                                                  return "Please enter correct Email";
                                                }
                                              },
                                              keyboardType:
                                                  TextInputType.emailAddress,
                                              decoration: InputDecoration(
                                                hintText: "Other Email",
                                                prefixIcon: Icon(
                                                    Icons.person_2_outlined),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                10, // Replace with your desired spacing
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              index == 0
                                                  ? controller.emailController
                                                      .add(
                                                          TextEditingController())
                                                  : controller.emailController
                                                      .removeAt(index);
                                            },
                                            icon: Icon(
                                              index == 0
                                                  ? Icons.add
                                                  : Icons.remove,
                                              color: AppColors.kIconColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),

                            Obx(
                              () {
                                return Column(
                                  children: List.generate(
                                      controller.socialLinkController.length,
                                      (index) {
                                    return Padding(
                                      padding:
                                          EdgeInsets.symmetric(vertical: 1.h),
                                      child: Row(
                                        children: [
                                          Expanded(
                                            child: TextFormField(
                                              controller: controller
                                                  .socialLinkController[index],
                                              validator: (value) {
                                                if (value!.isNotEmpty) {
                                                  if (value.isURL) {
                                                    return null;
                                                  }
                                                  return "Please enter correct Social Links";
                                                }
                                              },
                                              // keyboardType: TextInputType.name,
                                              decoration: InputDecoration(
                                                hintText: "Social Links",
                                                prefixIcon: Icon(Icons.link),
                                              ),
                                            ),
                                          ),
                                          SizedBox(
                                            width:
                                                10, // Replace with your desired spacing
                                          ),
                                          IconButton(
                                            onPressed: () {
                                              index == 0
                                                  ? controller
                                                      .socialLinkController
                                                      .add(
                                                          TextEditingController())
                                                  : controller
                                                      .socialLinkController
                                                      .removeAt(index);
                                            },
                                            icon: Icon(
                                              index == 0
                                                  ? Icons.add
                                                  : Icons.remove,
                                              color: AppColors.kIconColor,
                                            ),
                                          ),
                                        ],
                                      ),
                                    );
                                  }),
                                );
                              },
                            ),

                            // ListView.builder(
                            //     shrinkWrap: true,
                            //     itemBuilder: (context, index) {
                            //       return Row(
                            //         children: [
                            //           Expanded(
                            //             child: TextFormField(
                            //                 controller: controller.nameController,
                            //                 validator: (value) {
                            //                   if (value!.isEmpty) {
                            //                     return "Please enter Event Name";
                            //                   }
                            //                   return null;
                            //                 },
                            //                 keyboardType: TextInputType.name,
                            //                 decoration: InputDecoration(
                            //                   hintText: "Other Email",
                            //                   prefixIcon:
                            //                       Icon(Icons.person_2_outlined),
                            //                 )),
                            //           ),
                            //           SizedBox(
                            //             width: 1.w,
                            //           ),
                            //           IconButton(
                            //               onPressed: () {},
                            //               icon: Icon(
                            //                 Icons.add,
                            //                 color: AppColors.kIconColor,
                            //               ))
                            //         ],
                            //       );
                            //     }),
                            SizedBox(
                              height: 2.h,
                            ),
                            Obx(() {
                              return Column(
                                children: [
                                  // TextField for typing the place name
                                  TextFormField(
                                    controller:
                                        controller.avenuePlaceController,
                                    decoration: InputDecoration(
                                      prefixIcon:
                                          Icon(Icons.location_on_outlined),
                                      suffix: Obx(() {
                                        return controller
                                                .isPredictionsLoading.value
                                            ? SizedBox(
                                                height: 4.w,
                                                width: 4.w,
                                                child:
                                                    CircularProgressIndicator(
                                                  color:
                                                      AppColors.kBerkeleyBlue,
                                                  strokeWidth: 2,
                                                ))
                                            : InkWell(
                                                onTap: () {
                                                  controller
                                                      .avenuePlaceController
                                                      .clear();
                                                  controller.placesList.value =
                                                      [];
                                                },
                                                child: Icon(
                                                  Icons.clear,
                                                  size: 4.w,
                                                  color: Colors.redAccent,
                                                ));
                                      }),
                                      hintText: "venue Location",
                                    ),
                                    onChanged: (location) {
                                      controller.getGooglePlaces(
                                          value: location);
                                    },
                                  ),
                                  SizedBox(height: 10),
                                  ListView.builder(
                                    shrinkWrap: true,
                                    itemCount: controller.placesList.length,
                                    itemBuilder: (context, index) {
                                      final place =
                                          controller.placesList[index];
                                      return GestureDetector(
                                        onTap: () =>
                                            controller.onPlaceSelected(place),
                                        child: Container(
                                          margin: EdgeInsets.only(bottom: 1.h),
                                          padding: EdgeInsets.all(10),
                                          decoration: BoxDecoration(
                                            color: AppColors.kTextfieldColor,
                                            borderRadius:
                                                BorderRadius.circular(10),
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
                                                  child: Text(place.fullText,
                                                      style: TextStyle(
                                                          color:
                                                              Colors.black))),
                                            ],
                                          ),
                                        ),
                                      );

                                      // ListTile(
                                      //   tileColor: AppColors.kTextfieldColor,

                                      //   leading: Icon(Icons.location_on_outlined,color: AppColors.kIconColor,),
                                      //   title: Text(place.fullText ?? '',style: TextStyle(color: Colors.black),),
                                      //   onTap: () =>
                                      //       controller.onPlaceSelected(place),
                                      // );
                                    },
                                  ),
                                ],
                              );
                            }),
                            SizedBox(
                              height: 2.h,
                            ),
                            TextFormField(
                                controller: controller.avnueController,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please enter the Venue name";
                                  }
                                  return null;
                                },
                                keyboardType: TextInputType.streetAddress,
                                decoration: InputDecoration(
                                  hintText: "Venue name",
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
                                      // Dynamically determine the date range
                                      DateTime now = DateTime.now();
                                      bool isPastEvent =
                                          controller.isAddPastEvents.value;

                                      // Show DatePicker to pick a date
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate: controller
                                                .selectedStartDate.value ??
                                            now,
                                        firstDate: isPastEvent
                                            ? DateTime(
                                                2000) // Earliest date allowed for past events
                                            : now, // Current date for future events
                                        lastDate: isPastEvent
                                            ? now // Prevent selecting future dates for past events
                                            : now.add(Duration(
                                                days: 365 *
                                                    10)), // 10 years ahead for future events
                                      );

                                      if (pickedDate != null) {
                                        // Handle the selected date
                                        controller.setStartDate(pickedDate);
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.w, horizontal: 1.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.kTextfieldColor,
                                      ),
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
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Start Date:',
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.black,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                Text(
                                                  controller.selectedStartDate
                                                              .value ==
                                                          null
                                                      ? "Select Date"
                                                      : dateFormater(controller
                                                          .selectedStartDate
                                                          .value!),
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: Colors.black,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
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
                                      // Dynamically determine the date range
                                      DateTime now = DateTime.now();
                                      bool isPastEvent =
                                          controller.isAddPastEvents.value;

                                      // Show DatePicker to pick a date
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate:
                                            controller.selectedEndDate.value ??
                                                now,
                                        firstDate:
                                            isPastEvent ? DateTime(2000) : now,
                                        lastDate: isPastEvent
                                            ? now
                                            : now.add(Duration(days: 365 * 10)),
                                      );

                                      if (pickedDate != null) {
                                        // Handle the selected date
                                        controller.setEndDate(pickedDate);
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.w, horizontal: 1.h),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: AppColors.kTextfieldColor,
                                      ),
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
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'End Date:',
                                                  style: TextStyle(
                                                    fontSize: 12.sp,
                                                    color: Colors.black,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                                Text(
                                                  controller.selectedEndDate
                                                              .value ==
                                                          null
                                                      ? "Select Date"
                                                      : dateFormater(controller
                                                          .selectedEndDate
                                                          .value!),
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: Colors.black,
                                                    overflow:
                                                        TextOverflow.ellipsis,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                  ),
                                                ),
                                              ],
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
                            Row(
                              mainAxisSize: MainAxisSize.min,
                              children: [
                                Expanded(
                                  child: GestureDetector(
                                    onTap: () async {
                                      TimeOfDay? pickedTime =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      );
                                      if (pickedTime != null) {
                                        TimeOfDay finalDateTime = TimeOfDay(
                                          hour: pickedTime.hour,
                                          minute: pickedTime.minute,
                                        );
                                        controller.setStartTime(
                                            finalDateTime.format(context));
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.w, horizontal: 1.h),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.kTextfieldColor),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.watch_later_outlined,
                                            color: AppColors.kIconColor,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'Start Time:',
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.black,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                                Text(
                                                  controller.selectedStartTime
                                                          .value ??
                                                      "Select Time",
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      color: Colors.black,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ],
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
                                      TimeOfDay? pickedTime =
                                          await showTimePicker(
                                        context: context,
                                        initialTime: TimeOfDay.now(),
                                      );

                                      if (pickedTime != null) {
                                        // Combine date and time
                                        TimeOfDay finalDateTime = TimeOfDay(
                                          hour: pickedTime.hour,
                                          minute: pickedTime.minute,
                                        );

                                        controller.setEndTime(
                                            finalDateTime.format(context));
                                      }
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 4.w, horizontal: 1.h),
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: AppColors.kTextfieldColor),
                                      child: Row(
                                        children: [
                                          Icon(
                                            Icons.watch_later_outlined,
                                            color: AppColors.kIconColor,
                                          ),
                                          SizedBox(
                                            width: 1.w,
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  'End Time:',
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.black,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                                Text(
                                                  controller.selectedEndTime
                                                          .value ??
                                                      "Select Time",
                                                  style: TextStyle(
                                                      fontSize: 15.sp,
                                                      color: Colors.black,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      fontWeight:
                                                          FontWeight.normal),
                                                ),
                                              ],
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
                                constraints: BoxConstraints(maxHeight: 50.h),
                                icon: const Icon(
                                  Icons.arrow_downward_rounded,
                                  color: AppColors.kPrimaryColor,
                                ),
                                onSelected: (String value) {
                                  controller.selectedCategory.value =
                                      homeScreenController.categories
                                          .firstWhere((element) {
                                    return element.name?.en == value;
                                  });
                                },
                                itemBuilder: (BuildContext context) {
                                  return homeScreenController.categories
                                      .map((CategoryModel choice) {
                                    return PopupMenuItem<String>(
                                      textStyle:
                                          TextConstants.bodySmall_black_normal(
                                              context),
                                      value: choice.name?.en ?? "",
                                      child: Column(
                                        children: [
                                          Container(
                                            decoration: BoxDecoration(
                                                color:
                                                    AppColors.kTextfieldColor,
                                                borderRadius:
                                                    BorderRadius.circular(10)),
                                            width: double.infinity,
                                            padding: EdgeInsets.symmetric(
                                                vertical: 1.h),
                                            child: Center(
                                              child: Column(
                                                children: [
                                                  Text(
                                                    choice.name?.en ?? "",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                            color: AppColors
                                                                .kTextBlack),
                                                  ),
                                                  Text(
                                                    choice.name?.ar ?? "",
                                                    style: Theme.of(context)
                                                        .textTheme
                                                        .bodyMedium!
                                                        .copyWith(
                                                            color: AppColors
                                                                .kTextBlack),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                          Divider(
                                            color: AppColors.kTextfieldColor,
                                          ),
                                        ],
                                      ),
                                    );
                                  }).toList();
                                },
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            authService.me.value!.role?.first ==
                                    UserRoles.user.text
                                ? ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    tileColor: AppColors.kTextfieldColor,
                                    leading: const Icon(
                                      Icons.group_work_outlined,
                                      color: AppColors.kPrimaryColor,
                                    ),
                                    title: Text(
                                      "Private",
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyMedium!
                                          .copyWith(
                                              color: AppColors.kTextBlack),
                                    ),
                                  )
                                : ListTile(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
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
                                            .copyWith(
                                                color: AppColors.kTextBlack),
                                      );
                                    }),
                                    trailing: PopupMenuButton<String>(
                                      icon: const Icon(
                                        Icons.arrow_downward_rounded,
                                        color: AppColors.kPrimaryColor,
                                      ),
                                      onSelected: (String value) {
                                        controller
                                            .verifyUserPackageAndSetEventType(
                                                value, context);
                                      },
                                      itemBuilder: (BuildContext context) {
                                        return controller.options
                                            .map((String choice) {
                                          return PopupMenuItem<String>(
                                            value: choice,
                                            child: Column(
                                              children: [
                                                Container(
                                                  decoration: BoxDecoration(
                                                      color: AppColors
                                                          .kTextfieldColor,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  width: double.infinity,
                                                  padding: EdgeInsets.symmetric(
                                                      vertical: 1.h),
                                                  child: Center(
                                                    child: Text(
                                                      choice,
                                                      style: Theme.of(context)
                                                          .textTheme
                                                          .bodyMedium!
                                                          .copyWith(
                                                              color: AppColors
                                                                  .kTextBlack),
                                                    ),
                                                  ),
                                                ),
                                                Divider(
                                                  color:
                                                      AppColors.kTextfieldColor,
                                                ),
                                              ],
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                                    color: AppColors
                                                        .kBluedarkShade,
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
                                      : Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image.file(
                                                controller.pickedImages[0],
                                                fit: BoxFit.contain,
                                                height: 25.w,
                                                width: 25.w,
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              right: 0,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                child: IconButton(
                                                    onPressed: () {
                                                      controller.pickedImages
                                                          .removeAt(0);
                                                    },
                                                    icon: Icon(Icons.delete)),
                                              ),
                                            ),
                                          ],
                                        ),
                                  controller.pickedImages.length < 2
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
                                                    color: AppColors
                                                        .kBluedarkShade,
                                                  ),
                                                  Text(
                                                    "Event Image 2",
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
                                      : Stack(
                                          fit: StackFit.passthrough,
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image.file(
                                                controller.pickedImages[1],
                                                fit: BoxFit.contain,
                                                height: 25.w,
                                                width: 25.w,
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              right: 0,
                                              child: InkWell(
                                                onTap: () {
                                                  controller.pickedImages
                                                      .removeAt(1);
                                                },
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                  controller.pickedImages.length < 3
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
                                                    color: AppColors
                                                        .kBluedarkShade,
                                                  ),
                                                  Text(
                                                    "Event Image 3",
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
                                      : Stack(
                                          children: [
                                            ClipRRect(
                                              borderRadius:
                                                  BorderRadius.circular(5),
                                              child: Image.file(
                                                controller.pickedImages[2],
                                                fit: BoxFit.contain,
                                                height: 25.w,
                                                width: 25.w,
                                              ),
                                            ),
                                            Positioned(
                                              top: 0,
                                              right: 0,
                                              child: InkWell(
                                                onTap: () {
                                                  controller.pickedImages
                                                      .removeAt(2);
                                                },
                                                child: CircleAvatar(
                                                  backgroundColor: Colors.white,
                                                  child: Icon(
                                                    Icons.delete,
                                                    color: Colors.red,
                                                  ),
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                ],
                              );
                            }),
                            SizedBox(
                              height: 2.h,
                            ),
                            Obx(() {
                              return controller.pickedVideo.isEmpty
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
                                                    Icons
                                                        .movie_creation_outlined,
                                                    color: AppColors
                                                        .kBluedarkShade,
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
                                            controller.pickedVideo[0].path);
                                        showVideoDialog(context);
                                      },
                                      child: Stack(
                                        children: [
                                          FutureBuilder<String>(
                                            future: controller.getThumbnail(
                                                controller.pickedVideo[0].path),
                                            builder: (context, snapshot) {
                                              if (snapshot.connectionState ==
                                                  ConnectionState.done) {
                                                return Container(
                                                  height: 20.h,
                                                  width: double.infinity,
                                                  decoration: BoxDecoration(
                                                    color: AppColors
                                                        .kBlueMediumShade,
                                                    image: DecorationImage(
                                                      image: FileImage(File(
                                                          snapshot.data ?? "")),
                                                      fit: BoxFit.contain,
                                                    ),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            5),
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
                                                return CircularProgressIndicator();
                                              }
                                            },
                                          ),
                                          Positioned(
                                            top: 0,
                                            right: 0,
                                            child: InkWell(
                                              onTap: () {
                                                controller.pickedVideo.clear();
                                              },
                                              child: CircleAvatar(
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                ),
                                                backgroundColor: Colors.red,
                                              ),
                                            ),
                                          ),
                                        ],
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
                                  onPressed: () async {
                                    if (controller.validateEventForm(formKey)) {
                                      await controller.addEvent();
                                      myEventsController.myEventsScreenType
                                          .value = Events.myEvents.text;
                                      await myEventsController
                                          .getMyPaginatedEvents(
                                              callFirstTime: true);
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
                      );
              }),
            ),
          ),
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
          child: VideoPlayerScreen(videoPath: controller.pickedVideo[0].path),
        );
      },
    );
  }
}
