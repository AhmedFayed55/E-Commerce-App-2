import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_clean/core/errors/failures.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/domain/entities/products_response_entity.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/domain/repositories/product_tab_repo.dart';
import 'package:injectable/injectable.dart';

@injectable
class ProductTabUseCase {
  ProductTabRepo productTabRepo;

  ProductTabUseCase({required this.productTabRepo});

  Future<Either<Failures, ProductsResponseEntity>> execute() {
    return productTabRepo.getAllProducts();
  }
}
