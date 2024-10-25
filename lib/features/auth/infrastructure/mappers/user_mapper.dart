import 'package:teslo_app/features/auth/domain/domain.dart';

class UserMapper {
  static User userApiV1ResponseToEntity(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      email: json['email'],
      fullName: json['fullName'],
      isActive: json['isActive'],
      roles: List<String>.from(json['roles']),
      token: json['token'] ?? '',
    );
  }
}
