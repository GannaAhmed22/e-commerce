import 'package:dartz/dartz.dart';
import 'package:ecommerce/api_manager/api_failures.dart';
import 'package:ecommerce/auth/domain/repo_contract/auth_repo_contract.dart';
import 'package:injectable/injectable.dart';

@injectable
class UpdatePassUsecase {
  AuthRepoContract repoContract;
  UpdatePassUsecase(this.repoContract);
  Future<Either<ApiFailures, void>> invoke(
    String current,
    String newPass,
  ) async {
    return await repoContract.updatePass(current, newPass);
  }
}
