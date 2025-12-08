// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:dio/dio.dart' as _i361;
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../api_manager/dio_config.dart' as _i173;
import '../../auth/data/data_sources/auth_remote_ds.dart' as _i458;
import '../../auth/data/data_sources/auth_remote_ds_impl.dart' as _i428;
import '../../auth/data/mapper/auth_mapper.dart' as _i1039;
import '../../auth/data/repository/auth_repo_impl.dart' as _i869;
import '../../auth/domain/repo_contract/auth_repo_contract.dart' as _i700;
import '../../auth/domain/usecases/login_usecase.dart' as _i442;
import '../../auth/domain/usecases/register_usecase.dart' as _i246;
import '../../auth/presentation/auth_view_model/auth_view_model.dart' as _i1066;
import 'di_module.dart' as _i211;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    final dioModule = _$DioModule();
    gh.factory<_i173.DioConfig>(() => _i173.DioConfig());
    gh.factory<_i1039.AuthMapper>(() => _i1039.AuthMapper());
    gh.lazySingleton<_i361.Dio>(() => dioModule.dio);
    gh.lazySingleton<_i458.AuthRemoteDS>(
      () => _i428.AuthRemoteDsImpl(gh<_i361.Dio>()),
    );
    gh.factory<_i700.AuthRepoContract>(
      () =>
          _i869.AuthRepoImpl(gh<_i458.AuthRemoteDS>(), gh<_i1039.AuthMapper>()),
    );
    gh.factory<_i442.LoginUseCase>(
      () => _i442.LoginUseCase(gh<_i700.AuthRepoContract>()),
    );
    gh.factory<_i246.RegisterUseCase>(
      () => _i246.RegisterUseCase(gh<_i700.AuthRepoContract>()),
    );
    gh.factory<_i1066.AuthCubit>(
      () => _i1066.AuthCubit(
        gh<_i246.RegisterUseCase>(),
        gh<_i442.LoginUseCase>(),
      ),
    );
    return this;
  }
}

class _$DioModule extends _i211.DioModule {}
