import 'dart:io';

import 'package:event_planner_light/services/customPrint.dart';
import 'package:http/http.dart' as http;

Future<void> uploadFilesToS3(
    {required List<String> filePaths,
    required List<String> presignedUrls}) async {
  try {
    if (filePaths.length != presignedUrls.length) {
      throw "The number of file paths must match the number of presigned URLs.";
    }

    // Loop through the files and presigned URLs
    for (int i = 0; i < filePaths.length; i++) {
      final filePath = filePaths[i];
      final presignedUrl = presignedUrls[i];

      // Read the file as bytes
      final file = File(filePath);
      final fileBytes = await file.readAsBytes();

      // Set headers (e.g., for video, but it could be dynamic depending on the file type)
      var headers = {
        'Content-Type':
            'video/mp4' // You may want to dynamically determine the MIME type
      };

      // Create a PUT request with the presigned URL and file content
      var request = http.Request('PUT', Uri.parse(presignedUrl));

      // Set the file bytes as the body of the request
      request.bodyBytes = fileBytes;

      // Add headers
      request.headers.addAll(headers);

      // Send the request
      var response = await request.send();

      // Handle the response
      if (response.statusCode == 200) {
        ColoredPrint.green('File uploaded successfully: ${filePaths[i]}');
      } else {
        ColoredPrint.red(
            'Failed to upload file: ${filePaths[i]}, Status: ${response.statusCode}');
        throw 'Error uploading files';
      }
    }
  } catch (e) {
    ColoredPrint.red('Error uploading files: $e');
    throw 'Error uploading files: $e';
  }
}
