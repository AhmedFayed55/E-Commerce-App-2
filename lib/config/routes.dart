import 'package:e_commerce_app_clean/features/auth_feature/presentation/pages/login_screen_view.dart';
import 'package:e_commerce_app_clean/features/main_screen/main_screen.dart';
import 'package:go_router/go_router.dart';

import '../features/auth_feature/presentation/pages/register_screen_view.dart';

class AppRoutes {
  static const String loginRoute = "/";
  static const String registerRoute = "/register";
  static const String mainRoute = "/main";

  static final router = GoRouter(
    routes: [
      GoRoute(path: loginRoute, builder: (context, state) => LoginScreenView()),
      GoRoute(path: loginRoute, builder: (context, state) => MainScreen()),
      GoRoute(
        path: registerRoute,
        builder: (context, state) => RegisterScreenView(),
      ),
    ],
  );
}
