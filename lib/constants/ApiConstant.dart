class ApiConstants {
  // dev tunnel url
  // static const baseUrl =
  //     "https://2ba6-2407-aa80-14-e3cc-e5fa-9f01-4a66-a2e2.ngrok-free.app/api/v1/";
  static const baseUrl =
      "https://envite-backend-dd-d3e9220ccbc0.herokuapp.com/api/v1/";
  // auth/user
  static const login = "${baseUrl}auth/login";
  static const logout = "${baseUrl}auth/user/logout";
  static const verifyOtp = "${baseUrl}auth/verify/otp";
  static const forgotPassword = "${baseUrl}auth/forgot/password";
  static const resetPassword = "${baseUrl}auth/reset/password";
  static const resendOtp = "${baseUrl}auth/resend/otp";
  static const register = "${baseUrl}auth/user/signup";
  // Catagories
  static const categories = "${baseUrl}category/all";
}
