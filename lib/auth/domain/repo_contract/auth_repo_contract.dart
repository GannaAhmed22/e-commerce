import 'package:dartz/dartz.dart';
import 'package:ecommerce/auth/domain/entities/user_entity.dart';

import '../../../api_manager/api_failures.dart';

abstract class AuthRepoContract {
  Future<Either<ApiFailures, UserEntity>> register(
    String email,
    String name,
    String phone,
    String password,
    String rePassword,
  );
  Future<Either<ApiFailures, void>> login(String email, String password);
}
