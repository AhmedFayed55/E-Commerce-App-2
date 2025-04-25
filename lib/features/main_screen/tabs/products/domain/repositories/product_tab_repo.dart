import 'package:dartz/dartz.dart';

import '../../../../../../core/errors/failures.dart';
import '../entities/products_response_entity.dart';

abstract class ProductTabRepo {
  Future<Either<Failures, ProductsResponseEntity>> getAllProducts();
}
