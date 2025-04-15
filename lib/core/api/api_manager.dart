import 'package:dio/dio.dart';
import 'package:e_commerce_app_clean/core/api/api_constatns.dart';
import 'package:e_commerce_app_clean/core/api/endpoints.dart';
import 'package:injectable/injectable.dart';

@singleton
class ApiManager {
  Dio dio = Dio();

  Future<Response> getData({
    required String endPoint,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
  }) {
    return dio.get(
      ApiConstants.baseUrl + EndPoints.register,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status) => true, headers: headers),
    );
  }

  Future<Response> postData({
    required String endPoint,
    Object? body,
    Map<String, dynamic>? queryParameters,
    Options? options,
    Map<String, dynamic>? headers,
  }) {
    return dio.post(
      ApiConstants.baseUrl + EndPoints.register,
      queryParameters: queryParameters,
      options: Options(validateStatus: (status) => true, headers: headers),
      data: body,
    );
  }
}
