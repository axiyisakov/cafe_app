import 'package:cafe_app/core/error/failures.dart';
import 'package:cafe_app/feautures/data/models/domain_models/product.dart';
import 'package:dartz/dartz.dart';

abstract interface class GetProductsUseCase<Type, Param> {
  Future<Either<Failures, List<Product>>> call(Param param);
}
