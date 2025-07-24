import 'package:flutter/material.dart';
import 'dart:io';

class ApiContact {
  final int id;
  final String user;
  final String firstName;
  final String lastName;
  final String phoneNumber;
  final String message;
  final String? photo;
  final String? ringtone;
  final String? voice;
  final String? theme;

  ApiContact({
    required this.id,
    required this.user,
    required this.firstName,
    required this.lastName,
    required this.phoneNumber,
    required this.message,
    this.photo,
    this.ringtone,
    this.voice,
    this.theme,
  });

  factory ApiContact.fromJson(Map<String, dynamic> json) {
    return ApiContact(
      id: json['id'] ?? 0,
      user: json['user'] ?? '',
      firstName: json['first_name'] ?? '',
      lastName: json['last_name'] ?? '',
      phoneNumber: json['phone_number'] ?? '',
      message: json['message'] ?? '',
      photo: json['photo'],
      ringtone: json['ringtone'],
      voice: json['voice'],
      theme: json['theme'],
    );
  }

  // For multipart form data
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
      if (fullName.isNotEmpty)
        'name': fullName, // API expects 'name' for create
      if (phoneNumber.isNotEmpty) 'phone_number': phoneNumber,
      if (message.isNotEmpty) 'message': message,
      if (ringtone != null) 'ringtone': ringtone!,
      if (theme != null) 'theme': theme!,
    };
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'user': user,
      'first_name': firstName,
      'last_name': lastName,
      'phone_number': phoneNumber,
      'message': message,
      'photo': photo,
      'ringtone': ringtone,
      'voice': voice,
      'theme': theme,
    };
  }

  String get fullName {
    return '$firstName $lastName'.trim();
  }

  String get initials {
    String first = firstName.isNotEmpty ? firstName[0].toUpperCase() : '';
    return '$first'.isNotEmpty ? '$first' : 'C';
  }

  // Convert to the format used in defaultCallers
  Map<String, dynamic> toDefaultCallerFormat() {
    return {
      'id': id,
      'initials': initials,
      'name': fullName.isNotEmpty ? fullName : firstName,
      'message': message.isNotEmpty ? message : 'No message available',
      'color': _getColorForName(firstName),
      'isDefault': true,
      'apiContact': this,
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
  ApiContact copyWith({
    int? id,
    String? user,
    String? firstName,
    String? lastName,
    String? phoneNumber,
    String? message,
    String? photo,
    String? ringtone,
    String? voice,
    String? theme,
  }) {
    return ApiContact(
      id: id ?? this.id,
      user: user ?? this.user,
      firstName: firstName ?? this.firstName,
      lastName: lastName ?? this.lastName,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      message: message ?? this.message,
      photo: photo ?? this.photo,
      ringtone: ringtone ?? this.ringtone,
      voice: voice ?? this.voice,
      theme: theme ?? this.theme,
    );
  }
}
