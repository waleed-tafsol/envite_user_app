import 'package:dotted_border/dotted_border.dart';
import 'package:event_planner_light/constants/StyleConstants.dart';
import 'package:event_planner_light/constants/TextConstant.dart';
import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/constants/constants.dart';
import 'package:event_planner_light/view/screens/Drawer/DrawerScreen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class EditProfileScreen extends StatelessWidget {
  static const routeName = 'EditProfileScreen';
  const EditProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Update Profile '),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SizedBox(
                height: 1.h,
              ),
              Stack(children: [
                ClipRRect(
                    borderRadius: BorderRadius.circular(10),
                    child: Image.asset(
                      fit: BoxFit.cover,
                      Assets.eventCanvas,
                      width: double.infinity,
                    )),
                Positioned(
                    right: 1.w, child: SvgPicture.asset(SvgAssets.image_pen))
              ]),
              SizedBox(height: 1.h),
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

              SizedBox(
                height: 1.h,
              ),

              SizedBox(
                height: 1.h,
              ),
              Align(
                alignment: Alignment.centerLeft,
                child: InkWell(
                  onTap: () {
                    // controller.pickImageOrVideo();
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
              // Obx(() {
              //   if (controller.pickedFiles.isEmpty) {
              //     return const SizedBox();
              //   }
              //   return GridView.builder(
              //     shrinkWrap: true,
              //     physics:
              //         const NeverScrollableScrollPhysics(), // Disable scrolling
              //     gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              //         crossAxisCount: 2, // Number of columns
              //         childAspectRatio: 1.1, // Aspect ratio of grid items
              //         mainAxisSpacing: 3.h,
              //         crossAxisSpacing: 4.w),
              //     itemCount: controller.pickedFiles.length,
              //     itemBuilder: (context, index) {
              //       final file = controller.pickedFiles[index];
              //       return Stack(
              //         children: [
              //           Positioned.fill(
              //             child: Container(
              //               decoration: BoxDecoration(
              //                 borderRadius: k5BorderRadius,
              //                 color: AppColors.kBlueLightShade,
              //               ),
              //               padding: EdgeInsets.symmetric(
              //                   vertical: 2.h, horizontal: 4.w),
              //               child: ClipRRect(
              //                 borderRadius: k5BorderRadius,
              //                 child: Image.file(
              //                   file,
              //                   fit: BoxFit.cover,
              //                 ),
              //               ),
              //             ),
              //           ),
              //           Positioned(
              //               right: 0,
              //               top: 0,
              //               child: IconButton(
              //                   icon: const Icon(
              //                     Icons.cancel,
              //                     color: Colors.white,
              //                   ),
              //                   onPressed: () {
              //                     controller.removeFile(file);
              //                   }))
              //         ],
              //       );
              //     },
              //   );
              // }),
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
                    child: Text("Update Profile")),
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
