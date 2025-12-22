import 'package:dartz/dartz.dart';
import 'package:ecommerce/api_manager/api_failures.dart';
import 'package:ecommerce/auth/domain/repo_contract/auth_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdateDataUsecase {
  AuthRepoContract repoContract;
  UpdateDataUsecase(this.repoContract);
  Future<Either<ApiFailures, void>> invoke({
    required String email,
    required String name,
    required String phone,
  }) async {
    return await repoContract.updateData(
      email: email,
      phone: phone,
      name: name,
    );
  }
}
