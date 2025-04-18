import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_clean/core/errors/failures.dart';
import 'package:e_commerce_app_clean/features/auth_feature/domain/entities/login_response_entity.dart';
import 'package:e_commerce_app_clean/features/auth_feature/domain/entities/register_response_entity.dart';
import 'package:e_commerce_app_clean/features/auth_feature/domain/repositories/data_source/auth_data_source.dart';
import 'package:e_commerce_app_clean/features/auth_feature/domain/repositories/repo/auth_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: AuthRepository)
class AuthRepositoryImpl implements AuthRepository {
  AuthDataSource authDataSource;

  AuthRepositoryImpl({required this.authDataSource});

  @override
  Future<Either<Failures, RegisterResponseEntity>> register(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) async {
    var either = await authDataSource.register(
      name,
      email,
      password,
      rePassword,
      phone,
    );
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, LoginResponseEntity>> login(String email,
      String password) async {
    var either = await authDataSource.login(email, password);
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
