import 'package:dio/dio.dart';

abstract class AuthRemoteDS {
  Future<Response> register(
    String email,
    String name,
    String phone,
    String password,
    String rePassword,
  );
  Future<Response> updateProfileData({
    required String email,
    required String name,
    required String phone,
  });
  Future<Response> updatePass(String currentPass, String newPass);
  Future<Response> login(String email, String password);
  // Future<Either<ApiFailures, AuthResponseDm>> login(String email, String password)
}
