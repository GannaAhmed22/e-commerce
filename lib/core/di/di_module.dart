// lib/core/network/dio_module.dart
import 'package:dio/dio.dart';
import 'package:ecommerce/api_manager/dio_config.dart';
import 'package:injectable/injectable.dart';

@module
abstract class DioModule {
  @lazySingleton
  Dio get dio => DioConfig().initDio();
}