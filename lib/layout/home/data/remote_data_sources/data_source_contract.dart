import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:ecommerce/api_manager/api_failures.dart';
import 'package:ecommerce/layout/home/data/models/category_response_model.dart';

abstract class DataSourceContract {
  Future<Response>getCategories();
}