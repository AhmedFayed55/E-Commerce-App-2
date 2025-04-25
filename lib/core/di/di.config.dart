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
import '../../features/main_screen/tabs/home/data/data_sources/home_data_source_impl.dart'
    as _i1014;
import '../../features/main_screen/tabs/home/data/repositories/home_repository_impl.dart'
    as _i656;
import '../../features/main_screen/tabs/home/domain/repositories/data_source/home_data_source.dart'
    as _i32;
import '../../features/main_screen/tabs/home/domain/repositories/repo/home_repository.dart'
    as _i833;
import '../../features/main_screen/tabs/home/domain/use_cases/get_all_brands_use_case.dart'
    as _i519;
import '../../features/main_screen/tabs/home/domain/use_cases/get_all_categories_use_case.dart'
    as _i1069;
import '../../features/main_screen/tabs/home/presentation/manager/home_tab_view_model.dart'
    as _i986;
import '../../features/main_screen/tabs/products/data/data_sources/product_tab_data_source.dart'
    as _i1005;
import '../../features/main_screen/tabs/products/data/repositories/product_tab_repo_impl.dart'
    as _i744;
import '../../features/main_screen/tabs/products/domain/repositories/product_tab_data_source.dart'
    as _i621;
import '../../features/main_screen/tabs/products/domain/repositories/product_tab_repo.dart'
    as _i1067;
import '../../features/main_screen/tabs/products/domain/use_cases/product_tab_use_case.dart'
    as _i296;
import '../../features/main_screen/tabs/products/presentation/manager/product_tab_view_model.dart'
    as _i980;
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
    gh.factory<_i32.HomeDataSource>(
      () => _i1014.HomeDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
    );
    gh.factory<_i621.ProductTabDataSource>(
      () =>
          _i1005.ProDuctTabDataSourceImpl(apiManager: gh<_i1047.ApiManager>()),
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
    gh.factory<_i1067.ProductTabRepo>(
      () => _i744.ProductTabRepoImpl(
        productTabDataSource: gh<_i621.ProductTabDataSource>(),
      ),
    );
    gh.factory<_i833.HomeRepository>(
      () => _i656.HomeRepositoryImpl(homeDataSource: gh<_i32.HomeDataSource>()),
    );
    gh.factory<_i296.ProductTabUseCase>(
      () =>
          _i296.ProductTabUseCase(productTabRepo: gh<_i1067.ProductTabRepo>()),
    );
    gh.factory<_i519.GetAllBrandsUseCase>(
      () =>
          _i519.GetAllBrandsUseCase(homeRepository: gh<_i833.HomeRepository>()),
    );
    gh.factory<_i1069.GetAllCategoriesUseCase>(
      () => _i1069.GetAllCategoriesUseCase(
        homeRepository: gh<_i833.HomeRepository>(),
      ),
    );
    gh.factory<_i986.HomeTabViewModel>(
      () => _i986.HomeTabViewModel(
        getAllCategoriesUseCase: gh<_i1069.GetAllCategoriesUseCase>(),
        getAllBrandsUseCase: gh<_i519.GetAllBrandsUseCase>(),
      ),
    );
    gh.factory<_i980.ProductTabViewModel>(
      () => _i980.ProductTabViewModel(useCase: gh<_i296.ProductTabUseCase>()),
    );
    return this;
  }
}
