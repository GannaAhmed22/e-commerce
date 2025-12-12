import 'package:dartz/dartz.dart';
import 'package:ecommerce/api_manager/api_failures.dart';
import 'package:ecommerce/auth/domain/repo_contract/auth_repo_contract.dart';
import 'package:injectable/injectable.dart';
@injectable
class RegisterUseCase{
  AuthRepoContract repoContract;
  RegisterUseCase(this.repoContract);
  Future<Either<ApiFailures, void>>invoke( String email,
      String name,
      String phone,
      String password,
      String rePassword,)async{
    return await repoContract.register(email, name, phone, password, rePassword);
  }
}