import 'package:dio/dio.dart';

abstract class AuthRemoteDS {
  Future<Response> register(
    String email,
    String name,
    String phone,
    String password,
    String rePassword,
  );
  Future<Response> login(String email, String password);
}
