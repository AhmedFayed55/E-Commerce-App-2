import 'package:e_commerce_app_clean/features/main_screen/tabs/products/domain/entities/products_response_entity.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/domain/use_cases/product_tab_use_case.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/presentation/manager/product_tab_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabViewModel extends Cubit<ProductTabStates> {
  ProductTabViewModel({required this.useCase})
    : super(ProductTabInitialState());
  ProductTabUseCase useCase;

  List<ProductsDataEntity> productsData = [];

  void getAllProducts() async {
    emit(ProductTabLoadingState());
    var either = await useCase.execute();
    either.fold(
      (error) {
        emit(ProductTabErrorState(error: error));
      },
      (response) {
        productsData = response.data!;
        emit(ProductTabSuccessState(response: response));
      },
    );
  }
}
