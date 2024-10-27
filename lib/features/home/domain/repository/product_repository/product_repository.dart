import 'package:fpdart/fpdart.dart';
import 'package:moboom_ecommerce_app/core/error/failure.dart';
import 'package:moboom_ecommerce_app/features/home/domain/entities/product_entity.dart';

abstract interface class ProductRepository {
  Future<Either<Failure, List<ProductEntity>>> getAllProducts();
  Future<Either<Failure, List<ProductEntity>>> getProductsByQuery({required String query});
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory({required String category});
}