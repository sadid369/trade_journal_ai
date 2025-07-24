import 'package:flutter/material.dart';
import 'dart:io';
import '../helper/extension/base_extension.dart';
import 'api_service.dart';
import 'api_url.dart';

class UserProfileUpdateService {
  static Future<bool> updateUserProfile(
    BuildContext context, {
    required String name,
    File? profileImage,
  }) async {
    try {
      final apiClient = ApiClient();

      // Prepare multipart body
      List<MultipartBody> multipartFiles = [];

      if (profileImage != null) {
        multipartFiles.add(MultipartBody('image', profileImage));
      }

      final response = await apiClient.multipartRequest(
        url: ApiUrl.userProfile.addBaseUrl,
        reqType: 'PATCH',
        isBasic: false,
        body: {
          'name': name,
        },
        multipartBody: multipartFiles,
        showResult: true,
      );

      if (response.statusCode == 200) {
        print('Profile updated successfully');
        return true;
      } else {
        print('Failed to update profile: ${response.statusCode}');
        return false;
      }
    } catch (e) {
      print('Error updating profile: $e');
      return false;
    }
  }
}
