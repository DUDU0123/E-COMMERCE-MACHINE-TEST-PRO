import 'package:fpdart/fpdart.dart';
import 'package:moboom_ecommerce_app/core/error/failure.dart';

abstract interface class Usecase<SuccessType, Params>{
 Future<Either<Failure, SuccessType>> call({required Params params});
}