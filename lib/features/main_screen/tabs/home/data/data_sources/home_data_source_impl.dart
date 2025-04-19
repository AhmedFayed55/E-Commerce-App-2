import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_clean/core/api/api_manager.dart';
import 'package:e_commerce_app_clean/core/api/endpoints.dart';
import 'package:e_commerce_app_clean/core/errors/failures.dart';
import 'package:e_commerce_app_clean/core/utils/strings.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/home/data/models/category_or_brand_response_dto.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/home/domain/repositories/data_source/home_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeDataSource)
class HomeDataSourceImpl extends HomeDataSource {
  ApiManager apiManager;

  HomeDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>> getAllBrands() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var jsonResponse = await apiManager.getData(
          endPoint: EndPoints.getAllBrands,
        );
        var brandResponse = CategoryOrBrandResponseDto.fromJson(
          jsonResponse.data,
        );
        if (jsonResponse.statusCode! >= 200 && jsonResponse.statusCode! < 300) {
          return Right(brandResponse);
        } else {
          return Left(ServerError(errorMessage: brandResponse.statusMsg!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppStrings.noInternet));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseDto>>
  getAllCategories() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var jsonResponse = await apiManager.getData(
          endPoint: EndPoints.getAllCategories,
        );
        var categoryResponse = CategoryOrBrandResponseDto.fromJson(
          jsonResponse.data,
        );
        if (jsonResponse.statusCode! >= 200 && jsonResponse.statusCode! < 300) {
          return Right(categoryResponse);
        } else {
          return Left(ServerError(errorMessage: categoryResponse.statusMsg!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppStrings.noInternet));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
