import 'package:fpdart/fpdart.dart';
import 'package:moboom_ecommerce_app/core/error/failure.dart';
import 'package:moboom_ecommerce_app/core/usecase/usecase.dart';
import 'package:moboom_ecommerce_app/features/home/domain/entities/product_entity.dart';
import 'package:moboom_ecommerce_app/features/home/domain/repository/product_repository/product_repository.dart';

class GetProductsByCategoryUsecase
    implements Usecase<List<ProductEntity>, String> {
  final ProductRepository productRepository;
  GetProductsByCategoryUsecase({
    required this.productRepository,
  });
  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      {required String params}) async {
    return await productRepository.getProductsByCategory(category: params);
  }
}
