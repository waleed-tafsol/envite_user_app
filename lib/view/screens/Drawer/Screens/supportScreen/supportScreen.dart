import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/SupportController.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/supportScreen/generate_ticket_screen.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/supportScreen/widgets/support_container.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../../../../../constants/constants.dart';
import '../../../../../utills/string_decoration.dart';

class SupportScreen extends GetView<SupportController> {
  const SupportScreen({super.key});
  static const routeName = "SupportScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Support'),
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Obx(() {
                  return Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    // spacing: 2.w,
                    children: List<Widget>.generate(
                      controller.allTypes.length,
                      (int index) {
                        return Padding(
                          padding: EdgeInsets.symmetric(horizontal: 1.w),
                          child: ChoiceChip(
                            backgroundColor: AppColors.kBlueMediumShade,
                            selectedColor: AppColors.kPrimaryColor,
                            shape: RoundedRectangleBorder(
                                borderRadius: k5BorderRadius,
                                side: BorderSide(
                                  color: AppColors.kBlueMediumShade,
                                )),
                            label: Text(
                              capitalizeFirstLetter(controller.allTypes[index]),
                              style: TextStyle(
                                  color: controller.allTypes[index] ==
                                          controller.selectedType.value
                                      ? Colors.white
                                      : AppColors.kBluedarkShade),
                            ),
                            selected: controller.selectedType.value ==
                                controller.allTypes[index],
                            onSelected: (bool selected) {
                              if (selected) {
                                controller.selectedType.value =
                                    controller.allTypes[index];
                                controller.getAllTickets();
                              }
                            },
                          ),
                        );
                      },
                    ).toList(),
                  );
                }),
              ),
              SizedBox(
                height: 3.h,
              ),
              Expanded(
                child: Obx(() {
                  return controller.isloading.value
                      ? Center(
                          child: CircularProgressIndicator(),
                        )
                      : controller.tickets.isEmpty
                          ? SizedBox(
                              height: 40.h,
                              child: Center(
                                child: Text(
                                  "No Tickets are available",
                                  style: TextStyle(
                                      fontSize: 18.sp,
                                      color: AppColors.kTextBlack),
                                ),
                              ),
                            )
                          : ListView.builder(
                              itemCount: controller.tickets.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                return SupportContainer(
                                  title: controller.tickets[index].title ?? "",
                                  subTitle:
                                      controller.tickets[index].description ??
                                          "",
                                  image: controller.tickets[index].image,
                                );
                              });
                }),
              ),
              Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: AppColors.kPrimaryColor),
                        onPressed: () {
                          Get.toNamed(GenerateTicketScreen.routeName);
                        },
                        child: Text(
                          'Generate Ticket',
                          style: TextStyle(color: Colors.white),
                        )),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
