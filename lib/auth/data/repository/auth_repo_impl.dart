import 'package:dartz/dartz.dart';
import 'package:ecommerce/api_manager/api_failures.dart';
import 'package:ecommerce/auth/data/data_sources/auth_remote_ds.dart';
import 'package:ecommerce/auth/data/mapper/auth_mapper.dart';
import 'package:ecommerce/auth/data/models/response/auth_response_dm.dart';
import 'package:ecommerce/auth/data/models/response/update_data_response.dart';

import 'package:ecommerce/auth/domain/repo_contract/auth_repo_contract.dart';
import 'package:ecommerce/core/local_storage/shared_prefe_services.dart';
import 'package:flutter/material.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepoContract)
class AuthRepoImpl implements AuthRepoContract {
  AuthRemoteDS authDataSource;
  AuthMapper mapper;
  SharedPrefeServices services = SharedPrefeServices();

  AuthRepoImpl(this.authDataSource, this.mapper);
  @override
  Future<Either<ApiFailures, void>> register(
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
    final AuthResponseDm body = AuthResponseDm.fromJson(response.data);
    if (response.statusCode == null ||
        response.statusCode! < 200 ||
        response.statusCode! >= 300) {
      return Left(
        ApiFailures(
          errorMessage:
              body.message ??
              "Unknown error occurred during login, please try again.",
        ),
      );
    } else {
      services.saveSecureString("token", body.token ?? "none");
      debugPrint("token recieved:${body.token}");
      debugPrint("token saved:${services.getSecureString("token")}");

      return Right(null);
    }
  }

  @override
  Future<Either<ApiFailures, void>> login(String email, String password) async {
    final response = await authDataSource.login(email, password);
    final AuthResponseDm body = AuthResponseDm.fromJson(response.data);
    if (response.statusCode == null ||
        response.statusCode! < 200 ||
        response.statusCode! >= 300) {
      return Left(
        ApiFailures(
          errorMessage:
              body.message ??
              "Unknown error occurred during login, please try again.",
        ),
      );
    } else {
      services.saveSecureString("token", body.token ?? "none");
      debugPrint("token recieved:${body.token}");
      debugPrint("token saved:${services.getSecureString("token")}");

      return Right(null);
    }
  }

  @override
  Future<Either<ApiFailures, void>> updateData(
   { required String email,
    required String phone,
    required String name,}
  ) async {
    final response = await authDataSource.updateProfileData(email: email,name: name,phone: phone);
    final UpdateDataResponse body = UpdateDataResponse.fromJson(response.data);
    if (response.statusCode == null ||
        response.statusCode! < 200 ||
        response.statusCode! >= 300) {
      return Left(
        ApiFailures(
          errorMessage:
              body.errors?.msg??
              "Unknown error occurred during login, please try again.",
        ),
      );
    } else {
      return Right(null);
    }
  }

  @override
  Future<Either<ApiFailures, void>> updatePass(String current, String pass)  async {
    final response = await authDataSource.updatePass(current,pass);
    final UpdateDataResponse body = UpdateDataResponse.fromJson(response.data);
    if (response.statusCode == null ||
        response.statusCode! < 200 ||
        response.statusCode! >= 300) {
      return Left(
        ApiFailures(
          errorMessage:
              body.errors?.msg??
              "Unknown error occurred during login, please try again.",
        ),
      );
    } else {
      return Right(null);
    }
  }
}
