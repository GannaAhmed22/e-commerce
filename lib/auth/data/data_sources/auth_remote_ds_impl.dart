import 'package:dio/dio.dart';
import 'package:ecommerce/api_manager/api_constants.dart';
import 'package:ecommerce/auth/data/data_sources/auth_remote_ds.dart';
import 'package:ecommerce/core/local_storage/shared_prefe_services.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRemoteDS)
class AuthRemoteDsImpl implements AuthRemoteDS {
  final Dio _dio;
  final localStorage = SharedPrefeServices();

  AuthRemoteDsImpl(this._dio);

  @override
  Future<Response> register(
    String email,
    String name,
    String phone,
    String password,
    String rePassword,
  ) async {
    try {
      final response = await _dio.post(
        '${ApiConstants.baseURL}${ApiConstants.signUp}',
        data: {
          "name": name,
          "email": email,
          "password": password,
          "rePassword": rePassword,
          "phone": phone,
        },
      );

      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response;
      } else {
        throw DioException(
          requestOptions: response.requestOptions,
          response: response,
          message: 'Unexpected status code: ${response.statusCode}',
          type: DioExceptionType.badResponse,
        );
      }
    } on DioException catch (e) {
      throw Exception('Register failed: ${e.response?.data ?? e.message}');
    }
  }

  @override
  Future<Response> login(String email, String password) async {
    try {
      final response = await _dio.post(
        '${ApiConstants.baseURL}${ApiConstants.signIn}',
        data: {"email": email, "password": password},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response;
      } else {
        throw Exception("unexpeted status code:${response.statusCode}");
      }
    } on DioException catch (e) {
      // returning only server body , only care about error message
      return e.response!;
    }
  }

  @override
  Future<Response> updatePass(String currentPass, String newPass) async {
    // response when success like login's response
    try {
      final response = await _dio.post(
        '${ApiConstants.baseURL}${ApiConstants.updatePass}',
        options: Options(
          headers: {"token": localStorage.getSecureString("token")},
        ),
        data: {
          "currentPassword": currentPass,
          "password": newPass,
          "rePassword": newPass,
        },
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response;
      } else {
        throw Exception("unexpeted status code:${response.statusCode}");
      }
    } on DioException catch (e) {
      // returning only server body , only care about error message
      return e.response!;
    }
  }

  @override
  Future<Response> updateProfileData(
   {required String email,
    required String name,
    required String phone,}
  ) async {
    // should change email always
    try {
      final response = await _dio.post(
        '${ApiConstants.baseURL}${ApiConstants.updateData}',
        data: {"name": name, "email": email, "phone": phone},
      );
      if (response.statusCode! >= 200 && response.statusCode! < 300) {
        return response;
      } else {
        throw Exception("unexpeted status code:${response.statusCode}");
      }
    } on DioException catch (e) {
      // returning only server body , only care about error message
      return e.response!;
    }
  }
}
