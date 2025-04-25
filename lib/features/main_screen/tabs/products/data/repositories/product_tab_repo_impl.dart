import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_clean/core/errors/failures.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/domain/entities/products_response_entity.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/domain/repositories/product_tab_data_source.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/products/domain/repositories/product_tab_repo.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: ProductTabRepo)
class ProductTabRepoImpl implements ProductTabRepo {
  ProductTabDataSource productTabDataSource;

  ProductTabRepoImpl({required this.productTabDataSource});

  @override
  Future<Either<Failures, ProductsResponseEntity>> getAllProducts() async {
    var either = await productTabDataSource.getAllProducts();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
