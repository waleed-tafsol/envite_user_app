import 'dart:convert';
import 'package:http/http.dart' as http;

import 'package:get/get.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';

import '../constants/ApiConstant.dart';
import '../utills/CustomSnackbar.dart';
import '../view/screens/NavBar/NavBarScreen.dart';
import '../view/screens/SignIn/ForgotMyPasswordScreen.dart';
import 'Auth_token_services.dart';

class OtpController extends GetxController {
  var otpCode = ''.obs;
  var isResendEnabled = true.obs;
  var isLoading = false.obs;
  var isResendOtpLoading = false.obs;
  var resendCooldown = 30.obs;
  var timerActive = false.obs;
  final TokenService _tokenStorage = TokenService();
  String? authToken;

  void updateOtp(String value) {
    otpCode.value = value;
  }

  Future<void> submitOtp({String? email, required bool isForgotPassword}) async {
    isLoading.value = true;
    try {
      final response = await http.post(
        Uri.parse(ApiConstants.verifyOtp),
        body: jsonEncode({
          "email": email ?? "",
          "code": otpCode.value,
          "fromForgotPassword": isForgotPassword
        }),
        headers: {
          "Content-Type": "application/json",
        },
      );
      if (response.statusCode == 201) {
        CustomSnackbar.showSuccess('Success', 'OTP Verified');
        if (isForgotPassword) {
          Get.offAllNamed(ForgotMyPasswordConfirmScreen.routeName, arguments: {
            "email": email,
            "otp": otpCode.value,
          });
        } else {
          final responseData = jsonDecode(response.body);
          authToken = responseData["data"]["token"];
          _tokenStorage.saveToken(authToken!);
          Get.offAllNamed(NavBarScreen.routeName);
        }
      } else {
        final errorData = jsonDecode(response.body);
        isLoading.value = false;
        throw Exception(
            errorData["message"]["error"][0] ?? "An error occurred");
      }
      isLoading.value = false;
    } catch (e) {
      isLoading.value = false;
      CustomSnackbar.showError(e.toString(), 'Failed to verify OTP: $e');
    }
  }

  Future<void> resendOtp({String? email, bool? isForgotPassword}) async {
    isLoading.value = true;
    if (isResendEnabled.value) {
      try {
        final response = await http.post(
          Uri.parse(ApiConstants.resendOtp),
          body: jsonEncode({
            "email": email ?? "",
            "fromForgotPassword": isForgotPassword ?? false
          }),
          headers: {
            "Content-Type": "application/json",
          },
        );
        if (response.statusCode == 201) {
          CustomSnackbar.showSuccess(
              'OTP Resent', 'A new OTP has been sent to your Email.');
        } else {
          isLoading.value = false;
          final errorData = jsonDecode(response.body);
          throw Exception(
              errorData["message"]["error"][0] ?? "An error occurred");
        }
        isLoading.value = false;
      } catch (e) {
        isLoading.value = false;
        CustomSnackbar.showError(e.toString(), 'Failed to verify OTP: $e');
      }

      // Start the cooldown timer
      startCooldown();
    }
  }

  void startCooldown() {
    isResendEnabled.value = false;
    resendCooldown.value = 30; // Reset cooldown to 30 seconds
    timerActive.value = true;

    // Start a timer to count down the cooldown
    Future.delayed(Duration(seconds: 1), countdown);
  }

  void countdown() {
    if (resendCooldown.value > 0) {
      resendCooldown.value--;
      Future.delayed(Duration(seconds: 1), countdown);
    } else {
      isResendEnabled.value = true;
      timerActive.value = false;
    }
  }
}
