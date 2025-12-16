import 'package:dartz/dartz.dart';
import 'package:ecommerce/api_manager/api_failures.dart';
import 'package:ecommerce/layout/home/data/mapper/category_mapper.dart';
import 'package:ecommerce/layout/home/data/models/category_response_model.dart';
import 'package:ecommerce/layout/home/data/remote_data_sources/data_source_contract.dart';
import 'package:ecommerce/layout/home/domain/entities/category_entity.dart';
import 'package:ecommerce/layout/home/domain/repository_contracts/cateogry_repo_contracts.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: CateogryRepoContracts)
class CategoryRepoImpl implements CateogryRepoContracts {
  final DataSourceContract dataSource;
  CategoryRepoImpl(this.dataSource);
  
  @override
  Future<Either<ApiFailures, List<CategoryEntity>>> getCategories() async {
    final result = await dataSource.getCategories();
    // result is response
    final resultModel = CategoriesResponse.fromJson(result.data);
    final resultEntity = CategoryMapper.entityToModel(resultModel);
    if (result.statusCode == null ||
        result.statusCode! < 200 ||
        result.statusCode! >= 300) {
      return Left(
        ApiFailures(errorMessage: "Unknown error occurred during Loading"),
      );
    } else {
      return Right(resultEntity);
    }
  }
}
