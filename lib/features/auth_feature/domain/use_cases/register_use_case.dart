import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/errors/failures.dart';
import '../entities/register_response_entity.dart';
import '../repositories/repo/auth_repository.dart';

@injectable
class RegisterUseCase {
  AuthRepository authRepository;

  RegisterUseCase({required this.authRepository});

  Future<Either<Failures, RegisterResponseEntity>> execute(
    String name,
    String email,
    String password,
    String rePassword,
    String phone,
  ) {
    return authRepository.register(name, email, password, rePassword, phone);
  }
}
