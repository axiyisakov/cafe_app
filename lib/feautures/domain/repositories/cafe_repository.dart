import 'package:cafe_app/core/error/failures.dart';
import 'package:cafe_app/feautures/data/models/domain_models/product.dart';
import 'package:dartz/dartz.dart';

abstract interface class CafeRepository {
  Future<Either<Failures, List<Product>>> getProducts();
  Future<Either<Failures, Product>> createProduct(Product product);
  Future<Either<Failures, Unit>> cacheProducts(List<Product> products);
  Future<Either<Failures, Product>> insertProduct(Product product);
  Future<Either<Failures, Unit>> deleteProduct(int id);
  Future<Either<Failures, Unit>> updateProduct(Product product);
}
