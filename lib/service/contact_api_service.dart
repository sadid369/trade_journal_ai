import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'dart:io';
import '../global/model/contact.dart';
import '../service/api_service.dart';
import '../service/api_url.dart';

class ContactApiService {
  static final ApiClient _apiClient = ApiClient();

  /// Get all contacts from API
  static Future<List<Contact>> getContacts(BuildContext context) async {
    try {
      final response = await _apiClient.get(
        url: '${ApiUrl.baseUrl}${ApiUrl.getAllContact}',
        isBasic: false,
        showResult: true,
        context: context,
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.body as List<dynamic>;
        return jsonList.map((json) => Contact.fromApiJson(json)).toList();
      } else {
        throw Exception('Failed to load contacts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching contacts: $e');
    }
  }

  /// Create a new contact via API
  static Future<Contact> createContact({
    required String firstName,
    required String lastName,
    required String phoneNumber,
    required String message,
    String? ringtone,
    String? theme,
    File? voiceFile,
    File? photoFile,
    required BuildContext context,
  }) async {
    try {
      Map<String, String> formData = {
        'first_name': firstName,
        'last_name': lastName, // Assuming last name is optional
        'phone_number': phoneNumber,
        'message': message,
      };

      if (ringtone != null) {
        formData['ringtone'] = ringtone;
      }

      if (theme != null) {
        formData['theme'] = theme;
      }

      List<MultipartBody> multipartFiles = [];

      if (voiceFile != null) {
        multipartFiles.add(MultipartBody('voice', voiceFile));
      }

      if (photoFile != null) {
        multipartFiles.add(MultipartBody('photo', photoFile));
      }

      final response = await _apiClient.multipartRequest(
        url: '${ApiUrl.baseUrl}${ApiUrl.getAllContact}',
        reqType: 'POST',
        isBasic: false,
        body: formData,
        multipartBody: multipartFiles,
        showResult: true,
      );

      if (response.statusCode == 201) {
        return Contact.fromApiJson(response.body);
      } else {
        throw Exception('Failed to create contact: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error creating contact: $e');
    }
  }

  /// Update an existing contact via API
  static Future<Contact> updateContact({
    required int id,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? message,
    String? ringtone,
    String? theme,
    File? voiceFile,
    File? photoFile,
    required BuildContext context,
  }) async {
    try {
      Map<String, String> formData = {};

      if (firstName != null) formData['first_name'] = firstName;
      if (lastName != null) formData['last_name'] = lastName;
      if (phoneNumber != null) formData['phone_number'] = phoneNumber;
      if (message != null) formData['message'] = message;
      if (ringtone != null) formData['ringtone'] = ringtone;
      if (theme != null) formData['theme'] = theme;

      List<MultipartBody> multipartFiles = [];

      if (voiceFile != null) {
        multipartFiles.add(MultipartBody('voice', voiceFile));
      }

      if (photoFile != null) {
        multipartFiles.add(MultipartBody('photo', photoFile));
      }

      final response = await _apiClient.multipartRequest(
        url: '${ApiUrl.baseUrl}${ApiUrl.getAllContact}$id/',
        reqType: 'PATCH',
        isBasic: false,
        body: formData,
        multipartBody: multipartFiles,
        showResult: true,
      );

      if (response.statusCode == 200) {
        return Contact.fromApiJson(response.body);
      } else {
        throw Exception('Failed to update contact: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error updating contact: $e');
    }
  }

  /// Update contact using Contact object
  static Future<Contact> updateContactFromObject({
    required Contact contact,
    File? voiceFile,
    File? photoFile,
    required BuildContext context,
  }) async {
    if (!contact.isApiContact) {
      throw Exception('Cannot update local contact via API');
    }

    return updateContact(
      id: contact.apiId!,
      firstName: contact.firstName,
      lastName: contact.lastName,
      phoneNumber: contact.phoneNumber,
      message: contact.message,
      ringtone: contact.ringtone,
      theme: contact.theme,
      voiceFile: voiceFile,
      photoFile: photoFile,
      context: context,
    );
  }

  /// Create contact using Contact object
  static Future<Contact> createContactFromObject({
    required Contact contact,
    File? voiceFile,
    File? photoFile,
    required BuildContext context,
  }) async {
    return createContact(
      firstName: contact.firstName,
      lastName: contact.lastName,
      phoneNumber: contact.phoneNumber,
      message: contact.message,
      ringtone: contact.ringtone,
      theme: contact.theme,
      voiceFile: voiceFile,
      photoFile: photoFile,
      context: context,
    );
  }

  /// Delete a contact via API
  static Future<bool> deleteContact(int id, BuildContext context) async {
    try {
      final response = await _apiClient.delete(
        url: '${ApiUrl.baseUrl}${ApiUrl.getAllContact}$id/',
        isBasic: false,
        code: 204, // Expecting 204 No Content
        showResult: true,
      );

      // For 204 No Content, the response might be null or empty
      // Just check if we get the response without errors
      return true; // If we reach here without exception, deletion was successful
    } catch (e) {
      print('Delete contact error: $e'); // Add logging
      throw Exception('Error deleting contact: $e');
    }
  }

  /// Get a single contact by ID
  static Future<Contact> getContactById(int id, BuildContext context) async {
    try {
      final response = await _apiClient.get(
        url: '${ApiUrl.baseUrl}${ApiUrl.getAllContact}$id/',
        isBasic: false,
        showResult: true,
        context: context,
      );

      if (response.statusCode == 200) {
        return Contact.fromApiJson(response.body);
      } else {
        throw Exception('Failed to load contact: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching contact: $e');
    }
  }

  /// Search contacts by query
  static Future<List<Contact>> searchContacts({
    required String query,
    required BuildContext context,
  }) async {
    try {
      final response = await _apiClient.get(
        url: '${ApiUrl.baseUrl}${ApiUrl.getAllContact}?search=$query',
        isBasic: false,
        showResult: true,
        context: context,
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.body as List<dynamic>;
        return jsonList.map((json) => Contact.fromApiJson(json)).toList();
      } else {
        throw Exception('Failed to search contacts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error searching contacts: $e');
    }
  }

  /// Bulk delete contacts
  static Future<bool> bulkDeleteContacts({
    required List<int> contactIds,
    required BuildContext context,
  }) async {
    try {
      final response = await _apiClient.post(
        url: '${ApiUrl.baseUrl}${ApiUrl.getAllContact}bulk_delete/',
        isBasic: false,
        body: {'contact_ids': contactIds},
        context: context,
        showResult: true,
      );

      return response.statusCode == 200 || response.statusCode == 204;
    } catch (e) {
      throw Exception('Error bulk deleting contacts: $e');
    }
  }

  /// Upload contact photo separately
  static Future<String?> uploadContactPhoto({
    required int contactId,
    required File photoFile,
    required BuildContext context,
  }) async {
    try {
      List<MultipartBody> multipartFiles = [
        MultipartBody('photo', photoFile),
      ];

      final response = await _apiClient.multipartRequest(
        url: '${ApiUrl.baseUrl}${ApiUrl.getAllContact}$contactId/upload_photo/',
        reqType: 'PATCH',
        isBasic: false,
        body: {},
        multipartBody: multipartFiles,
        showResult: true,
      );

      if (response.statusCode == 200) {
        return response.body['photo'];
      } else {
        throw Exception('Failed to upload photo: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error uploading photo: $e');
    }
  }

  /// Upload contact voice file separately
  static Future<String?> uploadContactVoice({
    required int contactId,
    required File voiceFile,
    required BuildContext context,
  }) async {
    try {
      List<MultipartBody> multipartFiles = [
        MultipartBody('voice', voiceFile),
      ];

      final response = await _apiClient.multipartRequest(
        url: '${ApiUrl.baseUrl}${ApiUrl.getAllContact}$contactId/upload_voice/',
        reqType: 'PATCH',
        isBasic: false,
        body: {},
        multipartBody: multipartFiles,
        showResult: true,
      );

      if (response.statusCode == 200) {
        return response.body['voice'];
      } else {
        throw Exception('Failed to upload voice: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error uploading voice: $e');
    }
  }

  /// Sync local contacts with server
  static Future<List<Contact>> syncContacts({
    required List<Contact> localContacts,
    required BuildContext context,
  }) async {
    try {
      List<Map<String, dynamic>> contactsData = localContacts
          .where((contact) => !contact.isApiContact)
          .map((contact) => contact.toJson())
          .toList();

      final response = await _apiClient.post(
        url: '${ApiUrl.baseUrl}${ApiUrl.getAllContact}sync/',
        isBasic: false,
        body: {'contacts': contactsData},
        context: context,
        showResult: true,
      );

      if (response.statusCode == 200) {
        final List<dynamic> jsonList = response.body as List<dynamic>;
        return jsonList.map((json) => Contact.fromApiJson(json)).toList();
      } else {
        throw Exception('Failed to sync contacts: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error syncing contacts: $e');
    }
  }

  /// Get contact statistics
  static Future<Map<String, dynamic>> getContactStats(
      BuildContext context) async {
    try {
      final response = await _apiClient.get(
        url: '${ApiUrl.baseUrl}${ApiUrl.getAllContact}stats/',
        isBasic: false,
        showResult: true,
        context: context,
      );

      if (response.statusCode == 200) {
        return response.body as Map<String, dynamic>;
      } else {
        throw Exception('Failed to load contact stats: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error fetching contact stats: $e');
    }
  }
}
