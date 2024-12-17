class ApiConstants {
  // dev tunnel url
  // static const baseUrl = "https://3pmq3hk5-3027.inc1.devtunnels.ms/";
  static const baseUrl =
      "https://envite-backend-c29dd82c64e2.herokuapp.com/api/v1/";
  // Auth
  static const login = "${baseUrl}auth/login";
  static const logout = "${baseUrl}auth/logout";
  static const verifyOtp = "${baseUrl}auth/verify/otp";
  static const forgotPassword = "${baseUrl}auth/forgot/password";
  static const resetPassword = "${baseUrl}auth/reset/password";
  static const resendOtp = "${baseUrl}auth/resend/otp";
  static const register = "${baseUrl}auth/event/planner/signup";
  // Auth
  static const getme = "${baseUrl}users/me";
  // Catagories
  static const categories = "${baseUrl}category/all";
  static const getMyCatagories = "${baseUrl}category/my/all";
  // Events
  static const getMyEvents = "${baseUrl}event/my/all";
  static const getAllEvents = "${baseUrl}event/all";
  static const eventDetail = "${baseUrl}event/detail/";
  static const addEvent = "${baseUrl}event";
  // static const getMyCatagories = "${baseUrl}category/my/all";
  // Packages
  static const getAllPackages = "${baseUrl}packages/all";
  static const buyPackages = "${baseUrl}users/purchase/subscription/";
  // support
  static const generateTicket = "${baseUrl}support-ticket/create";
  static const getTickets = "${baseUrl}support-ticket/my/all?status=";
  // Coupons
  static const getCoupons = "${baseUrl}coupon/all";
  // adds
  static const getMyAds = "${baseUrl}ads/my/all";
  static const getAlldds = "${baseUrl}ads/all";
}
