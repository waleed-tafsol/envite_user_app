import 'package:dotted_border/dotted_border.dart';
import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/rx_flutter/rx_obx_widget.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../controllers/AdsController.dart';
import '../../../utills/ConvertDateTime.dart';

class AddAdsScreen extends GetView<AdsController> {
  static const routeName = 'AddAdsScreen';

  const AddAdsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF9F8EF),
      appBar: AppBar(
        title: const Text('Add Ads'),
      ),
      body: Obx(() {
          return Padding(
            padding: EdgeInsets.symmetric(horizontal: 4.w),
            child: controller.isLoading.value?
            Center(child: CircularProgressIndicator()):
            Stack(
              children: [
                SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          controller.pickImage();
                        },
                        child: Obx(() {
                          return DottedBorder(
                            color: AppColors.kBluedarkShade,
                            dashPattern: [5],
                            borderType: BorderType.RRect,
                            radius: Radius.circular(5),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: controller.selectedImage.value == null
                                  ? SizedBox(
                                      height: 20.h,
                                      child: Center(
                                        child: Icon(
                                          size: 5.h,
                                          Icons.photo_library_outlined,
                                          color: AppColors.kBluedarkShade,
                                        ),
                                      ),
                                    )
                                  : Image.file(
                                      height: 20.h,
                                      width: double.infinity,
                                      fit: BoxFit.contain,
                                      controller.selectedImage.value!,
                                    ),
                            ),
                          );
                        }),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                       TextField(
                        controller: controller.titleController,
                          decoration: InputDecoration(
                        hintText: "Title",
                        // prefixIcon: Icon(Icons.email_outlined),
                      )),
                      SizedBox(
                        height: 2.h,
                      ),
                      Obx(
                        () {
                          return Column(
                            children: List.generate(controller.tagsController.length,
                                (index) {
                              return Padding(
                                padding: EdgeInsets.symmetric(vertical: 1.h),
                                child: Row(
                                  children: [
                                    Expanded(
                                      child: TextFormField(
                                        controller: controller.tagsController[index],
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return null;
                                          }
                                          for (int i = 0;
                                              i < controller.tagsController.length;
                                              i++) {
                                            if (i != index &&
                                                controller.tagsController[i].text ==
                                                    value) {
                                              return "This Link already added";
                                            }
                                          }

                                          return null; // No errors
                                        },
                                        // keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          hintText: 'Enter Tags',
                                          prefixIcon: Icon(Icons.tag),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 10, // Replace with your desired spacing
                                    ),
                                    IconButton(
                                      onPressed: () {
                                        index == 0
                                            ? controller.tagsController
                                                .add(TextEditingController())
                                            : controller.tagsController.removeAt(index);
                                      },
                                      icon: Icon(
                                        index == 0 ? Icons.add : Icons.remove,
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
                      SizedBox(
                        height: 2.h,
                      ),
                      Obx(() {
                        return Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Expanded(
                              child: GestureDetector(
                                onTap: () async {
                                  // Dynamically determine the date range
                                  DateTime now = DateTime.now().add(Duration(days:1));
                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate:
                                        controller.selectedStartDate.value ?? now,
                                    firstDate: now, // Current date for future events
                                    lastDate: now.add(Duration(
                                        days: 365 *
                                            10)), // 10 years ahead for future events
                                  );

                                  if (pickedDate != null) {
                                    // Handle the selected date
                                    controller.selectedStartDate.value = pickedDate;
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
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'Start Date:',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.black,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Text(
                                              controller.selectedStartDate.value == null
                                                  ? "Select Date"
                                                  : dateFormater(controller
                                                      .selectedStartDate.value!),
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.black,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.normal,
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
                                  DateTime now = DateTime.now().add(Duration(days:2));

                                  DateTime? pickedDate = await showDatePicker(
                                    context: context,
                                    initialDate:
                                        controller.selectedEndDate.value ?? now,
                                    firstDate: now,
                                    lastDate: now.add(Duration(days: 365 * 10)),
                                  );

                                  if (pickedDate != null) {
                                    // Handle the selected date
                                    controller.selectedEndDate.value = pickedDate;
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
                                          crossAxisAlignment: CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              'End Date:',
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                color: Colors.black,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.normal,
                                              ),
                                            ),
                                            Text(
                                              controller.selectedEndDate.value == null
                                                  ? "Select Date"
                                                  : dateFormater(controller
                                                      .selectedEndDate.value!),
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                color: Colors.black,
                                                overflow: TextOverflow.ellipsis,
                                                fontWeight: FontWeight.normal,
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
                        );
                      }),
                    ],
                  ),
                ),
                Visibility(
                  visible: MediaQuery.of(context).viewInsets.bottom == 0,
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: SizedBox(
                      width: double.infinity,
                      child: Padding(
                        padding:
                        EdgeInsets.symmetric( vertical: 4.h),
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: AppColors.kPrimaryColor),
                            onPressed: () {
                              if(controller.validateCreateAds()){
                                controller.createAdds();
                              }
                            },
                            child: Text(
                              'Send Request',
                              style: TextStyle(color: Colors.white),
                            )),
                      ),
                    ),
                  ),
                )
              ],
            ),
          );
        }
      ),
    );
  }
}
