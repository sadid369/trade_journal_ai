class ApiUrl {
  static const baseUrl = "http://10.10.7.84:8000"; // LOCAL
  static const imageBaseUrl = '$baseUrl/';
  static socketUrl({String userID = ""}) => '$baseUrl?id=$userID';

  /// ============================ Auth ==============================
  static const setNewPassword = "/api/user/set-new-password/";
  static const changePassword = "/api/user/change-password/";
  static const resetPasswordOtp = "/api/user/reset-password-otp/";
  static const userProfile = "/api/user/profile/";
  static const getAllContact = "/api/core/contacts/";
  static const signUpClient = "/user/api/v1/register/";
  static const signUpWorker = "/worker/auth/register";
  static const activeClient = "/client/auth/activate-user";
  static const activeWorker = "/worker/auth/activate-user";
  static const login = "/api/user/login/";
  static const register = "/api/user/register/";
  static const verifyOtp = "/api/user/verify-otp/";
  static const forgotPassword = "/api/user/send-reset-password-email/";

  static const resendOTpWorker = "/worker/auth/resend-activation-code";
  static const resendOTpClient = "/client/auth/resend-activation-code";

  static const forgotPassClient = "/client/auth/forgot-password";
  static const forgotPassWorker = "/worker/auth/forgot-password";

  static const changePassClient = "/client/auth/change-password";
  static const changePassWorker = "/worker/auth/change-password";

  static const signInClient = "/client/auth/login";
  static const signInWorker = "/worker/auth/login";

  /// ========================== Profile =========================
  static const clientUpdateProfile = "/client/update-profile";
  static const workerUpdateProfile = "/worker/update-profile";

  static const clientProfile = "/client/profile";
  static const workerProfile = "/worker/profile";

  /// ========================================= Client API's ===============================================
  static const createJob = "/job/create-job";
  static const upcomingService = "/client/upcoming-date";
  static const subscriptionPackages = "/dashboard/get-all-package";
  static String applyCoupon({required String couponCode}) =>
      "/coupon/search-coupon?coupon=$couponCode";

  /// ================= Subscription ===================
  static const confirmSubscription = "/client/subscribe";
  static const getMySubscription = "/client/get-my-subscription";

  /// ========================================= Worker API's ===============================================
  static const workerNewOrder = "/worker/new-order";
  static const acceptWork = "/job/worker-accept-work";
  static const startWork = "/job/worker-start-work";
  static const endWork = "/job/worker-end-work";
  static const getSpamList = "/job/job-and-worker-location";

  /// ========================================= Global API's ===============================================
  static const jobHistory = "/job/history";
  static const notification = "/notification/my-notifications";
  static const readNotification = "/notification/mark-as-read";

  static const getTerms = "/dashboard/get-terms-conditions";
  static const getPrivacy = "/dashboard/get-privacy-policy";
}
