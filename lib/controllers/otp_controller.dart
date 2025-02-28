import 'package:event_planner_light/controllers/Auth_services.dart';
import 'package:event_planner_light/view/screens/SignIn/ForgotMyPasswordScreen.dart';
import 'package:get/get.dart';
import '../utills/CustomSnackbar.dart';
import '../view/screens/NavBar/NavBarScreen.dart';

class OtpController extends GetxController {
  var otpCode = ''.obs;
  var isResendEnabled = true.obs;
  var isLoading = false.obs;
  var isResendOtpLoading = false.obs;
  late bool isForgotPassword;
  var resendCooldown = 30.obs;
  var timerActive = false.obs;

  @override
  void onInit() {
    super.onInit();
    isForgotPassword = Get.arguments['isForgotPassword'] ?? false;
  }

  void updateOtp(String value) {
    otpCode.value = value;
  }

  Future<void> submitOtp({String? email}) async {
    isLoading.value = true;
    try {
      final response = await authService.verifyOtp(
          isForgotPassword: false, email: email, otp: otpCode.value);
      CustomSnackbar.showSuccess('Success', 'OTP Verified');
      final responseData = response!["data"];
      authService.setToken(responseData["token"]);
      Get.offAllNamed(NavBarScreen.routeName);
    } catch (e) {
      CustomSnackbar.showError(e.toString(), 'Failed to verify OTP: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> submitOtpFromForgotPassword({String? email}) async {
    isLoading.value = true;
    try {
      final response = await authService.verifyOtp(
          isForgotPassword: true, email: email, otp: otpCode.value);
      CustomSnackbar.showSuccess(
          'Success', 'OTP Verified Please reset password');
      Get.toNamed(ForgotMyPasswordConfirmScreen.routeName,
          arguments: {"otp": otpCode.value, "email": email});
    } catch (e) {
      CustomSnackbar.showError(e.toString(), 'Failed to verify OTP: $e');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> resendOtp({String? email}) async {
    isLoading.value = true;
    try {
      final response = await authService.resendOtp(
        email: email, isForgotPassword: isForgotPassword,
        //  otp: otpCode.value
      );
      CustomSnackbar.showSuccess(
          'OTP Resent', 'A new OTP has been sent to your Email.');
      startCooldown();
    } catch (e) {
      CustomSnackbar.showError(e.toString(), 'Failed to verify OTP: $e');
    } finally {
      isLoading.value = false;
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
