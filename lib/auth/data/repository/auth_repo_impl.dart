import 'package:dartz/dartz.dart';
import 'package:ecommerce/api_manager/api_failures.dart';
import 'package:ecommerce/auth/data/data_sources/auth_remote_ds.dart';
import 'package:ecommerce/auth/data/mapper/auth_mapper.dart';
import 'package:ecommerce/auth/data/models/response/auth_response_dm.dart';

import 'package:ecommerce/auth/domain/entities/user_entity.dart';
import 'package:ecommerce/auth/domain/repo_contract/auth_repo_contract.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepoContract)
class AuthRepoImpl implements AuthRepoContract {
  AuthRemoteDS authDataSource;
  AuthMapper mapper;
  AuthRepoImpl(this.authDataSource, this.mapper);
  @override
  Future<Either<ApiFailures, UserEntity>> register(
    String email,
    String name,
    String phone,
    String password,
    String rePassword,
  ) async {
    final response = await authDataSource.register(
      email,
      name,
      phone,
      password,
      rePassword,
    );

    final payload = (response.data != null) ? response.data : response;

    if (payload == null) {
      return Left(
        ApiFailures(errorMessage: 'Empty response from register API'),
      );
    }
    final UserEntity data= User.fromJson(payload);
    return Right(data);
  }

  @override
  Future<Either<ApiFailures, void>> login(String email, String password)async {
    final response = await authDataSource.login(
      email,

      password,
    );
    final payload = (response.data != null) ? response.data : response;

    if (payload == null) {
      return Left(
        ApiFailures(errorMessage: 'Empty response from register API'),
      );
    }
    final UserEntity data= User.fromJson(payload);
    return Right(data);
  }
  }
