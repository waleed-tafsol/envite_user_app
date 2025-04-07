import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:responsive_sizer/responsive_sizer.dart';
import '../../../../../constants/colors_constants.dart';
import '../../../../../controllers/ContactSelectionController.dart';
import '../../../../../controllers/filters_controller.dart';

class ContactsSelectionScreen extends GetView<ContactSelectionController> {
  static const routeName = 'ContactsSelectionScreen';

  ContactsSelectionScreen({super.key});

  final FiltersController filtersController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Select Contacts",
          style: Theme.of(context).textTheme.bodyLarge,
        ),
        centerTitle: true,
        actions: [
          IconButton(
              onPressed: () {
                controller.showAddContactDialog();
              },
              icon: Icon(Icons.add))
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 4.w),
          child: Column(
            children: [
              Expanded(child: Obx(() {
                return controller.selectedContacts.isEmpty
                    ? Center(
                        child: Text("No Contact Selected",
                            style: TextStyle(
                                fontSize: 14.sp, color: Colors.black)))
                    : ListView.builder(
                        itemCount: controller.selectedContacts.length,
                        itemBuilder: (context, index) {
                          Contact contact = controller.selectedContacts[index];
                          return ListTile(
                              title: Text(contact.displayName),
                              subtitle: contact.phones.isNotEmpty
                                  ? Text(contact.phones.first.number)
                                  : null,
                              trailing: IconButton(
                                  onPressed: () {
                                    controller.unSelectContacts(contact, index);
                                  },
                                  icon: Icon(Icons.remove)));
                        },
                      );
              })),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        controller.showContactSelectionBottomSheet(context);
                      },
                      child: Container(
                        height: 7.h,
                        //   width: double.infinity,
                        decoration: BoxDecoration(
                          color: AppColors.kPrimaryColor,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(
                            child: Text(
                          "Pick Contacts",
                          style: TextStyle(
                              fontSize: 15, fontWeight: FontWeight.bold),
                        )),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Expanded(
                    child: InkWell(
                      onTap: () {
                        if (!controller.isLoading.value) {
                          controller.selectedContacts.isEmpty
                              ? CustomSnackbar.showError(
                                  "Error", "Please select a Contact")
                              : controller.sendInvitation();
                        }
                      },
                      child: Container(
                        height: 7.h,
                        decoration: BoxDecoration(
                          color: AppColors.kBerkeleyBlue,
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: Center(child: Obx(() {
                          return controller.isLoading.value
                              ? CircularProgressIndicator(
                                  color: Colors.white,
                                )
                              : Text(
                                  "Send Invites",
                                  style: TextStyle(
                                      fontSize: 15,
                                      fontWeight: FontWeight.bold),
                                );
                        })),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
