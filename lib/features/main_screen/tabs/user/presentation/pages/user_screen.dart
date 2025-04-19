import 'package:e_commerce_app_clean/config/routes.dart';
import 'package:e_commerce_app_clean/core/cache/shared_prefrence.dart';
import 'package:e_commerce_app_clean/core/components/custom_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: CustomElevatedButton(
          backgroundColor: Colors.redAccent,
          text: "logout", onTap: () {
        SharedPreferenceUtils.removeData(key: "token");
        GoRouter.of(context).push(AppRoutes.loginRoute);
      }),
    );
  }
}
