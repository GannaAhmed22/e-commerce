import 'package:dartz/dartz.dart';
import 'package:ecommerce/api_manager/api_failures.dart';
import 'package:ecommerce/layout/home/domain/entities/category_entity.dart';

abstract class CateogryRepoContracts {
  Future<Either<ApiFailures,List<CategoryEntity>>>getCategories();
}