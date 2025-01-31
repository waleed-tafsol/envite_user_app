import 'dart:io';
import 'package:dotted_border/dotted_border.dart';
import 'package:event_planner_light/constants/StyleConstants.dart';
import 'package:event_planner_light/view/widgets/network_video_player_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_places_flutter/google_places_flutter.dart';
import 'package:google_places_flutter/model/place_type.dart';
import 'package:google_places_flutter/model/prediction.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../constants/ApiConstant.dart';
import '../../../../../constants/TextConstant.dart';
import '../../../../../constants/colors_constants.dart';
import '../../../../../controllers/Auth_services.dart';
import '../../../../../controllers/MyEventsController.dart';
import '../../../../../controllers/edit_event_detail_controller.dart';
import '../../../../../model/CatagoryModel.dart';
import '../../../../../utills/ConvertDateTime.dart';
import '../../../../../utills/CustomSnackbar.dart';
import '../../../../widgets/BottomModelSheet.dart';
import '../../../../widgets/VideoWidget.dart';

class EditEventsDetailScreen extends GetView<EditEventDetailController> {
  EditEventsDetailScreen({super.key});
  static const routeName = "EditEventsDetailScreen";
  final formKey = GlobalKey<FormState>();
  final MyEventsController myEventsController = Get.find();
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
                            InkWell(
                              onTap: () {
                                controller.pickImage();
                              },
                              child: Obx(() {
                                if (controller.pickedImages.isEmpty &&
                                    controller.existingImages.isEmpty) {
                                  return DottedBorder(
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
                                  );
                                } else if (controller.pickedImages.isEmpty &&
                                    controller.existingImages.isNotEmpty) {
                                  return ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.network(
                                        controller.existingImages[0],
                                        height: 20.h,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ));
                                } else {
                                  return ClipRRect(
                                      borderRadius: BorderRadius.circular(5),
                                      child: Image.file(
                                        controller.pickedImages[0],
                                        height: 20.h,
                                        fit: BoxFit.cover,
                                        width: double.infinity,
                                      ));
                                }
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
                                              keyboardType: TextInputType.name,
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
                                              keyboardType: TextInputType.name,
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
                            GooglePlaceAutoCompleteTextField(
                              textEditingController:
                                  controller.avenuePlaceController,
                              focusNode: avenueFocusNode,
                              googleAPIKey: ApiConstants.googleAPIKey,
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
                              getPlaceDetailWithLatLng:
                                  (Prediction prediction) {
                                controller.avenueLat = prediction.lat;
                                controller.avenueLng = prediction.lng;
                              },
                              itemClick: (Prediction prediction) {
                                String description =
                                    prediction.description ?? "";

                                controller.avenuePlaceController.text =
                                    description;

                                int cursorPosition = description.length;

                                controller.avenuePlaceController.selection =
                                    TextSelection.fromPosition(
                                  TextPosition(offset: cursorPosition),
                                );
                                avenueFocusNode.requestFocus();
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
                                              prediction.description ?? "",
                                              style: TextStyle(
                                                  color: Colors.black))),
                                    ],
                                  ),
                                );
                              },
                              seperatedBuilder: Divider(),
                              isCrossBtnShown: true,
                              containerHorizontalPadding: 2,
                              placeType: PlaceType.geocode,
                            ),
                            SizedBox(
                              height: 2.h,
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
                                      // Show DatePicker to pick a date
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                        context: context,
                                        initialDate:
                                            controller.selectedStartDate.value,
                                        firstDate:
                                            controller.selectedStartDate.value,
                                        lastDate: controller
                                            .selectedStartDate.value
                                            .add(Duration(days: 365 * 10)),
                                      );

                                      if (pickedDate != null) {
                                        /*   TimeOfDay? pickedTime =
                                            await showTimePicker(
                                          context: context,
                                          initialTime:
                                              TimeOfDay.fromDateTime(now),
                                        );*/

                                        /* if (pickedTime != null) {*/
                                        DateTime finalDateTime = DateTime(
                                          pickedDate.year,
                                          pickedDate.month,
                                          pickedDate
                                              .day, /*
                                            pickedTime.hour,
                                            pickedTime.minute,*/
                                        );

                                        controller.setStartDate(finalDateTime);
                                        /* }*/
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
                                                          FontWeight.normal),
                                                ),
                                                Text(
                                                  dateFormater(controller
                                                      .selectedStartDate.value),
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
                                      //DateTime now = DateTime.now();
                                      // DateTime lastDate =
                                      //     now.add(Duration(days: 365 * 10));

                                      // Show DatePicker to pick a date
                                      DateTime? pickedDate =
                                          await showDatePicker(
                                              context: context,
                                              initialDate: controller
                                                  .selectedEndDate.value,
                                              firstDate: controller
                                                  .selectedEndDate.value,
                                              lastDate: controller
                                                  .selectedEndDate.value
                                                  .add(
                                                Duration(days: 365 * 10),
                                              ));

                                      if (pickedDate != null) {
                                        /*  // Show TimePicker to pick a time
                                        TimeOfDay? pickedTime =
                                            await showTimePicker(
                                          context: context,
                                          initialTime:
                                              TimeOfDay.fromDateTime(now),
                                        );*/

                                        /*if (pickedTime != null) {*/
                                        // Combine date and time
                                        DateTime finalDateTime = DateTime(
                                          pickedDate.year,
                                          pickedDate.month,
                                          pickedDate
                                              .day, /*
                                            pickedTime.hour,
                                            pickedTime.minute,*/
                                        );

                                        controller.setEndDate(finalDateTime);
                                        /*
                                        }
        */
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
                                                          FontWeight.normal),
                                                ),
                                                Text(
                                                  dateFormater(controller
                                                      .selectedEndDate.value),
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
                                                  /*timeFormater(*/
                                                  controller.selectedStartTime
                                                      .value /*)*/,
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
                                                  controller
                                                      .selectedEndTime.value
                                                  /* timeFormater(controller
                                                      .selectedEndTime.value)*/
                                                  ,
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
                                  controller.selectedCategory.value = controller
                                      .homeScreenController.categories
                                      .firstWhere((element) {
                                    return element.name?.en == value;
                                  });
                                },
                                itemBuilder: (BuildContext context) {
                                  return controller
                                      .homeScreenController.categories
                                      .map((CategoryModel choice) {
                                    return PopupMenuItem<String>(
                                      textStyle:
                                          TextConstants.bodySmall_black_normal(
                                              context),
                                      value: choice.name?.en ?? "",
                                      child: Column(
                                        children: [
                                          Text(
                                            choice.name?.en ?? "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                color:
                                                AppColors.kTextBlack),
                                          ),
                                          Text(
                                            choice.name?.ar ?? "",
                                            style: Theme.of(context)
                                                .textTheme
                                                .bodyMedium!
                                                .copyWith(
                                                color:
                                                AppColors.kTextBlack),
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
                                  return controller.options
                                      .map((String choice) {
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
                              // Combine existing and picked images into a single list
                              final allImages = [
                                ...controller.pickedImages
                                    .map((e) => {'type': 'picked', 'value': e}),
                                ...controller.existingImages.map(
                                    (e) => {'type': 'existing', 'value': e}),
                              ];

                              return Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: List.generate(3, (index) {
                                  if (index < allImages.length) {
                                    final image = allImages[index];

                                    return Stack(
                                      children: [
                                        ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(5),
                                          child: image['type'] == 'picked'
                                              ? Image.file(
                                                  image['value'] as File,
                                                  fit: BoxFit.cover,
                                                  height: 25.w,
                                                  width: 25.w,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Icon(Icons.error),
                                                )
                                              : Image.network(
                                                  image['value'] as String,
                                                  fit: BoxFit.cover,
                                                  height: 25.w,
                                                  width: 25.w,
                                                  errorBuilder: (context, error,
                                                          stackTrace) =>
                                                      Icon(Icons.error),
                                                ),
                                        ),
                                        Positioned(
                                          top: 0,
                                          right: 0,
                                          child: InkWell(
                                            onTap: () {
                                              if (image['type'] == 'picked') {
                                                controller.pickedImages
                                                    .remove(image['value']);
                                              } else {
                                                controller.existingImages
                                                    .remove(image['value']);
                                              }
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
                                    );
                                  } else {
                                    // Show add image button
                                    return InkWell(
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
                                                color: AppColors.kBluedarkShade,
                                              ),
                                              Text(
                                                "Event Image ${index + 1}",
                                                style: TextStyle(
                                                  fontSize: 14.sp,
                                                  color:
                                                      AppColors.kBluedarkShade,
                                                  decoration:
                                                      TextDecoration.underline,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    );
                                  }
                                }),
                              );
                            }),

                            SizedBox(
                              height: 2.h,
                            ),
                            Obx(() {
                              return controller.pickedVideo.isEmpty &&
                                      controller.existingVideo.isEmpty
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
                                  : controller.pickedVideo.isNotEmpty
                                      ? Stack(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                controller.playVideo(controller
                                                    .pickedVideo[0].path);
                                                showVideoDialog(context);
                                              },
                                              child: FutureBuilder<String>(
                                                future: controller.getThumbnail(
                                                    controller
                                                        .pickedVideo[0].path),
                                                builder: (context, snapshot) {
                                                  if (snapshot
                                                          .connectionState ==
                                                      ConnectionState.done) {
                                                    return Container(
                                                      height: 12.h,
                                                      width: double.infinity,
                                                      decoration: BoxDecoration(
                                                        image: DecorationImage(
                                                          image: FileImage(File(
                                                              snapshot.data ??
                                                                  "")),
                                                          fit: BoxFit.cover,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                      ),
                                                      child: Center(
                                                        child: Icon(
                                                          Icons
                                                              .play_circle_fill,
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
                                            ),
                                            Positioned(
                                              top: 0,
                                              right: 0,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                child: IconButton(
                                                    onPressed: () {
                                                      controller.pickedVideo[0]
                                                          .deleteSync();
                                                    },
                                                    icon: Icon(Icons.delete)),
                                              ),
                                            ),
                                          ],
                                        )
                                      : Stack(
                                          children: [
                                            NetworkVideoPlayerWidget(
                                              videoUrl: controller
                                                  .existingVideo.value,
                                            ),
                                            Positioned(
                                              top: 0,
                                              right: 0,
                                              child: CircleAvatar(
                                                backgroundColor: Colors.white,
                                                child: IconButton(
                                                    onPressed: () {
                                                      controller.existingVideo
                                                          .value = "";
                                                    },
                                                    icon: Icon(Icons.delete)),
                                              ),
                                            ),
                                          ],
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
                                    if (formKey.currentState!.validate()) {
                                      if (controller.selectedCategory.value !=
                                          null) {
                                        if (controller.selectedOption.value !=
                                            null) {
                                          await controller.addEvent();
                                          await myEventsController
                                              .getMyPaginatedEvents(
                                                  callFirstTime: true);
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
                                      ? 'Update past event'
                                      : 'Update event')),
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
