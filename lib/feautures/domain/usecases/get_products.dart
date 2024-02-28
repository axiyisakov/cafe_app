import 'package:cafe_app/core/error/failures.dart';
import 'package:cafe_app/core/usecases/get_products_usecase.dart';
import 'package:cafe_app/feautures/data/models/domain_models/product.dart';
import 'package:cafe_app/feautures/domain/repositories/cafe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:injectable/injectable.dart';

@lazySingleton
class GetProducts implements GetProductsUseCase<List<Product>, NoParams> {
  final CafeRepository repository;
  GetProducts(this.repository);

  @override
  Future<Either<Failures, List<Product>>> call(NoParams params) async =>
      await repository.getProducts();
}

class NoParams extends Equatable {
  const NoParams();

  @override
  List<Object?> get props => [];
}
