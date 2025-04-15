import 'package:e_commerce_app_clean/core/errors/failures.dart';
import 'package:e_commerce_app_clean/features/auth_feature/domain/entities/register_response_entity.dart';

abstract class AuthStates {}

class RegisterInitialState extends AuthStates {}

class RegisterLoadingState extends AuthStates {}

class RegisterSuccessState extends AuthStates {
  RegisterResponseEntity responseEntity;

  RegisterSuccessState({required this.responseEntity});
}

class RegisterErrorState extends AuthStates {
  Failures error;

  RegisterErrorState({required this.error});
}
