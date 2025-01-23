import 'dart:convert';
import 'dart:io';
import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/services/customPrint.dart';
import 'package:event_planner_light/utills/CustomSnackbar.dart';
import 'package:event_planner_light/utills/aws_utills.dart';
import 'package:event_planner_light/utills/convert_date_time.dart';
import 'package:http/http.dart' as http;
import 'package:event_planner_light/constants/ApiConstant.dart';
import 'package:event_planner_light/main.dart';
import 'package:event_planner_light/model/CatagoryModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_thumbnail_video/index.dart';
import 'package:get_thumbnail_video/video_thumbnail.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mime/mime.dart';
import 'package:path_provider/path_provider.dart';
import 'package:http_parser/http_parser.dart';
import 'package:video_player/video_player.dart';

class AddEventController extends GetxController {
  TextEditingController nameController = TextEditingController();
  TextEditingController avnueController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  List<TextEditingController> emailController =
      <TextEditingController>[TextEditingController()].obs;
  List<TextEditingController> socialLinkController =
      <TextEditingController>[TextEditingController()].obs;
  TextEditingController descriptionController = TextEditingController();
 
 
  Rx<CatagoryModel> selectedCategory = CatagoryModel().obs;
  final ImagePicker _picker = ImagePicker();
  RxBool isAddPastEvents = false.obs;
  RxBool isloading = false.obs;
  List<String> options = ['public', 'private', 'exclusive'];
  Rx<String?> selectedOption = Rx<String?>(null);
  RxList<File> pickedImages = <File>[].obs;
  RxList<File> pickedVideo = <File>[].obs;
  Rx<DateTime> selectedStartDate = DateTime.now().add(Duration(days: 1)).obs;
  Rx<DateTime> selectedEndDate = DateTime.now().add(Duration(days: 1)).obs;

  Rx<String> selectedStartTime =
      TimeOfDay.now().format(navigatorKey.currentContext!).obs;
  Rx<String> selectedEndTime =
      TimeOfDay.now().format(navigatorKey.currentContext!).obs;

  void removeImage(File file) {
    pickedImages.remove(file);
  }

  Future<void> pickImage() async {
    try {
      final XFile? file = await _picker.pickImage(source: ImageSource.gallery);
      if (file != null) {
        pickedImages.add(File(file.path));
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image or video: $e');
    }
  }

  void setStartTime(String time) {
    selectedStartTime.value = time;
  }

  void setEndTime(String time) {
    selectedEndTime.value = time;
  }

  void setStartDate(DateTime date) {
    selectedStartDate.value = date;
  }

  void setEndDate(DateTime date) {
    selectedEndDate.value = date;
  }

  final TextEditingController googlemapfieldController =
      TextEditingController();
  String? lat;
  String? lng;

/*
  Future<void> getcatagories() async {
    try {
      final response =
          await http.get(Uri.parse(ApiConstants.getMyCatagories), headers: {
        'Authorization': 'Bearer ${authService.authToken}',
        'Content-Type': 'application/json',
      });
      if (response.statusCode == 200) {
        final jsonResponse = json.decode(response.body);
        final List<dynamic> data = jsonResponse['data'];
        categories.value = data.map((e) => CatagoryModel.fromJson(e)).toList();
        isloading.value = false;
      } else {
        isloading.value = false;
        final errorData = jsonDecode(response.body);
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      isloading.value = false;
      CustomSnackbar.showError('Error', e.toString());
    }
  }
*/

  Future<void> pickVideo() async {
    try {
      final XFile? file = await _picker.pickVideo(source: ImageSource.gallery);
      if (file != null) {
        pickedVideo.add(File(file.path));
      }
    } catch (e) {
      Get.snackbar('Error', 'Failed to pick image or video: $e');
    }
  }

  Future<String> getThumbnail(String videoPath) async {
    final uint8List = await VideoThumbnail.thumbnailData(
      video: videoPath,
      imageFormat: ImageFormat.JPEG,
      maxWidth: 200,
      quality: 75,
    );
    final tempDir = await getTemporaryDirectory();
    final filePath = '${tempDir.path}/thumbnail.jpg';
    final file = File(filePath);
    await file.writeAsBytes(uint8List!);
    return filePath;
  }

// Method to play the video
  void playVideo(String videoPath) {
    final videoPlayerController = VideoPlayerController.file(File(videoPath));
    videoPlayerController.initialize().then((_) {
      videoPlayerController.play();
    });
  }

  // void setSelectedOption(String option) {
  //   selectedOption.value = option;
  // }

  Future<void> addEvent() async {
    final url = Uri.parse(ApiConstants.addEvent);

    try {
      isloading.value = true;

      final request = http.MultipartRequest('POST', url);

      // Add text fields
      request.fields['name'] = nameController.value.text;
      request.fields['isPastEvent'] = isAddPastEvents.value.toString();
      request.fields['eventType'] =  "private";
      request.fields['address'] = addressController.text;
      request.fields['latitude'] = '45454545454';
      request.fields['longitude'] = '454545454545';
      for (int i = 0; i < emailController.length; i++) {
        request.fields['emails[$i]'] = emailController[i].text;
      }

      // Add images
      for (int i = 0; i < pickedImages.length; i++) {
        final file = pickedImages[i];
        final mimeType = lookupMimeType(
            file.path);// Get MIME type based on the file extension
        final mediaType = mimeType != null
            ? MediaType.parse(mimeType)
            : MediaType('image', 'jpeg'); // Default to 'image/jpeg'

        var multipartFile = await http.MultipartFile.fromPath(
          'images',
          file.path,
          filename: file.uri.pathSegments.last,
         contentType: mediaType,
        );
        request.files.add(multipartFile);
      }

      for (int i = 0; i < socialLinkController.length; i++) {
        request.fields['socialLinks[$i]'] = socialLinkController[i].text;
      }
      request.fields['description'] = descriptionController.value.text;

      request.fields['videosCount'] = pickedVideo.length.toString();
      request.fields['avenue'] = avnueController.value.text;
      request.fields['categorySlug'] = selectedCategory.value?.slug ?? "";
      request.fields['startDate'] =
          formatToIso8601WithTimezone(selectedStartDate.value);
      request.fields['endDate'] =
          formatToIso8601WithTimezone(selectedEndDate.value);
      request.fields['startTime'] = selectedStartTime.value;
      request.fields['endTime'] = selectedEndTime.value;

      // Add headers
      request.headers.addAll({
        'Content-Type': 'multipart/form-data',
        'Authorization': 'Bearer ${authService.authToken}',
      });

      // Send the request
      final streamedResponse = await request.send();
      final response = await http.Response.fromStream(streamedResponse);

      // Handle the response
      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        List<String> videoUrls =
            List<String>.from(responseData["data"]["videoUrls"]);
        ColoredPrint.green("Event Slug : ${responseData["data"]["videoUrls"]}");
        await uploadFilesToS3(
            presignedUrls: videoUrls,
            filePaths: pickedVideo.map((file) => file.path).toList());
        ColoredPrint.green("Event Slug : ${responseData["data"]["videoUrls"]}");

        CustomSnackbar.showSuccess(
            'Success', responseData["message"] ?? "Event created successfully");

        isloading.value = false;
      //Get.offAndToNamed(ConfirmorAddMoreEvents.routeName);
        // dispose();
        // onClose();
        // return responseData;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      isloading.value = false;
      CustomSnackbar.showError("Error", e.toString());
      ColoredPrint.red(e.toString());
    }
  }

  @override
  void onClose() {
    // Handle cleanup here
    nameController.dispose();
    avnueController.dispose();
    addressController.dispose();
    emailController.forEach((element) {
      element.dispose();
    });
    socialLinkController.forEach((element) {
      element.dispose();
    });
    descriptionController.dispose();
    googlemapfieldController.dispose();
    pickedImages.forEach((element) {
      element.delete();
    });
    pickedVideo.forEach((element) {
      element.delete();
    });
    super.onClose();
  }

  @override
  void dispose() {
    // TODO: implement dispose
    // nameController.dispose();
    // avnueController.dispose();
    // addressController.dispose();
    // emailController.forEach((element) {
    //   element.dispose();
    // });
    // socialLinkController.forEach((element) {
    //   element.dispose();
    // });
    // descriptionController.dispose();
    // googlemapfieldController.dispose();
    // pickedImages.forEach((element) {
    //   element.delete();
    // });
    // pickedVideo.forEach((element) {
    //   element.delete();
    // });
    super.dispose();
  }
}


