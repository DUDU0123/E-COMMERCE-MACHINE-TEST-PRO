import 'package:fpdart/fpdart.dart';
import 'package:moboom_ecommerce_app/core/error/failure.dart';
import 'package:moboom_ecommerce_app/core/exceptions/exceptions.dart';
import 'package:moboom_ecommerce_app/features/home/data/data_source/product_data.dart';
import 'package:moboom_ecommerce_app/features/home/domain/entities/product_entity.dart';
import 'package:moboom_ecommerce_app/features/home/domain/repository/product_repository/product_repository.dart';

class ProductRepositoryImpl implements ProductRepository {
  final ProductData productData;
  ProductRepositoryImpl({
    required this.productData,
  });
  @override
  Future<Either<Failure, List<ProductEntity>>> getAllProducts() async {
    try {
      final res = await productData.getAllProducts();
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByCategory(
      {required String category}) async {
    try {
      final res = await productData.getProductsByCategory(category: category);
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }

  @override
  Future<Either<Failure, List<ProductEntity>>> getProductsByQuery(
      {required String query}) async {
    try {
      final res = await productData.getProductsByQuery(query: query);
      return right(res);
    } on ServerException catch (e) {
      return left(Failure(message: e.message));
    } catch (e) {
      return left(Failure(message: e.toString()));
    }
  }
}
