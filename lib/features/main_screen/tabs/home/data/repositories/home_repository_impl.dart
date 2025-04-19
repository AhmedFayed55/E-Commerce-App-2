import 'package:dartz/dartz.dart';
import 'package:e_commerce_app_clean/core/errors/failures.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/home/domain/entities/category_or_brand_response_entity.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/home/domain/repositories/data_source/home_data_source.dart';
import 'package:e_commerce_app_clean/features/main_screen/tabs/home/domain/repositories/repo/home_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: HomeRepository)
class HomeRepositoryImpl extends HomeRepository {
  HomeDataSource homeDataSource;

  HomeRepositoryImpl({required this.homeDataSource});

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>> getAllBrands() async {
    var either = await homeDataSource.getAllBrands();
    return either.fold((error) => Left(error), (response) => Right(response));
  }

  @override
  Future<Either<Failures, CategoryOrBrandResponseEntity>>
  getAllCategories() async {
    var either = await homeDataSource.getAllCategories();
    return either.fold((error) => Left(error), (response) => Right(response));
  }
}
