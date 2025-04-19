import 'package:e_commerce_app_clean/core/cache/shared_prefrence.dart';
import 'package:e_commerce_app_clean/core/di/di.dart';
import 'package:e_commerce_app_clean/features/auth_feature/presentation/manager/Auth_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import '../../../../config/routes.dart';
import '../../../../core/components/custom_elevated_button.dart';
import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/dialogue_utils.dart';
import '../../../../core/utils/validators.dart';
import '../manager/auth_states.dart';

class LoginScreenView extends StatefulWidget {
  @override
  State<LoginScreenView> createState() => _LoginScreenViewState();
}

class _LoginScreenViewState extends State<LoginScreenView> {
  AuthViewModel viewModel = getIt<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthViewModel, AuthStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is LoginLoadingState) {
          DialogueUtils.showMessage(
              context: context, message: "Loading.......");
        } else if (state is LoginErrorState) {
          DialogueUtils.hideLoading(context);
          DialogueUtils.showMessage(
              context: context,
              message: state.error.errorMessage,
              title: "Error",
              posActionName: "OK");
        } else if (state is LoginSuccessState) {
          DialogueUtils.hideLoading(context);
          DialogueUtils.showMessage(
              context: context,
              message: "Login Successfully",
              title: "Success",
              posActionName: "OK",
              posAction: () {
                // todo: save token
                SharedPreferenceUtils.saveData(
                    key: "token", value: state.response.token);
                //todo: navigate to home screen
                GoRouter.of(context).push(AppRoutes.mainRoute);
              });
        }
      },
      child: Scaffold(
        backgroundColor: AppColors.primaryColor,
        appBar: AppBar(backgroundColor: AppColors.primaryColor),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 15.w),
            child: Form(
              key: viewModel.formKey,
              child: Column(
                children: [
                  Image.asset(AppImages.routeImageWhite),
                  SizedBox(height: 75.h),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Welcome Back To Route",
                          style: AppStyles.semi24White),
                      Text(
                        "Please sign in with your mail",
                        style: AppStyles.light16White,
                      ),
                      SizedBox(height: 35.h),
                      Text("Email", style: AppStyles.medium18White),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                        controller: viewModel.emailController,
                        validator: AppValidators.validateEmail,
                        hintText: "enter your Email",
                      ),
                      SizedBox(height: 35.h),
                      Text("Password", style: AppStyles.medium18White),
                      SizedBox(height: 20.h),
                      CustomTextFormField(
                        controller: viewModel.passwordController,
                        suffixIcon: Image.asset(AppImages.hidePassIcon),
                        hintText: "enter your password",
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            "Forget Password",
                            style: AppStyles.regular18White,
                          ),
                        ],
                      ),
                      SizedBox(height: 35.h),
                      CustomElevatedButton(text: "Log in", onTap: () {
                        viewModel.login();
                      }),
                      SizedBox(height: 25.h),
                      InkWell(
                        onTap: () {
                          GoRouter.of(context).push(AppRoutes.registerRoute);
                        },
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Don't Have an Account?",
                                style: AppStyles.medium18White,
                              ),
                              TextSpan(
                                text: "Create Account",
                                style: AppStyles.medium18White,
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
