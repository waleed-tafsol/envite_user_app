import 'dart:convert';
import 'dart:io';
import 'package:event_planner_light/controllers/PackagesController.dart';
import 'package:event_planner_light/services/FirebaseServices.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:mime/mime.dart';
import '../constants/ApiConstant.dart';
import '../model/UserModel.dart';
import '../services/LocationServices.dart';
import '../utills/CustomSnackbar.dart';
import '../view/screens/auth_screen.dart';
import 'Auth_token_services.dart';
import 'package:http_parser/http_parser.dart';
import 'package:android_id/android_id.dart';
import 'package:device_info_plus/device_info_plus.dart';

class AuthService extends GetxService {
  @override
  void onInit() {
    // initialize();
    super.onInit();
  }

  Future<void> initialize() async {
    if (await _tokenStorage.hasToken()) {
      isAuthenticated.value = true;
      authToken = await _tokenStorage.getToken();
      await getMe();
    }
  }

  var isAuthenticated = false.obs;
  final SessionStorageService _tokenStorage = SessionStorageService();
  String? authToken;
  Rx<UserModel?> me = UserModel().obs;

  setToken(String token) async {
    _tokenStorage.saveToken(token);
    authToken = token;
    await getMe();
    isAuthenticated.value = true;
  }

  Future<void> getMe() async {
    try {
      final response = await http.get(Uri.parse(ApiConstants.getme), headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $authToken',
      });
      final jsonResponse = json.decode(response.body);
      if (response.statusCode == 200) {
        final responseData = UserModel.fromJson(jsonResponse["data"]["user"]);
        me.value = responseData;
      } else {
        final errorData = jsonDecode(response.body);
        throw errorData["message"]["error"][0] ?? "An error occurred";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<String?> _getUniqueId() async {
    var deviceInfo = DeviceInfoPlugin();

    if (Platform.isIOS) {
      var iosDeviceInfo = await deviceInfo.iosInfo;
      return iosDeviceInfo.identifierForVendor;
    } else if (Platform.isAndroid) {
      return await AndroidId().getId();
    }
    return null;
  }

  Future<Map<dynamic, dynamic>> login(
      {required String email,
      required String password,
      required bool isEvetPlanner}) async {
    try {
      final fcmToken = FirebaseService.fcmToken;
      final deviceId = await _getUniqueId();
      final response = await http.post(
        Uri.parse(isEvetPlanner
            ? ApiConstants.eventPlannerLogin
            : ApiConstants.userLogin),
        body: jsonEncode({
          "email": email,
          "fcmToken": fcmToken,
          "deviceId": deviceId,
          "password": password,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
      );

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        final errorData = jsonDecode(response.body);
        throw errorData["message"]["error"][0] ?? "An error occurred";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Map<String, dynamic>?> signup({
    required String fullName,
    required String phoneNumber,
    required List<File> documents,
    required String email,
    required String bio,
    required String password,
    required String passCnfrm,
    required bool isEventPlanner,
  }) async {
    final url = Uri.parse(isEventPlanner
        ? ApiConstants.eventPlannerRegister
        : ApiConstants.register);
    // Get location
    Position position = await LocationServices.getCurrentLocation();

    try {
      final request = http.MultipartRequest('POST', url);

      request.fields['fullName'] = fullName;
      request.fields['lat'] = position.latitude.toString();
      request.fields['lng'] = position.longitude.toString();
      request.fields['email'] = email;
      request.fields['phoneNumber'] = phoneNumber;
      request.fields['password'] = password;
      request.fields['confirmPassword'] = passCnfrm;

      if (isEventPlanner) {
        for (int i = 0; i < documents.length; i++) {
          final file = documents[i];
          final mimeType = lookupMimeType(file.path);
          final mediaType = mimeType != null
              ? MediaType.parse(mimeType)
              : MediaType('application', 'pdf');

          var multipartFile = await http.MultipartFile.fromPath(
            'document',
            file.path,
            contentType: mediaType,
          );
          request.files.add(multipartFile);
        }
        request.fields['description'] = bio;
      }

      request.headers.addAll({'Content-Type': 'multipart/form-data'});

      final streamedResponse = await request.send();

      final response = await http.Response.fromStream(streamedResponse);

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        return responseData;
      } else {
        final errorData = jsonDecode(response.body);
        throw errorData["message"]["error"][0] ?? "An error occurred";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> logout() async {
    Get.dialog(const Center(child: CircularProgressIndicator()));
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.logout),
        body: jsonEncode({"fcmToken": FirebaseService.fcmToken}),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
      );
      if (response.statusCode == 200) {
        await deleteAuthTokenAndNavigate(message: "Logged out successfully");
      } else {
        final errorData = jsonDecode(response.body);
        throw errorData["message"]["error"][0] ?? "An error occurred";
      }
    } catch (e) {
      Get.back();

      CustomSnackbar.showError("Error", e.toString());
    }
  }

  Future<Map<String, dynamic>?> verifyOtp(
      {String? email, required bool isForgotPassword, String? otp}) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.verifyOtp),
        body: jsonEncode({
          "email": email ?? "",
          "code": otp,
          "fromForgotPassword": isForgotPassword
        }),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        final errorData = jsonDecode(response.body);
        throw errorData["message"]["error"][0] ?? "An error occurred";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<Map<String, dynamic>?> resendOtp(
      {required bool isForgotPassword,
      //  String? otp,
      String? email}) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.resendOtp),
        body: jsonEncode({
          // "otp": otp,
          "fromForgotPassword": isForgotPassword,
          "email": email
        }),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 201) {
        return jsonDecode(response.body);
      } else {
        final errorData = jsonDecode(response.body);
        throw errorData["message"]["error"][0] ?? "An error occurred";
      }
    } catch (e) {
      throw e.toString();
    }
  }

  Future<void> deleteAuthTokenAndNavigate({String? message}) async {
    await _tokenStorage.deleteToken();
    authToken = null;
    isAuthenticated.value = false;
    Get.back();
    CustomSnackbar.showSuccess("Success", message ?? "Logged Out");
    Get.offAllNamed(AuthScreen.routeName);
  }

  // Future<Map<String, dynamic>> forgotPassword(String email) async {
  //   try {
  //     final response = await http.post(
  //       Uri.parse(ApiConstants.forgotPass),
  //       body: jsonEncode({"email": email}),
  //       headers: {'Content-Type': 'application/json'},
  //     );

  //     if (response.statusCode == 200) {
  //       return jsonDecode(response.body);
  //     } else {
  //       throw "An error occurred: ${response.body}");
  //     }
  //   } catch (e) {
  //     throw e.toString());
  //   }
  // }

  // Future<Map<String, dynamic>> resetPass(
  //     String email, int code, String password, String confirmPass) async {
  //   try {
  //     final response = await http.patch(
  //       Uri.parse(ApiConstants.resetPass),
  //       body: jsonEncode({
  //         "email": email,
  //         "code": code,
  //         "password": password,
  //         "passwordConfirm": confirmPass,
  //       }),
  //       headers: {'Content-Type': 'application/json'},
  //     );

  //     if (response.statusCode == 200) {
  //       return jsonDecode(response.body);
  //     } else {
  //       throw "An error occurred: ${response.body}");
  //     }
  //   } catch (e) {
  //     throw e.toString());
  //   }
  // }
}

final AuthService authService = Get.find();
