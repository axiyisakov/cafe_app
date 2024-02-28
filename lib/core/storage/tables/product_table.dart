import 'package:cafe_app/feautures/data/models/domain_models/product.dart';
import 'package:drift/drift.dart' as drift;

@drift.UseRowClass(Product)
class ProductsTable extends drift.Table {
  drift.TextColumn get id => text()();
  drift.TextColumn get title => text().withLength(min: 6, max: 32)();
  drift.IntColumn get count => integer()();
}
