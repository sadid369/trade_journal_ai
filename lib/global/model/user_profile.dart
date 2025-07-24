import '../../service/api_url.dart';

class UserProfile {
  final int id;
  final String email;
  final String name;
  final bool isAdmin;
  final String? image;

  UserProfile({
    required this.id,
    required this.email,
    required this.name,
    required this.isAdmin,
    this.image,
  });

  factory UserProfile.fromJson(Map<String, dynamic> json) {
    return UserProfile(
      id: json['id'] ?? 0,
      email: json['email'] ?? '',
      name: json['name'] ?? '',
      isAdmin: json['is_admin'] ?? false,
      image: json['image'],
    );
  }

  String get initials {
    List<String> nameParts = name.split(' ');
    if (nameParts.length >= 2) {
      return '${nameParts[0][0]}${nameParts[1][0]}'.toUpperCase();
    } else if (nameParts.isNotEmpty) {
      return nameParts[0][0].toUpperCase();
    }
    return 'U';
  }

  String get fullImageUrl {
    if (image != null && image!.isNotEmpty) {
      return '${ApiUrl.baseUrl}$image';
    }
    return '';
  }
}
