import 'package:e_commerce_app_clean/features/main_screen/tabs/home/domain/entities/category_or_brand_response_entity.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/home/presentation/manager/home_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

import '../../domain/use_cases/get_all_brands_use_case.dart';
import '../../domain/use_cases/get_all_categories_use_case.dart';

@injectable
class HomeTabViewModel extends Cubit<HomeTabSates> {
  GetAllCategoriesUseCase getAllCategoriesUseCase;
  GetAllBrandsUseCase getAllBrandsUseCase;

  HomeTabViewModel({
    required this.getAllCategoriesUseCase,
    required this.getAllBrandsUseCase,
  }) : super(HomeTabInitialState());

  List<CategoryOrBrandDataEntity> categories = [];
  List<CategoryOrBrandDataEntity> brands = [];

  void getAllCategories() async {
    emit(GetAllCategoriesLoadingState());
    var either = await getAllCategoriesUseCase.invoke();
    either.fold(
      (error) {
        emit(GetAllCategoriesErrorState(error: error));
      },
      (response) {
        categories = response.data!;
        emit(GetAllCategoriesSuccessState(response: response));
      },
    );
  }

  void getAllBrands() async {
    emit(GetAllBrandsLoadingState());
    var either = await getAllBrandsUseCase.invoke();
    either.fold(
      (error) {
        emit(GetAllBrandsErrorState(error: error));
      },
      (response) {
        brands = response.data!;
        emit(GetAllBrandsSuccessState(response: response));
      },
    );
  }
}
