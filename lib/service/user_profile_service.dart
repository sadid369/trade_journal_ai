import 'package:flutter/material.dart';
import '../global/model/user_profile.dart';
import '../helper/extension/base_extension.dart';
import 'api_service.dart';
import 'api_url.dart';

class UserProfileService {
  static Future<UserProfile?> getUserProfile(BuildContext context) async {
    try {
      final apiClient = ApiClient();
      final response = await apiClient.get(
        url: ApiUrl.userProfile.addBaseUrl,
        isBasic: false,
        context: context,
        showResult: true,
      );

      if (response.statusCode == 200) {
        return UserProfile.fromJson(response.body);
      } else {
        print('Failed to get user profile: ${response.statusCode}');
        return null;
      }
    } catch (e) {
      print('Error getting user profile: $e');
      return null;
    }
  }
}
