import 'package:e_commerce_app_clean/config/routes.dart';
import 'package:e_commerce_app_clean/core/di/di.dart';
import 'package:e_commerce_app_clean/core/utils/dialogue_utils.dart';
import 'package:e_commerce_app_clean/features/auth_feature/presentation/manager/Auth_cubit.dart';
import 'package:e_commerce_app_clean/features/auth_feature/presentation/manager/auth_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/components/custom_elevated_button.dart';
import '../../../../core/components/custom_text_form_field.dart';
import '../../../../core/utils/app_assets.dart';
import '../../../../core/utils/app_colors.dart';
import '../../../../core/utils/app_styles.dart';
import '../../../../core/utils/validators.dart';

class RegisterScreenView extends StatefulWidget {
  @override
  State<RegisterScreenView> createState() => _RegisterScreenViewState();
}

class _RegisterScreenViewState extends State<RegisterScreenView> {
  AuthViewModel viewModel = getIt<AuthViewModel>();

  @override
  Widget build(BuildContext context) {
    return BlocListener<AuthViewModel, AuthStates>(
      bloc: viewModel,
      listener: (context, state) {
        if (state is RegisterLoadingState) {
          DialogueUtils.showLoading(
            context: context,
            message: "Loading.........",
          );
        } else if (state is RegisterErrorState) {
          DialogueUtils.hideLoading(context);
          DialogueUtils.showMessage(
            context: context,
            message: state.error.errorMessage,
            posActionName: "OK",
            title: "Error",
          );
        } else if (state is RegisterSuccessState) {
          DialogueUtils.hideLoading(context);
          DialogueUtils.showMessage(
            context: context,
              message: "Register Successfully",
            posActionName: "OK",
            title: "Success",
              posAction: () {
                GoRouter.of(context).push(AppRoutes.loginRoute);
              }
          );
        }
      },
      child: Scaffold(
        appBar: AppBar(backgroundColor: AppColors.primaryColor),
        backgroundColor: AppColors.primaryColor,
        body: SingleChildScrollView(
          child: Form(
            key: viewModel.formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(AppImages.routeImageWhite),
                SizedBox(height: 40.h),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 15.w),
                  child: Column(
                    spacing: 15.h,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Full Name", style: AppStyles.medium18White),
                      CustomTextFormField(
                        controller: viewModel.fullNameController,
                        validator: AppValidators.validateFullName,
                        hintText: "enter your full name",
                      ),
                      Text("Mobile Number", style: AppStyles.medium18White),
                      CustomTextFormField(
                        controller: viewModel.phoneController,
                        hintText: "enter your mobile no.",
                        validator: AppValidators.validatePhoneNumber,
                      ),
                      Text("Email Address", style: AppStyles.medium18White),
                      CustomTextFormField(
                        controller: viewModel.emailController,
                        hintText: "enter your email address",
                        validator: AppValidators.validateEmail,
                      ),
                      Text("Password", style: AppStyles.medium18White),
                      CustomTextFormField(
                        controller: viewModel.passwordController,
                        hintText: "enter your password",
                        validator: AppValidators.validatePassword,
                      ),
                      Text("Re-Password", style: AppStyles.medium18White),
                      CustomTextFormField(
                        controller: viewModel.rePasswordController,
                        hintText: "enter your re-password",
                        validator: AppValidators.validatePassword,
                      ),
                      SizedBox(height: 15.h),
                      CustomElevatedButton(
                        text: "Sign up",
                        onTap: () {
                          viewModel.register();
                        },
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
