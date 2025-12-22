import 'package:json_annotation/json_annotation.dart';
part 'update_data_response.g.dart';

@JsonSerializable()
class UpdateDataResponse {
  final String message;

  // only exists on success
  final UserDto? user;

  // only exists on error
  final ErrorDetailsDto? errors;

  UpdateDataResponse({required this.message, this.user, this.errors});

  factory UpdateDataResponse.fromJson(Map<String, dynamic> json) =>
      _$UpdateDataResponseFromJson(json);

  Map<String, dynamic> toJson() => _$UpdateDataResponseToJson(this);
}

@JsonSerializable()
class UserDto {
  final String name;
  final String email;
  final String role;

  UserDto({required this.name, required this.email, required this.role});

  factory UserDto.fromJson(Map<String, dynamic> json) =>
      _$UserDtoFromJson(json);

  Map<String, dynamic> toJson() => _$UserDtoToJson(this);
}

@JsonSerializable()
class ErrorDetailsDto {
  final String value;
  final String msg;
  final String param;
  final String location;

  ErrorDetailsDto({
    required this.value,
    required this.msg,
    required this.param,
    required this.location,
  });

  factory ErrorDetailsDto.fromJson(Map<String, dynamic> json) =>
      _$ErrorDetailsDtoFromJson(json);

  Map<String, dynamic> toJson() => _$ErrorDetailsDtoToJson(this);
}
