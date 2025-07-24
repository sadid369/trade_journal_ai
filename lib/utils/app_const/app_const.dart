class AppConstants {
  /// <====================== All Response Message Static==============================>
  static String successfull = "Request Successfull";
  static String error = "Oops, something went wrong";
  static String profileID = "profileID";
  static String userStatus = "userStatus";
  static String isRemember = "isRemember";
  static var chatId = "chatID";
  static var transLan = "transLan";
  static var userID = "userID";
  static var userRole = "userRole";

  static var token = "token";
  static const String refreshToken = "refreshToken";
  static const String language = 'isEnglish';

  static String onlineImage =
      "https://images.unsplash.com/photo-1546961329-78bef0414d7c?w=500&auto=format&fit=crop&q=60&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxzZWFyY2h8MTJ8fHVzZXJ8ZW58MHx8MHx8fDA%3D";

  static String carDarty =
      "https://plus.unsplash.com/premium_photo-1663011056190-87c23e04a81a?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";

  static String carClean =
      "https://images.unsplash.com/photo-1699077613292-ba56bd20b4e6?q=80&w=2070&auto=format&fit=crop&ixlib=rb-4.0.3&ixid=M3wxMjA3fDB8MHxwaG90by1wYWdlfHx8fGVufDB8fHx8fA%3D%3D";
}

enum Status { loading, error, completed, internetError, noDataFound }

enum Screen { signUp, forgot }
