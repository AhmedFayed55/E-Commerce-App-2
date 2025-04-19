import 'package:e_commerce_app_clean/config/routes.dart';
import 'package:e_commerce_app_clean/core/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    // TODO: implement initState
    Future.delayed(Duration(seconds: 5), () {
      GoRouter.of(context).push(AppRoutes.loginRoute);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primaryColor,
      body: Center(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 10.w),
          child: Lottie.asset('assets/lotties/lottie1.json'),
        ),
      ),
    );
  }
}
