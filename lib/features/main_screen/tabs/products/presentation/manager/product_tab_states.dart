import 'package:e_commerce_app_clean/core/errors/failures.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/domain/entities/products_response_entity.dart';

abstract class ProductTabStates {}

class ProductTabInitialState extends ProductTabStates {}

class ProductTabLoadingState extends ProductTabStates {}

class ProductTabErrorState extends ProductTabStates {
  Failures error;

  ProductTabErrorState({required this.error});
}

class ProductTabSuccessState extends ProductTabStates {
  ProductsResponseEntity response;

  ProductTabSuccessState({required this.response});
}
