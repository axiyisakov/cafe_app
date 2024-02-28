import 'package:cafe_app/feautures/data/models/domain_models/product.dart';
import 'package:drift/drift.dart' as drift;

@drift.UseRowClass(Product)
class ShoplistTable extends drift.Table {
  drift.IntColumn get id => integer().autoIncrement()();
  drift.TextColumn get uuid => text()();
  drift.TextColumn get title => text().withLength(min: 1, max: 32)();
  drift.IntColumn get count => integer()();
}
