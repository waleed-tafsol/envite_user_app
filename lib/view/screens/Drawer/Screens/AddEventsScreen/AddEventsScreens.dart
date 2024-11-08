import 'package:event_planner_light/constants/StyleConstants.dart';
import 'package:event_planner_light/constants/assets.dart';
import 'package:event_planner_light/controllers/AddEventController.dart';
import 'package:event_planner_light/view/screens/Drawer/Screens/AddEventsScreen/ConfirmOrAddMoreEvents.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../constants/colors_constants.dart';
import '../../../../widgets/BottomModelSheet.dart';

class AddEAnventsScreens extends GetView<Addeventcontroller> {
  const AddEAnventsScreens({super.key});
  static const routeName = "AddEAnventsScreens";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Your event"),
      ),
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 4.w),
            child: Column(
              children: [
                Image.asset(Assets.video_Thumbnail),
                // Stack(
                //   children: [
                //     Image.asset(Assets.video_Thumbnail),
                //     Positioned(top: 1.h, right: 2.w, child: CircleIcon()),
                //   ],
                // ),
                SizedBox(
                  height: 2.h,
                ),
                const TextField(
                    decoration: InputDecoration(
                  hintText: "Number max of attendance",
                  prefixIcon: Icon(Icons.groups_2_outlined),
                )),
                SizedBox(
                  height: 2.h,
                ),
                const TextField(
                    decoration: InputDecoration(
                  hintText: "Email",
                  prefixIcon: Icon(Icons.email_outlined),
                )),
                SizedBox(
                  height: 2.h,
                ),
                // const TextField(
                //     decoration: InputDecoration(
                //   hintText: "Phone number",
                //   prefixIcon: Icon(Icons.phone_iphone_rounded),
                // )),
                // SizedBox(
                //   height: 2.h,
                // ),
                const TextField(
                    decoration: InputDecoration(
                  hintText: "Address",
                  prefixIcon: Icon(Icons.location_on_outlined),
                )),
                SizedBox(
                  height: 2.h,
                ),
                Row(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    const Expanded(
                      child: TextField(
                          decoration: InputDecoration(
                        hintText: "Start date of the event",
                        prefixIcon: Icon(Icons.event),
                      )),
                    ),
                    SizedBox(
                      width: 2.w,
                    ),
                    const Expanded(
                      child: TextField(
                          decoration: InputDecoration(
                        hintText: "End date of the event",
                        prefixIcon: Icon(Icons.event),
                      )),
                    ),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                const TextField(
                    decoration: InputDecoration(
                  hintText: "Number max of attendance",
                  prefixIcon: Icon(Icons.groups_2_outlined),
                )),
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
                  title: Text(
                    "Category of events",
                    style: Theme.of(context).textTheme.bodySmall,
                  ),
                  trailing: const Icon(
                    Icons.arrow_downward_rounded,
                    color: AppColors.kPrimaryColor,
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
                      controller.selectedOption.value ?? "Type of events",
                      style: Theme.of(context).textTheme.bodySmall,
                    );
                  }),
                  trailing: PopupMenuButton<String>(
                    icon: const Icon(
                      Icons.arrow_downward_rounded,
                      color: AppColors.kPrimaryColor,
                    ),
                    onSelected: (String value) {
                      if (value == "Private" || value == "Exclusive") {
                        BottomSheetManager.upgradePlan(context);
                      } else {
                        controller.setSelectedOption(value);
                      }
                    },
                    itemBuilder: (BuildContext context) {
                      return controller.options.map((String choice) {
                        return PopupMenuItem<String>(
                          value: choice,
                          child: Text(choice),
                        );
                      }).toList();
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                SizedBox(
                  height: 6.h,
                  width: double.infinity,
                  child: ElevatedButton(
                      style: StylesConstants.elevated_b_redBack_whiteFore,
                      onPressed: () {
                        Get.toNamed(ConfirmorAddMoreEvents.routeName);
                      },
                      child: const Text("Add the event")),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
