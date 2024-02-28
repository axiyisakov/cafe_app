import 'package:cafe_app/core/error/failures.dart';
import 'package:cafe_app/core/usecases/product_usecase.dart';
import 'package:cafe_app/feautures/data/models/domain_models/product.dart';
import 'package:cafe_app/feautures/domain/repositories/cafe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class UpdateProduct implements ProductUseCase<Product, UpdateParams> {
  final CafeRepository repository;
  UpdateProduct(this.repository);

  @override
  Future<Either<Failures, Product>> call(UpdateParams updateParams) async =>
      await repository.updateProduct(updateParams.product);
}

class UpdateParams extends Equatable {
  final Product product;
  const UpdateParams(this.product);

  @override
  List<Object?> get props => [product];
}
