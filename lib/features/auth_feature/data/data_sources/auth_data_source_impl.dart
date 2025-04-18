import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:e_commerce_app_clean/core/api/api_manager.dart';
import 'package:e_commerce_app_clean/core/api/endpoints.dart';
import 'package:e_commerce_app_clean/core/errors/failures.dart';
import 'package:e_commerce_app_clean/core/utils/strings.dart';
import 'package:e_commerce_app_clean/features/auth_feature/data/models/register_response_dto.dart';
import 'package:e_commerce_app_clean/features/auth_feature/domain/entities/login_response_entity.dart';
import 'package:e_commerce_app_clean/features/auth_feature/domain/repositories/data_source/auth_data_source.dart';
import 'package:injectable/injectable.dart';

import '../models/login_response_dto.dart';

@Injectable(as: AuthDataSource)
class AuthDataSourceImpl implements AuthDataSource {
  ApiManager apiManager;

  AuthDataSourceImpl({required this.apiManager});

  @override
  Future<Either<Failures, RegisterResponseDto>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    try {
      final List<ConnectivityResult> connectivityResult =
          await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response = await apiManager.postData(
          endPoint: EndPoints.register,
          body: {
            "name": name,
            "email": email,
            "password": password,
            "rePassword": rePassword,
            "phone": phone,
          },
        );
        // todo : response is json so i have to convert
        var registerResponse = RegisterResponseDto.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          return Right(registerResponse);
        } else {
          return Left(ServerError(errorMessage: registerResponse.message!));
        }
      } else {
        // todo : no internet connection
        return Left(NetworkError(errorMessage: AppStrings.noInternet));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(String email,
      String password) async {
    try {
      final List<ConnectivityResult> connectivityResult =
      await Connectivity().checkConnectivity();
      if (connectivityResult.contains(ConnectivityResult.wifi) ||
          connectivityResult.contains(ConnectivityResult.mobile)) {
        var response =
        await apiManager.postData(endPoint: EndPoints.login, body: {
          "email": email,
          "password": password,
        });
        var loginResponse = LoginResponseDm.fromJson(response.data);
        if (response.statusCode! >= 200 && response.statusCode! < 300) {
          // todo: save token  or at login screen when login is success
          // SharedPreferenceUtils.saveData(key: "token", val: loginResponse.token);
          return Right(loginResponse);
        } else {
          return Left(ServerError(errorMessage: loginResponse.message!));
        }
      } else {
        return Left(NetworkError(errorMessage: AppStrings.noInternet));
      }
    } catch (e) {
      return Left(ServerError(errorMessage: e.toString()));
    }
  }
}
