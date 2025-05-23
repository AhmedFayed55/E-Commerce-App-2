import 'package:e_commerce_app_clean/core/cache/shared_prefrence.dart';
import 'package:e_commerce_app_clean/features/auth_feature/presentation/pages/login_screen_view.dart';
import 'package:e_commerce_app_clean/features/main_screen/main_screen.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/presentation/pages/product_details_screen.dart';
import 'package:e_commerce_app_clean/features/splash_screen/splash_screen.dart';
import 'package:go_router/go_router.dart';

import '../features/auth_feature/presentation/pages/register_screen_view.dart';
import '../features/main_screen/tabs/products/domain/entities/products_response_entity.dart';

class AppRoutes {
  static const String loginRoute = "/login";
  static const String registerRoute = "/register";
  static const String mainRoute = "/mainRoute";
  static const String splashRoute = "/splash";
  static const String productDetails = "/productDetails";

  static final router = GoRouter(
    initialLocation: mainRoute,
    routes: [
      GoRoute(path: splashRoute, builder: (context, state) => SplashScreen()),
      GoRoute(path: loginRoute, builder: (context, state) => LoginScreenView()),
      GoRoute(path: mainRoute, builder: (context, state) => MainScreen()),
      GoRoute(path: registerRoute,
        builder: (context, state) => RegisterScreenView(),),
      GoRoute(path: productDetails, builder: (context, state) {
        final product = state.extra as ProductsDataEntity;
        return ProductDetailsScreen(product: product);
      })
    ],
      redirect: (context, state) {
        final token = SharedPreferenceUtils.getData(key: "token");
        final isLoggingIn = state.matchedLocation == loginRoute;

        if (token != null && token.isNotEmpty) {
          if (isLoggingIn) return mainRoute;
          return null; // اكمّل عادي
        } else {
          // لو مش معاه توكن، امنعه من أي حاجه غير login و register
          final allowedRoutes = [loginRoute, registerRoute, splashRoute];
          if (!allowedRoutes.contains(state.matchedLocation)) {
            return loginRoute;
          }
        }

        return null; // كل حاجة تمام
      }
  );
}
