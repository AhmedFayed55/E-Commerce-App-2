import 'package:e_commerce_app_clean/core/errors/failures.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/home/domain/entities/category_or_brand_response_entity.dart';

abstract class HomeTabSates {}

class HomeTabInitialState extends HomeTabSates {}

class GetAllCategoriesLoadingState extends HomeTabSates {}

class GetAllCategoriesErrorState extends HomeTabSates {
  Failures error;

  GetAllCategoriesErrorState({required this.error});
}

class GetAllCategoriesSuccessState extends HomeTabSates {
  CategoryOrBrandResponseEntity response;

  GetAllCategoriesSuccessState({required this.response});
}

class GetAllBrandsLoadingState extends HomeTabSates {}

class GetAllBrandsErrorState extends HomeTabSates {
  Failures error;

  GetAllBrandsErrorState({required this.error});
}

class GetAllBrandsSuccessState extends HomeTabSates {
  CategoryOrBrandResponseEntity response;

  GetAllBrandsSuccessState({required this.response});
}
