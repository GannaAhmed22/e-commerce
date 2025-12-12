import 'package:json_annotation/json_annotation.dart';
part 'auth_response_dm.g.dart';

@JsonSerializable()
class AuthResponseDm {
  final String? message;
  final User? user;
  final String? token;

  AuthResponseDm({this.message, this.user, this.token});

  factory AuthResponseDm.fromJson(Map<String, dynamic> json) => _$AuthResponseDmFromJson(json);
  Map<String, dynamic> toJson() => _$AuthResponseDmToJson(this);
}

@JsonSerializable()
class User {
  final String? id;
  final String? name;

  User({this.id, this.name});

  factory User.fromJson(Map<String, dynamic> json) => _$UserFromJson(json);
  Map<String, dynamic> toJson() => _$UserToJson(this);
}

