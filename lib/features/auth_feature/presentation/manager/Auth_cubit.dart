import 'package:e_commerce_app_clean/features/auth_feature/domain/use_cases/register_use_case.dart';
import 'package:e_commerce_app_clean/features/auth_feature/presentation/manager/auth_states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/login_use_case.dart';

@injectable
class AuthViewModel extends Cubit<AuthStates> {
  RegisterUseCase registerUseCase;
  LoginUseCase loginUseCase;

  AuthViewModel({required this.registerUseCase, required this.loginUseCase})
      : super(AuthInitialState());

  TextEditingController fullNameController = TextEditingController(
    text: "Ahmed Fayed",
  );
  TextEditingController passwordController = TextEditingController(
    text: "Ahmedfayed@55",
  );
  TextEditingController rePasswordController = TextEditingController(
    text: "Ahmedfayed@55",
  );
  TextEditingController phoneController = TextEditingController(
    text: "01096640218",
  );
  TextEditingController emailController = TextEditingController(
    text: "ahmedfaid542@gmail.com",
  );
  var formKey = GlobalKey<FormState>();

  void register() async {
    if (formKey.currentState?.validate() == true) {
      emit(RegisterLoadingState());
      var either = await registerUseCase.execute(
        fullNameController.text,
        emailController.text,
        passwordController.text,
        rePasswordController.text,
        phoneController.text,
      );
      either.fold(
        (error) {
          emit(RegisterErrorState(error: error));
        },
        (response) {
          emit(RegisterSuccessState(responseEntity: response));
        },
      );
    }
  }

  void login() async {
    if (formKey.currentState!.validate() == true) {
      emit(LoginLoadingState());
      var either = await loginUseCase.invoke(
          emailController.text, passwordController.text);
      either.fold((error) {
        emit(LoginErrorState(error: error));
      }, (response) {
        emit(LoginSuccessState(response: response));
      });
    }
  }
}
