import 'package:cafe_app/core/error/failures.dart';
import 'package:cafe_app/feautures/data/datasource/cafe_local_data_source.dart';
import 'package:cafe_app/feautures/data/models/domain_models/product.dart';
import 'package:cafe_app/feautures/domain/repositories/cafe_repository.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:injectable/injectable.dart';

@LazySingleton(as: CafeRepository)
class CafeRepositoryImpl implements CafeRepository {
  final CafeLocalDataSource _localDataSource;

  CafeRepositoryImpl({
    required CafeLocalDataSource cafeLocalDataSource,
  }) : _localDataSource = cafeLocalDataSource;

  @override
  Future<Either<Failures, Unit>> cacheProducts(List<Product> products) {
    // TODO: implement cacheProducts
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, Unit>> deleteProduct(int id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<Either<Failures, List<Product>>> getProducts() async {
    try {
      final products = await _localDataSource.getProducts();
      return Right(products);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failures, Product>> insertProduct(Product product) async {
    try {
      final number = await _localDataSource.insertProduct(product);
      debugPrint('Number: $number');
      if (!number.isNegative) {
        return Right(product);
      } else {
        return Left(CacheFailure());
      }
    } catch (e) {
      debugPrint('Error: $e');
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failures, Product>> updateProduct(Product product) async {
    try {
      await _localDataSource.updateProduct(product);
      return Right(product);
    } catch (e) {
      return Left(CacheFailure());
    }
  }

  @override
  Future<Either<Failures, Product>> createProduct(Product product) {
    // TODO: implement createProduct
    throw UnimplementedError();
  }
}
