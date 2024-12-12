import 'dart:convert';
import 'package:event_planner_light/services/LocationServices.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import '../constants/ApiConstant.dart';
import '../model/UserModel.dart';
import '../utills/CustomSnackbar.dart';
import '../view/screens/SplashScreen.dart';
import 'Auth_token_services.dart';

class AuthService extends GetxService {
  @override
  void onInit() async {
    await initialize();
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
  final TokenService _tokenStorage = TokenService();
  String? authToken;
  Rx<UserModel?> me = UserModel().obs;

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
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<dynamic, dynamic>> login(
      {required String email, required String password}) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.login),
        body: jsonEncode({
          "email": email,
          "password": password,
        }),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
      );

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);
        if (responseData["data"]["user"]["isVerified"] == true) {
          authToken = responseData["data"]["token"];
          _tokenStorage.saveToken(authToken!);
          isAuthenticated.value = true;
          await getMe();
          return responseData;
        } else {
          throw Exception("Please verify your email to login");
        }
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<Map<String, dynamic>?> signup({
    required String fullName,
    required String phoneNumber,
    required List<String?> selectedCategories,
    required String email,
    required String bio,
    required String password,
    required String passCnfrm,
  }) async {
    final url = Uri.parse(ApiConstants.register);
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
      request.fields['description'] = bio;
      request.fields['confirmPassword'] = passCnfrm;

      if (selectedCategories.isNotEmpty) {
        for (var i = 0; i < selectedCategories.length; i++) {
          request.fields['categories[$i]'] = selectedCategories[i]!;
        }
      }

      request.headers.addAll({'Content-Type': 'multipart/form-data'});

      final streamedResponse = await request.send();

      final response = await http.Response.fromStream(streamedResponse);
      // print(response.body.toString());

      if (response.statusCode == 201) {
        final responseData = jsonDecode(response.body);

        authToken = responseData["data"]["token"];
        // _tokenStorage.saveToken(authToken!);
        // isAuthenticated.value = true;
        // await getMe();

        return responseData;
      } else {
        final errorData = jsonDecode(response.body);
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      throw Exception(e.toString());
    }
  }

  Future<void> logout() async {
    Get.dialog(const Center(child: CircularProgressIndicator()));
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.logout),
        headers: {
          'Content-Type': 'application/json',
          'Authorization': 'Bearer $authToken',
        },
      );

      if (response.statusCode == 200) {
        await deleteAuthTokenAndNavigate(message: "Logged out successfully");
      } else {
        final errorData = jsonDecode(response.body);

        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
    } catch (e) {
      Get.back();

      CustomSnackbar.showError("Error", e.toString());
    }
  }

  Future<void> deleteAuthTokenAndNavigate({String? message}) async {
    await _tokenStorage.deleteToken();
    authToken = null;
    isAuthenticated.value = false;
    Get.back();
    CustomSnackbar.showSuccess("Success", message ?? "Logged Out");
    Get.offAllNamed(Splash_screen.routeName);
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
  //       throw Exception("An error occurred: ${response.body}");
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
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
  //       throw Exception("An error occurred: ${response.body}");
  //     }
  //   } catch (e) {
  //     throw Exception(e.toString());
  //   }
  // }
}

final AuthService authService = Get.find();
