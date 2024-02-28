import 'package:cafe_app/core/error/failures.dart';
import 'package:cafe_app/core/usecases/product_usecase.dart';
import 'package:cafe_app/feautures/data/models/domain_models/product.dart';
import 'package:cafe_app/feautures/domain/repositories/cafe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class AddProduct implements ProductUseCase<Product, Params> {
  final CafeRepository repository;
  AddProduct(this.repository);

  @override
  Future<Either<Failures, Product>> call(Params params) async =>
      await repository.insertProduct(params.product);
}

class Params extends Equatable {
  final Product product;
  const Params(this.product);

  @override
  List<Object?> get props => [product];
}
