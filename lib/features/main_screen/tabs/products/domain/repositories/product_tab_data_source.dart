import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_clean/core/errors/failures.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/domain/entities/products_response_entity.dart';

abstract class ProductTabDataSource {
  Future<Either<Failures, ProductsResponseEntity>> getAllProducts();
}
