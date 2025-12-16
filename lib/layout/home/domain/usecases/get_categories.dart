import 'package:dartz/dartz.dart';
import 'package:ecommerce/api_manager/api_failures.dart';
import 'package:ecommerce/layout/home/domain/entities/category_entity.dart';
import 'package:ecommerce/layout/home/domain/repository_contracts/cateogry_repo_contracts.dart';
import 'package:injectable/injectable.dart';

@injectable
class GetCategoriesUsecase {
  final CateogryRepoContracts cateogryRepo;
  GetCategoriesUsecase(this.cateogryRepo);
  Future<Either<ApiFailures, List<CategoryEntity>>>invoke()async{
    return await cateogryRepo.getCategories();
  }

}