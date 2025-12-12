import 'package:dartz/dartz.dart';
import 'package:ecommerce/api_manager/api_failures.dart';
import 'package:ecommerce/auth/domain/repo_contract/auth_repo_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class LoginUseCase{
  AuthRepoContract repoContract;
  LoginUseCase(this.repoContract);
  Future<Either<ApiFailures, void>>invoke( String email,
      String password,)async{
    return await repoContract.login(email,password);
  }
}
