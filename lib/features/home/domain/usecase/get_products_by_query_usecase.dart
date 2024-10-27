import 'package:fpdart/fpdart.dart';
import 'package:moboom_ecommerce_app/core/error/failure.dart';
import 'package:moboom_ecommerce_app/core/usecase/usecase.dart';
import 'package:moboom_ecommerce_app/features/home/domain/entities/product_entity.dart';
import 'package:moboom_ecommerce_app/features/home/domain/repository/product_repository/product_repository.dart';

class GetProductsByQueryUsecase
    implements Usecase<List<ProductEntity>, String> {
  final ProductRepository productRepository;
  GetProductsByQueryUsecase({
    required this.productRepository,
  });
  @override
  Future<Either<Failure, List<ProductEntity>>> call(
      {required String params}) async {
    return await productRepository.getProductsByQuery(query: params);
  }
}
