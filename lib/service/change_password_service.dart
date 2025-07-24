import 'package:flutter/material.dart';
import '../helper/extension/base_extension.dart';
import 'api_service.dart';
import 'api_url.dart';

class ChangePasswordService {
  static Future<bool> changePassword(
    BuildContext context, {
    required String currentPassword,
    required String newPassword,
    required String confirmNewPassword,
  }) async {
    try {
      final apiClient = ApiClient();
      
      final response = await apiClient.post(
        url: ApiUrl.changePassword.addBaseUrl,
        isBasic: false,
        context: context,
        showResult: true,
        body: {
          'current_password': currentPassword,
          'new_password': newPassword,
          'confirm_new_password': confirmNewPassword,
        },
      );

      if (response.statusCode == 200) {
        print('Password changed successfully');
        return true;
      } else {
        print('Failed to change password: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error changing password: $e');
      return false;
    }
  }
}