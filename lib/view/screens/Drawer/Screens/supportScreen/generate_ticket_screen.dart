import 'package:dotted_border/dotted_border.dart';
import 'package:event_planner_light/constants/colors_constants.dart';
import 'package:event_planner_light/controllers/SupportController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

class GenerateTicketScreen extends GetView<SupportController> {
  static const routeName = 'GenerateTicketScreen';
  GenerateTicketScreen({super.key});
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Support'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 3.h),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  
                  Text(
                    'Generate Ticket',
                    style: TextStyle(
                        color: AppColors.kBerkeleyBlue,
                        fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  InkWell(
                    onTap: () {
                      controller.pickImage();
                    },
                    child: Obx(() {
                      return controller.pickedImage.value == null
                          ? DottedBorder(
                              color: AppColors.kBluedarkShade,
                              dashPattern: [5],
                              borderType: BorderType.RRect,
                              radius: Radius.circular(5),
                              child: SizedBox(
                                height: 20.h,
                                width: double.infinity,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
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
                                        decoration: TextDecoration.underline,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            )
                          : Stack(
                            children: [
                              ClipRRect(
                                  borderRadius: BorderRadius.circular(5),
                                  child: Image.file(
                                    controller.pickedImage.value!,
                                    height: 20.h,
                                    fit: BoxFit.cover,
                                    width: double.infinity,
                                  )),
                                  Positioned(
                                    right: 0,
                                    child: Center(
                                      child: GestureDetector(
                                        onTap: () => controller.removeImage(),
                                        child: Padding(
                                          padding: EdgeInsets.all(10),
                                          child: CircleAvatar(
                                            backgroundColor: Colors.red,
                                            child: Icon(Icons.delete,color: Colors.white,),),
                                        ),
                                      ),
                                    ),
                                  )
                            ],
                          );
                    }),
                  ),
                  SizedBox(height: 1.h),
                  TextFormField(
                      validator: (value) => value!.isEmpty ? 'Enter Title' : null,
                      controller: controller.titleController,
                      decoration: InputDecoration(
                          hintText: "Title", fillColor: AppColors.kTextfieldColor
                          // prefixIcon: Icon(Icons.email_outlined),
                          )),
                  SizedBox(
                    height: 1.h,
                  ),
                  TextFormField(
                      validator: (value) =>
                          value!.isEmpty ? 'Enter Description' : null,
                      controller: controller.descriptionController,
                      maxLines: 4,
                      decoration: InputDecoration(
                          hintText: "Description",
                          fillColor: AppColors.kTextfieldColor
          
                          // prefixIcon: Icon(Icons.email_outlined),
                          )),
                  SizedBox(height: 20.h,),
                  Row(
                    children: [
                      Expanded(
                        child: Obx(() {
                          return controller.isloading.value
                              ? Center(child: CircularProgressIndicator())
                              : ElevatedButton(
                                  style: ElevatedButton.styleFrom(
                                      backgroundColor: AppColors.kPrimaryColor),
                                  onPressed: () {
                                    if (_formKey.currentState!.validate()) {
                                      controller.createTicket();
                                    }
                                  },
                                  child: Text(
                                    'Send',
                                    style: TextStyle(color: Colors.white),
                                  ));
                        }),
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
