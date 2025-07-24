import 'package:flutter/material.dart';
import 'dart:io';

class Contact {
  // Common fields
  String? id; // For local contacts
  int? apiId; // For API contacts
  String firstName;
  String lastName;
  String phoneNumber;
  String message;

  // Local-specific fields
  String? profileImagePath;
  String? voiceFilePath;
  String? voiceFileName;
  String? themeId;
  DateTime? createdAt;
  DateTime? updatedAt;

  // API-specific fields
  String? user;
  String? photo; // URL from API
  String? ringtone;
  String? voice; // URL from API
  String? theme;

  // Contact type indicator
  bool isApiContact;

  Contact({
    this.id,
    this.apiId,
    this.user,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.message,
    this.profileImagePath,
    this.voiceFilePath,
    this.voiceFileName,
    this.themeId,
    this.photo,
    this.ringtone,
    this.voice,
    this.theme,
    this.createdAt,
    this.updatedAt,
    this.isApiContact = false,
  });

  // Factory for creating from API response
  factory Contact.fromApiJson(Map<String, dynamic> json) {
    return Contact(
      apiId: json['id'] ?? 0,
      user: json['user'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      message: json['message'] ?? '',
      photo: json['photo'],
      ringtone: json['ringtone'],
      voice: json['voice'],
      theme: json['theme'],
      isApiContact: true,
      createdAt: json['created_at'] != null
          ? DateTime.tryParse(json['created_at'])
          : null,
      updatedAt: json['updated_at'] != null
          ? DateTime.tryParse(json['updated_at'])
          : null,
    );
  }

  // Factory for creating from local JSON
  factory Contact.fromLocalJson(Map<String, dynamic> json) {
    return Contact(
      id: json['id']?.toString(),
      firstName: json['firstName'] ?? '',
      lastName: json['lastName'] ?? '',
      phoneNumber: json['phoneNumber'] ?? '',
      message: json['message'] ?? '',
      profileImagePath: json['profileImagePath'],
      voiceFilePath: json['voiceFilePath'],
      voiceFileName: json['voiceFileName'],
      themeId: json['themeId'],
      isApiContact: false,
      createdAt: json['createdAt'] != null
          ? DateTime.tryParse(json['createdAt'])
          : null,
      updatedAt: json['updatedAt'] != null
          ? DateTime.tryParse(json['updatedAt'])
          : null,
    );
  }

  // Generic factory that auto-detects type
  factory Contact.fromJson(Map<String, dynamic> json) {
    // Check if it's an API contact (has 'user' field or 'first_name')
    if (json.containsKey('user') || json.containsKey('first_name')) {
      return Contact.fromApiJson(json);
    } else {
      return Contact.fromLocalJson(json);
    }
  }

  String get fullName => '$firstName $lastName'.trim();

  String get initials {
    String first = firstName.isNotEmpty ? firstName[0].toUpperCase() : '';
    return '$first'.isNotEmpty ? '$first' : 'C';
  }

  // Get the contact's unique identifier
  String get uniqueId => isApiContact ? apiId.toString() : (id ?? '');

  // Get profile image (local file or API URL)
  String? get profileImageSource => isApiContact ? photo : profileImagePath;

  // Get voice file (local file or API URL)
  String? get voiceSource => isApiContact ? voice : voiceFilePath;

  Map<String, dynamic> toJson() {
    if (isApiContact) {
      return {
        'id': apiId,
        'user': user,
        'first_name': firstName,
        'last_name': lastName,
        'phone_number': phoneNumber,
        'message': message,
        'photo': photo,
        'ringtone': ringtone,
        'voice': voice,
        'theme': theme,
        'created_at': createdAt?.toIso8601String(),
        'updated_at': updatedAt?.toIso8601String(),
      };
    } else {
      return {
        'id': id,
        'firstName': firstName,
        'lastName': lastName,
        'phoneNumber': phoneNumber,
        'message': message,
        'profileImagePath': profileImagePath,
        'voiceFilePath': voiceFilePath,
        'voiceFileName': voiceFileName,
        'themeId': themeId,
        'createdAt': createdAt?.toIso8601String(),
        'updatedAt': updatedAt?.toIso8601String(),
      };
    }
  }

  // For multipart form data (API updates)
  Map<String, String> toFormData() {
    return {
      if (firstName.isNotEmpty) 'first_name': firstName,
      if (lastName.isNotEmpty) 'last_name': lastName,
      if (phoneNumber.isNotEmpty) 'phone_number': phoneNumber,
      if (message.isNotEmpty) 'message': message,
      if (ringtone != null) 'ringtone': ringtone!,
      if (theme != null) 'theme': theme!,
    };
  }

  // For create API (different field name)
  Map<String, String> toCreateFormData() {
    return {
      if (fullName.isNotEmpty) 'name': fullName,
      if (phoneNumber.isNotEmpty) 'phone_number': phoneNumber,
      if (message.isNotEmpty) 'message': message,
      if (ringtone != null) 'ringtone': ringtone!,
      if (theme != null) 'theme': theme!,
    };
  }

  // Convert to the format used in defaultCallers
  Map<String, dynamic> toDefaultCallerFormat() {
    return {
      'id': uniqueId,
      'initials': initials,
      'name': fullName.isNotEmpty ? fullName : firstName,
      'message': message.isNotEmpty ? message : 'No message available',
      'color': _getColorForName(firstName),
      'isDefault': true,
      'apiContact': isApiContact ? this : null,
      'contact': !isApiContact ? this : null,
      'isApiContact': isApiContact,
    };
  }

  static Color _getColorForName(String name) {
    switch (name.toLowerCase()) {
      case 'mom':
        return Colors.red[200]!;
      case 'dad':
        return Colors.orange[200]!;
      case 'love':
        return Colors.green[200]!;
      default:
        return Colors.blue[200]!;
    }
  }

  // Copy with method for updates
  Contact copyWith({
    String? id,
    int? apiId,
    String? user,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? message,
    String? profileImagePath,
    String? voiceFilePath,
    String? voiceFileName,
    String? themeId,
    String? photo,
    String? ringtone,
    String? voice,
    String? theme,
    DateTime? createdAt,
    DateTime? updatedAt,
    bool? isApiContact,
  }) {
    return Contact(
      id: id ?? this.id,
      apiId: apiId ?? this.apiId,
      user: user ?? this.user,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      message: message ?? this.message,
      profileImagePath: profileImagePath ?? this.profileImagePath,
      voiceFilePath: voiceFilePath ?? this.voiceFilePath,
      voiceFileName: voiceFileName ?? this.voiceFileName,
      themeId: themeId ?? this.themeId,
      photo: photo ?? this.photo,
      ringtone: ringtone ?? this.ringtone,
      voice: voice ?? this.voice,
      theme: theme ?? this.theme,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
      isApiContact: isApiContact ?? this.isApiContact,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    if (other is! Contact) return false;

    if (isApiContact && other.isApiContact) {
      return apiId == other.apiId;
    } else if (!isApiContact && !other.isApiContact) {
      return id == other.id;
    }
    return false;
  }

  @override
  int get hashCode {
    return isApiContact ? apiId.hashCode : id.hashCode;
  }

  @override
  String toString() {
    return 'Contact(${isApiContact ? 'API' : 'Local'}: $fullName, $phoneNumber)';
  }
}
