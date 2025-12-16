import 'package:dio/dio.dart';
import 'package:ecommerce/api_manager/api_constants.dart';
import 'package:ecommerce/layout/home/data/remote_data_sources/data_source_contract.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: DataSourceContract)
class DataSourceImpl implements DataSourceContract {
  final Dio _dio;
  DataSourceImpl(this._dio);
  @override
  Future<Response> getCategories() async {
    try {
      final response = await _dio.get(
        '${ApiConstants.baseURL}${ApiConstants.categories}',
      );  if (response.statusCode! >= 200 && response.statusCode! < 300) {
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
      throw Exception('loading failed : ${e.response?.data ?? e.message}');
    }
  }
}
