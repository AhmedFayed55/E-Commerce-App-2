// dart format width=80
// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;

import '../../features/auth_feature/data/data_sources/auth_data_source_impl.dart'
    as _i230;
import '../../features/auth_feature/data/repositories/auth_repo_impl.dart'
    as _i364;
import '../../features/auth_feature/domain/repositories/data_source/auth_data_source.dart'
    as _i711;
import '../../features/auth_feature/domain/repositories/repo/auth_repository.dart'
    as _i115;
import '../../features/auth_feature/domain/use_cases/login_use_case.dart'
    as _i603;
import '../../features/auth_feature/domain/use_cases/register_use_case.dart'
    as _i716;
import '../../features/auth_feature/presentation/manager/Auth_cubit.dart'
    as _i604;
import '../api/api_manager.dart' as _i1047;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i1047.ApiManager>(() => _i1047.ApiManager());
    gh.factory<_i711.AuthDataSource>(
      () => _i230.AuthDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i115.AuthRepository>(
      () =>
          _i364.AuthRepositoryImpl(authDataSource: gh<_i711.AuthDataSource>()),
    );
    gh.factory<_i603.LoginUseCase>(
      () => _i603.LoginUseCase(authRepository: gh<_i115.AuthRepository>()),
    );
    gh.factory<_i716.RegisterUseCase>(
      () => _i716.RegisterUseCase(authRepository: gh<_i115.AuthRepository>()),
    );
    gh.factory<_i604.AuthViewModel>(
      () => _i604.AuthViewModel(
        registerUseCase: gh<_i716.RegisterUseCase>(),
        loginUseCase: gh<_i603.LoginUseCase>(),
      ),
    );
    return this;
  }
}
