// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'auth_response_dm.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AuthResponseDm _$AuthResponseDmFromJson(Map<String, dynamic> json) =>
    AuthResponseDm(
      message: json['message'] as String?,
      user: json['user'] == null
          ? null
          : User.fromJson(json['user'] as Map<String, dynamic>),
      token: json['token'] as String?,
    );

Map<String, dynamic> _$AuthResponseDmToJson(AuthResponseDm instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
      'token': instance.token,
    };

User _$UserFromJson(Map<String, dynamic> json) =>
    User(id: json['id'] as String?, name: json['name'] as String?);

Map<String, dynamic> _$UserToJson(User instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
};
