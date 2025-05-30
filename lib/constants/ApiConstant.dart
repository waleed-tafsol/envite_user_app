class ApiConstants {
  // dev tunnel url
  // static const baseUrl = "https://3pmq3hk5-3022.inc1.devtunnels.ms/api/v1/";
  static const googleAPIKey = "AIzaSyAsZkmP4p9OGxlhCsKKUAIW7C6VZpRiYwg";
  static const baseUrl =
      "https://envite-backend-dg-8d3abe083eef.herokuapp.com/api/v1/";
  static const s3bucket =
      "https://envite-bucket.s3.me-central-1.amazonaws.com/";

  // Auth
  static const userLogin = "${baseUrl}auth/login";
  static const eventPlannerLogin = "${baseUrl}auth/event-planner/login";
  static const logout = "${baseUrl}auth/logout";
  static const verifyOtp = "${baseUrl}auth/verify/otp";
  static const forgotPassword = "${baseUrl}auth/forgot/password";
  static const resetPassword = "${baseUrl}auth/reset/password";
  static const resendOtp = "${baseUrl}auth/resend/otp";
  static const register = "${baseUrl}auth/user/signup";
  static const eventPlannerRegister = "${baseUrl}auth/event/planner/signup";
  static const deleteAccount = "${baseUrl}users/delete/me";
  // user
  static const getme = "${baseUrl}users/me";
  static const updateMe = "${baseUrl}users/update/me";
  // Catagories
  static const getCategories = "${baseUrl}category/all";
  // static const getMyCatagories = "${baseUrl}category/my/all";
  // Events
  static const getMyEvents = "${baseUrl}event/my/all";
  static const getAllEvents = "${baseUrl}event/all";
  static const eventDetail = "${baseUrl}event/detail/";
  static const addEvent = "${baseUrl}event";
  static const addAds = "${baseUrl}ads/create";

  static const updateEvent = "${baseUrl}event/update/";
  static const sendContacts = "${baseUrl}event/invitation/send/";
  static const invitationUrl = "${baseUrl}event/invitation/";
  // static const getMyCatagories = "${baseUrl}category/my/all";
  // Packages
  static const getAllPackages = "${baseUrl}packages/all";
  static const topUps = "${baseUrl}users/render/topup/";
  static const upgradePlan = "${baseUrl}users/packages/";
  static const cancleSubscription = "${baseUrl}users/cancel/subscription";

  // support
  static const generateTicket = "${baseUrl}support-ticket/create";
  static const getTickets = "${baseUrl}support-ticket/my/all?status=";
  // Coupons
  static const getCoupons = "${baseUrl}coupon/all";
  // adds
  static const getAlldds = "${baseUrl}ads/all";
  // cms
  static const getallCms = "${baseUrl}cms?cmsType=all";
  // Favourits
  static const addTofavourite = "${baseUrl}favorite/create/";
  static const getAllfavourite = "${baseUrl}favorite/my/all";
  static const getPlannedEvent = "${baseUrl}event/attending/all";
  static const attendEvent = "${baseUrl}event/attend/";
  // Notifications
  static const getNotifications = "${baseUrl}notifications/all";
  static const getMyAds = "${baseUrl}ads/my/all";
}
