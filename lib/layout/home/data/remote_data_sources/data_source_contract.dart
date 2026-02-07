import 'package:dio/dio.dart';

abstract class DataSourceContract {
  Future<Response>getCategories();
}