// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'update_data_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

UpdateDataResponse _$UpdateDataResponseFromJson(Map<String, dynamic> json) =>
    UpdateDataResponse(
      message: json['message'] as String,
      user: json['user'] == null
          ? null
          : UserDto.fromJson(json['user'] as Map<String, dynamic>),
      errors: json['errors'] == null
          ? null
          : ErrorDetailsDto.fromJson(json['errors'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$UpdateDataResponseToJson(UpdateDataResponse instance) =>
    <String, dynamic>{
      'message': instance.message,
      'user': instance.user,
      'errors': instance.errors,
    };

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
  name: json['name'] as String,
  email: json['email'] as String,
  role: json['role'] as String,
);

Map<String, dynamic> _$UserDtoToJson(UserDto instance) => <String, dynamic>{
  'name': instance.name,
  'email': instance.email,
  'role': instance.role,
};

ErrorDetailsDto _$ErrorDetailsDtoFromJson(Map<String, dynamic> json) =>
    ErrorDetailsDto(
      value: json['value'] as String,
      msg: json['msg'] as String,
      param: json['param'] as String,
      location: json['location'] as String,
    );

Map<String, dynamic> _$ErrorDetailsDtoToJson(ErrorDetailsDto instance) =>
    <String, dynamic>{
      'value': instance.value,
      'msg': instance.msg,
      'param': instance.param,
      'location': instance.location,
    };
