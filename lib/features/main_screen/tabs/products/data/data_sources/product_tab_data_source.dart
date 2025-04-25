import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_clean/core/api/api_manager.dart';
import 'package:e_commerce_app_clean/core/api/endpoints.dart';
import 'package:e_commerce_app_clean/core/errors/failures.dart';
import 'package:e_commerce_app_clean/core/utils/strings.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/data/models/product_response_dto.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/domain/repositories/product_tab_data_source.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductTabDataSource)
class ProDuctTabDataSourceImpl implements ProductTabDataSource {
  ApiManager apiManager;

  ProDuctTabDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, ProductResponseDto>> getAllProducts() async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await (Connectivity().checkConnectivity());
      if (connectivityResult.contains(ConnectivityResult.mobile) ||
          connectivityResult.contains(ConnectivityResult.wifi)) {
        var jsonResponse = await apiManager.getData(
          endPoint: EndPoints.getAllProducts,
        );
        var productResponse = ProductResponseDto.fromJson(jsonResponse.data);
        if (jsonResponse.statusCode! >= 200 && jsonResponse.statusCode! < 300) {
          return Right(productResponse);
        } else {
          return Left(ServerError(errorMessage: productResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppStrings.noInternet));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
