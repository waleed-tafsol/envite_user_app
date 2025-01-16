// import 'dart:io';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;

// import 'package:get/get.dart';
// import 'package:get/get_state_manager/src/simple/get_controllers.dart';
// import 'package:image_picker/image_picker.dart';
// import 'package:mime/mime.dart';

// import '../constants/ApiConstant.dart';
// import '../services/customPrint.dart';

// class UploadImagesVideosController extends GetxController {
//   final ImagePicker _picker = ImagePicker();
//   RxList<File> pickedFiles = <File>[].obs;
//   List<dynamic> imageUploadMimType = [];
//   List<String> successFullFilesUploads = [];

//   Future<void> pickImageOrVideo() async {
//     try {
//       // Let the user choose between picking an image or a video
//       final XFile? file = await _picker.pickMedia(imageQuality: 20);

//       if (file != null) {
//         pickedFiles.add(File(file.path)); // Add picked file to the list
//       }
//     } catch (e) {
//       Get.snackbar('Error', 'Failed to pick image or video: $e');
//     }
//   }

//   void removeFile(File file) {
//     pickedFiles.remove(file);
//   }

//   void removeAllFiles() {
//     pickedFiles.clear();
//   }

//   // Future<bool> uploadMimeTypes() async {
//   //   Get.dialog(const Center(child: CircularProgressIndicator()));

//   //   List<String> mimeTypes = pickedFiles.map((file) {
//   //     final mimeType = lookupMimeType(file.path);
//   //     return mimeType ?? "application/octet-stream";
//   //   }).toList();

//   //   ColoredPrint.green(mimeTypes.toString());
//   //   Response? response = await ApiService.postRequest(
//   //     ApiConstants.uploadMimTypes,
//   //     {
//   //       "mimeTypes": mimeTypes,
//   //     },
//   //   );

//   //   ColoredPrint.green(response.toString());

//   //   if (response.statusCode == 201) {
//   //     final jsonresponse = response.data;
//   //     imageUploadMimType = jsonresponse["data"];
//   //     Get.dialog(
//   //       const Center(
//   //         child: CircularProgressIndicator(),
//   //       ),
//   //     );

//   //     for (int i = 0; i < imageUploadMimType.length; i++) {
//   //       await uploadToS3Bucket(imageUploadMimType[i], i, mimeTypes[i]);
//   //     }
//   //     Get.back();
//   //     return true;
//   //   }
//   //   else{
//   //     return false;
//   //   }
//   // }

//   Future<void> uploadToS3Bucket(
//       Map<String, dynamic> imageMap, int i, String? mimeType) async {
//     try {
//       final file = pickedFiles[i];
//       final fileBytes = await file.readAsBytes();

//       var request = http.StreamedRequest('PUT', Uri.parse(imageMap["url"]))
//         ..headers['Content-Type'] = mimeType!
//         ..contentLength = fileBytes.length;

//       // Add file bytes to the request
//       request.sink.add(fileBytes);
//       await request.sink.close();

//       // Send the request
//       var response = await request.send();

//       // TODO: BELOW IS FOR DIO
//       /* final response = await Dio().put(
//         imageMap["url"],
//         data: fileBytes,
//         options: Options(
//           headers: {
//             "Content-Type": mimeType,
//           },
//         ),
//       );*/

//       if (response.statusCode == 200) {
//         successFullFilesUploads.add(imageMap["key"]);
//         ColoredPrint.green(
//             "Image uploaded successfully: $successFullFilesUploads");
//       } else {
//         ColoredPrint.red("Failed to upload image: ${response.statusCode}");
//       }
//     } catch (e) {
//       ColoredPrint.red("Error uploading image: $e");
//     }
//   }
// }
