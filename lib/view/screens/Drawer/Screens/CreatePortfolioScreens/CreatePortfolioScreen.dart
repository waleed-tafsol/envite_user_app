import 'package:dotted_border/dotted_border.dart';
import 'package:event_planner_light/constants/StyleConstants.dart';
import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/view/screens/Drawer/DrawerScreen.dart';
import 'package:event_planner_light/view/screens/NavBar/NavBarScreen.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../controllers/CreateProfileController.dart';

class CreatePortfolioScreen extends GetView<Createprofilecontroller> {
  const CreatePortfolioScreen({super.key});
  static const routeName = "CreatePortfolioScreen";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Create Portfolio"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                "Please upload your portfolio to help us understand your user better to you.",
                textAlign: TextAlign.center,
                style: TextConstants.bodyMedium_black_normal(context),
              ),
              SizedBox(
                height: 1.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Personal Info",
                  style: TextConstants.bodyLargeBlackBold(context),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Name"),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Email"),
              ),
              SizedBox(
                height: 1.h,
              ),
              TextField(
                decoration: InputDecoration(hintText: "Phone Number"),
              ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                height: 20.h,
                child: TextField(
                  keyboardType: TextInputType.multiline,
                  textAlignVertical: TextAlignVertical.top,
                  maxLines: null, // Set this
                  expands: true,
                  decoration: InputDecoration(hintText: "Bio"),
                ),
              ),
              // Align(
              //   alignment: Alignment.centerLeft,
              //   child: Text(
              //     "Price",
              //     style: TextConstants.bodyLargeBlackBold(context),
              //   ),
              // ),
              // SizedBox(
              //   height: 1.h,
              // ),
              // TextField(
              //   decoration: InputDecoration(hintText: "Type Here"),
              // ),
              // SizedBox(
              //   height: 1.h,
              // ),
              // Row(
              //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //   children: [
              //     Text(
              //       "Specialty",
              //       style: TextConstants.bodyLargeBlackBold(context),
              //     ),
              //     IconButton(
              //         onPressed: () {
              //           if (controller
              //               .specialityController.value.text.isNotEmpty) {
              //             controller.spacialities
              //                 .add(controller.specialityController.value.text);
              //             controller.specialityController.clear();
              //           } else {
              //             Get.snackbar("Invalid", "Please enter something");
              //           }
              //         },
              //         icon: Icon(Icons.add))
              //   ],
              // ),
              // SizedBox(
              //   height: 1.h,
              // ),
              // Padding(
              //   padding: EdgeInsets.symmetric(vertical: 1.h),
              //   child: Obx(() {
              //     return Wrap(
              //       runSpacing: 1.h,
              //       children: controller.spacialities.map((text) {
              //         return Container(
              //             padding: EdgeInsets.symmetric(
              //                 vertical: 1.h, horizontal: 4.w),
              //             margin: EdgeInsets.symmetric(horizontal: 2.w),
              //             decoration: BoxDecoration(
              //                 color: Colors.white,
              //                 borderRadius: k5BorderRadius),
              //             child: Text(
              //               text,
              //               style:
              //                   TextConstants.bodyMedium_black_normal(context),
              //             ));
              //       }).toList(),
              //     );
              //   }),
              // ),
              // SizedBox(
              //   height: 1.h,
              // ),
              // TextField(
              //   decoration: InputDecoration(
              //     hintText: "Type Here",
              //   ),
              //   controller: controller.specialityController,
              //   onSubmitted: (value) {
              //     if (value.isNotEmpty) {
              //       controller.spacialities
              //           .add(controller.specialityController.value.text);

              //       controller.specialityController.clear();
              //     } else {
              //       Get.snackbar("Invalid", "Please enter something");
              //     }
              //   },
              // ),
              SizedBox(
                height: 1.h,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Verification Document",
                    style: TextConstants.bodyLargeBlackBold(context),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(Icons.add))
                ],
              ),
              SizedBox(
                height: 1.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    controller.pickImageOrVideo();
                  },
                  child: DottedBorder(
                    dashPattern: [5],
                    borderType: BorderType.RRect,
                    radius: Radius.circular(5),
                    child: SizedBox(
                      height: 20.h,
                      width: 20.h,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            size: 10.h,
                            Icons.image_outlined,
                            color: Colors.grey,
                          ),
                          Text(
                            "Upload Image",
                            style: TextStyle(
                              fontSize: 17.sp,
                              color: Colors.grey,
                              decoration: TextDecoration.underline,
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Obx(() {
                if (controller.pickedFiles.isEmpty) {
                  return const SizedBox();
                }
                return GridView.builder(
                  shrinkWrap: true,
                  physics:
                      const NeverScrollableScrollPhysics(), // Disable scrolling
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2, // Number of columns
                      childAspectRatio: 1.1, // Aspect ratio of grid items
                      mainAxisSpacing: 3.h,
                      crossAxisSpacing: 4.w),
                  itemCount: controller.pickedFiles.length,
                  itemBuilder: (context, index) {
                    final file = controller.pickedFiles[index];
                    return Stack(
                      children: [
                        Positioned.fill(
                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: k5BorderRadius,
                              color: AppColors.kBlueLightShade,
                            ),
                            padding: EdgeInsets.symmetric(
                                vertical: 2.h, horizontal: 4.w),
                            child: ClipRRect(
                              borderRadius: k5BorderRadius,
                              child: Image.file(
                                file,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        Positioned(
                            right: 0,
                            top: 0,
                            child: IconButton(
                                icon: const Icon(
                                  Icons.cancel,
                                  color: Colors.white,
                                ),
                                onPressed: () {
                                  controller.removeFile(file);
                                }))
                      ],
                    );
                  },
                );
              }),
              SizedBox(
                height: 1.h,
              ),

              // TextField(
              //   decoration: InputDecoration(hintText: "Tilte"),
              // ),
              SizedBox(
                height: 1.h,
              ),
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                    style: StylesConstants.elevated_b_redBack_whiteFore,
                    onPressed: () {
                      Get.offNamed(DrawerScreen.routeName);
                    },
                    child: Text("Create Portfolio")),
              ),
              SizedBox(
                height: 1.h,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
