import 'package:dio/dio.dart';
import 'package:ecommerce/api_manager/api_constants.dart';
import 'package:ecommerce/auth/data/data_sources/auth_remote_ds.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: AuthRemoteDS)
class AuthRemoteDsImpl implements AuthRemoteDS {
  final Dio _dio;

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
  Future<Response> login(String email, String password)async {
    try{
      final response = await _dio.post(
        '${ApiConstants.baseURL}${ApiConstants.signIn}',
        data: {
          "email": email,
          "password": password,
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
      throw Exception('Login failed: ${e.response?.data ?? e.message}');
    }
    }
  }
