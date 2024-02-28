import 'package:cafe_app/core/storage/app_database.dart';
import 'package:cafe_app/feautures/data/models/domain_models/product.dart';
import 'package:drift/drift.dart';
import 'package:injectable/injectable.dart';

abstract interface class CafeLocalDataSource {
  Future<List<Product>> getProducts();
  Future<void> cacheCafes(List<Product> products);
  Future<int> insertProduct(Product product);
  Future<void> deleteProduct(int id);
  Future<void> updateProduct(Product product);
}

@LazySingleton(as: CafeLocalDataSource)
class CafeLocalDataSourceImpl implements CafeLocalDataSource {
  final AppDatabase _database;
  CafeLocalDataSourceImpl({
    required AppDatabase database,
  }) : _database = database;
  @override
  Future<void> cacheCafes(List<Product> products) {
    throw UnimplementedError();
  }

  @override
  Future<void> deleteProduct(int id) {
    // TODO: implement deleteProduct
    throw UnimplementedError();
  }

  @override
  Future<List<Product>> getProducts() async {
    final products = await _database.select(_database.productsTable).get();
    return products;
  }

  @override
  Future<int> insertProduct(Product product) {
    final number = _database.into(_database.productsTable).insert(
          ProductsTableCompanion(
            uuid: Value(product.uuid),
            title: Value(product.title),
            count: Value(product.count),
          ),
        );

    return number;
  }

  @override
  Future<void> updateProduct(Product product) async {
    _database.update(productsTable)
      ..where((tbl) => tbl.uuid.equals(product.uuid))
      ..write(
        ProductsTableCompanion(
          uuid: Value(product.uuid),
          title: Value(product.title),
          count: Value(product.count),
        ),
      );
  }

  $ProductsTableTable get productsTable => _database.productsTable;
}
