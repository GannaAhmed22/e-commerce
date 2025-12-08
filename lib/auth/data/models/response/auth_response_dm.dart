import 'package:ecommerce/auth/domain/entities/user_entity.dart';

class AuthResponseDm {
  AuthResponseDm({String? message, User? user, String? token}) {
    _message = message;
    _user = user;
    _token = token;
  }

  AuthResponseDm.fromJson(dynamic json) {
    _message = json['message'];
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
    _token = json['token'];
  }
  String? _message;
  User? _user;
  String? _token;

  String? get message => _message;
  User? get user => _user;
  String? get token => _token;
}

class User extends UserEntity {
  final String? _role;

  User({required String name, required String email, String? role})
    : _role = role,
      super(name, email);

  User.fromJson(dynamic json)
    : _role = json['role'],
      super(json['name'], json['email']);

  String? get role => _role;
}
