class ApiConstants {
  // dev tunnel url
  // static const baseUrl = "https://3pmq3hk5-3027.inc1.devtunnels.ms/";
  static const baseUrl =
      "https://envite-backend-day-df490b3da880.herokuapp.com/";
  // Auth
  static const login = "${baseUrl}api/v1/auth/login";
  static const logout = "${baseUrl}api/v1/auth/logout";
  static const verifyOtp = "${baseUrl}api/v1/auth/verify/otp";
  static const forgotPassword = "${baseUrl}api/v1/auth/forgot/password";
  static const resetPassword = "${baseUrl}api/v1/auth/reset/password";
  static const resendOtp = "${baseUrl}api/v1/auth/resend/otp";
  static const register = "${baseUrl}api/v1/auth/event/planner/signup";
  // Auth
  static const getme = "${baseUrl}api/v1/users/me";
  // Catagories
  static const categories = "${baseUrl}api/v1/category/all";
  static const getMyCatagories = "${baseUrl}api/v1/category/my/all";
  // Events
  static const getMyEvents = "${baseUrl}api/v1/event/my/all";
  static const getAllEvents = "${baseUrl}api/v1/event/all";
  static const eventDetail = "${baseUrl}api/v1/event/detail/";
  static const addEvent = "${baseUrl}api/v1/event";
  // static const getMyCatagories = "${baseUrl}api/v1/category/my/all";
  // Packages
  static const getAllPackages = "${baseUrl}api/v1/packages/all";
  static const buyPackages = "${baseUrl}api/v1/users/purchase/subscription/";
  // support
  static const generateTicket = "${baseUrl}api/v1/support-ticket/create";
  static const getTickets = "${baseUrl}api/v1/support-ticket/my/all?status=";
  // Coupons
  static const getCoupons = "${baseUrl}api/v1/coupon/all";
}
