class ApiConstants {
  // dev tunnel url
  // static const baseUrl =
  //     "https://2ba6-2407-aa80-14-e3cc-e5fa-9f01-4a66-a2e2.ngrok-free.app/api/v1/";
  static const baseUrl =
      "https://envite-backend-dd-d3e9220ccbc0.herokuapp.com/api/v1/";

       static const googleAPIKey = "AIzaSyAsZkmP4p9OGxlhCsKKUAIW7C6VZpRiYwg";

        static const s3bucket =
      "https://envite-bucket.s3.me-central-1.amazonaws.com/";

  // Auth
  static const login = "${baseUrl}auth/login";
  static const logout = "${baseUrl}auth/logout";
  static const verifyOtp = "${baseUrl}auth/verify/otp";
  static const forgotPassword = "${baseUrl}auth/forgot/password";
  static const resetPassword = "${baseUrl}auth/reset/password";
  static const resendOtp = "${baseUrl}auth/resend/otp";
  static const register = "${baseUrl}auth/user/signup";
  // user
  static const getme = "${baseUrl}users/me";
  static const updateMe = "${baseUrl}users/update/me";
  // Catagories
  static const categories = "${baseUrl}category/all";
  static const getMyCatagories = "${baseUrl}category/my/all";
  // Events
  static const getMyEvents = "${baseUrl}event/my/all";
  static const getAllEvents = "${baseUrl}event/all";
  static const addEvent = "${baseUrl}event";
  static const getCategories = "${baseUrl}category/all";
   static const eventDetail = "${baseUrl}event/detail/";
}
