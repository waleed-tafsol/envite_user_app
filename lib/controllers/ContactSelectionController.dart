import 'dart:convert';

import 'package:event_planner_light/constants/ApiConstant.dart';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/services/customPrint.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:fast_contacts/fast_contacts.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:permission_handler/permission_handler.dart';
import 'package:responsive_sizer/responsive_sizer.dart';

import '../constants/colors_constants.dart';

class ContactSelectionController extends GetxController {
  final TextEditingController searchController = TextEditingController();

  String selectedEventId = Get.arguments["eventslug"];

  RxList<Contact> selectedContacts = <Contact>[].obs;
  RxList<Contact> searchedContacts = <Contact>[].obs;
  List<Contact> allContacts = <Contact>[];
  RxBool isLoading = false.obs;

  @override
  void onInit() async {
    super.onInit();
    await getContacts();
    searchController.addListener(_filterContacts);
  }

  @override
  void onClose() {
    searchController.removeListener(_filterContacts); // Clean up the listener
    searchController.dispose(); // Dispose of the controller
    super.onClose();
  }

  void _filterContacts() {
    final query = searchController.text.toLowerCase();
    if (query.isEmpty) {
      searchedContacts.value = List.from(allContacts); // Show all contacts
    } else {
      searchedContacts.value = allContacts
          .where((contact) =>
              contact.displayName.toLowerCase().contains(query) ||
              contact.phones.any((phone) => phone.number.contains(query)))
          .toList();
    }
  }

  void selectContacts(Contact contact, int index) {
    if ((authService.me.value?.remainingInvites ?? 0) -
            selectedContacts.length ==
        0) {
      CustomSnackbar.showError(
        "No Invites Left",
        "Please upgrade your plan to send invites",
      );
      return;
    }
    selectedContacts.add(contact);
    searchedContacts.removeAt(index);
  }

  void unSelectContacts(Contact contact, int index) {
    searchedContacts.add(contact);
    selectedContacts.removeAt(index);
  }

  Future<void> getContacts() async {
    try {
      final status = await Permission.contacts.request();
      if (status.isGranted) {
        allContacts = await FastContacts.getAllContacts();
        searchedContacts.value = List.from(allContacts); // Initialize the list
      }
    } catch (e) {
      print(e.toString());
    }
  }

  Future<void> sendInvitation() async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.sendContacts + selectedEventId),
        body: jsonEncode({
          "phoneNumbers": selectedContacts.map((contact) {
            return contact.phones.first.number;
          }).toList(),
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer ${authService.authToken}',
        },
      );
      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 201) {
        CustomSnackbar.showSuccess(
          'Success',
          'https://3pmq3hk5-3022.inc1.devtunnels.ms/api/v1/event/invitation/$selectedEventId/${selectedContacts[0].phones.first.number}',
        );
        print(
            'https://3pmq3hk5-3022.inc1.devtunnels.ms/api/v1/event/invitation/$selectedEventId/${selectedContacts[0].phones.first.number}');
        selectedContacts.clear();
        searchedContacts.value = List.from(allContacts); // Reset the list
      } else if (response.statusCode == 400) {
        CustomSnackbar.showError(
          'Error',
          jsonResponse["message"]?["error"]?[0] ??
              'Could Not Add To Favourites',
        );
      } else if (response.statusCode == 401) {
        CustomSnackbar.showError(
          'Error',
          jsonResponse["message"]?["error"]?[0] ??
              'Could Not Add To Favourites',
        );
      } else {
        throw Exception(jsonResponse["message"]?["error"]?[0] ??
            'Could Not Add To Favourites');
      }
    } catch (e) {
      CustomSnackbar.showError('Error', e.toString());
    } finally {
      isLoading.value = false;
    }
  }

  void showAddContactDialog() {
    final TextEditingController nameController = TextEditingController();
    final TextEditingController phoneController = TextEditingController();

    // Show the dialog using Get.dialog
    Get.dialog(
      AlertDialog(
        title: Text('Add Contact'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(labelText: 'Name'),
            ),
            SizedBox(height: 10),
            TextField(
              controller: phoneController,
              decoration: InputDecoration(labelText: 'Phone'),
              keyboardType: TextInputType.phone,
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Get.back(), // Close the dialog
            child: Text('Cancel',
                style: TextStyle(
                  color: AppColors.kPrimaryColor,
                  fontSize: 14.sp,
                )),
          ),
          TextButton(
            onPressed: () {
              if ((authService.me.value?.remainingInvites ?? 0) -
                      selectedContacts.length !=
                  0) {
                String name = nameController.text.trim();
                String phone = phoneController.text.trim();

                if (name.isNotEmpty && phone.isNotEmpty) {
                  // Add the contact logic here (e.g., add to a list or database)
                  final newContact = Contact(
                      id: DateTime.now()
                          .millisecondsSinceEpoch
                          .toString(), // Generate a unique ID
                      structuredName: StructuredName(
                        displayName: name,
                        namePrefix: "",
                        givenName: name,
                        middleName: "",
                        familyName: "",
                        nameSuffix: "",
                      ),
                      phones: [Phone(number: phone, label: 'mobile')],
                      emails: [],
                      organization: Organization(
                          company: "", department: "", jobDescription: ""));
                  selectedContacts.add(newContact);
                  Get.back();
                } else {
                  // Show error message if any field is empty
                  CustomSnackbar.showError(
                    'Error',
                    'Please fill out both fields',
                  );
                }
              } else {
                CustomSnackbar.showError(
                  "No Invites Left",
                  "Please upgrade your plan to send invites",
                );
              }
            },
            child: Text('Add',
                style: TextStyle(
                  // color: AppColors.kPrimaryColor,
                  fontSize: 14.sp,
                )),
          ),
        ],
      ),
    );
  }

  Future<void> showContactSelectionBottomSheet(
    BuildContext context,
  ) async {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Padding(
          padding: const EdgeInsets.all(16.0),
          child: SafeArea(
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                TextField(
                  controller: searchController, // Use the controller here
                  onSubmitted: (value) {
                    _filterContacts();
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.white,
                    suffixIcon: InkWell(
                        onTap: () {
                          _filterContacts();
                        },
                        child: Icon(Icons.search)),
                    hintText: "Search Contacts",
                  ),
                ),
                SizedBox(height: 10),
                Expanded(
                  child: Obx(() {
                    return ListView.builder(
                      itemCount: searchedContacts.length,
                      itemBuilder: (context, index) {
                        Contact contact = searchedContacts[index];
                        return ListTile(
                          title: Text(contact.displayName),
                          subtitle: contact.phones.isNotEmpty
                              ? Text(contact.phones.first.number)
                              : null,
                          trailing: IconButton(
                            onPressed: () {
                              selectContacts(contact, index);
                            },
                            icon: Icon(Icons.add),
                          ),
                        );
                      },
                    );
                  }),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
