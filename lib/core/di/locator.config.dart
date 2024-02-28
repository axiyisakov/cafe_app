// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../../feautures/data/datasource/cafe_local_data_source.dart' as _i4;
import '../../feautures/data/repositories/cafe_repository_impl.dart' as _i6;
import '../../feautures/domain/repositories/cafe_repository.dart' as _i5;
import '../../feautures/domain/usecases/add_product.dart' as _i10;
import '../../feautures/domain/usecases/get_products.dart' as _i7;
import '../../feautures/presentation/bloc/main/cubit/main_cubit.dart' as _i8;
import '../../feautures/presentation/bloc/products/cubit/products_cubit.dart'
    as _i11;
import '../../feautures/presentation/bloc/shoplist/cubit/shoplist_cubit.dart'
    as _i9;
import '../storage/app_database.dart'
    as _i3; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// an extension to register the provided dependencies inside of [GetIt]
extension GetItInjectableX on _i1.GetIt {
  /// initializes the registration of provided dependencies inside of [GetIt]
  _i1.GetIt initLocator({
    String? environment,
    _i2.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i2.GetItHelper(
      this,
      environment,
      environmentFilter,
    );
    gh.lazySingleton<_i3.AppDatabase>(() => _i3.AppDatabase());
    gh.lazySingleton<_i4.CafeLocalDataSource>(
        () => _i4.CafeLocalDataSourceImpl(database: get<_i3.AppDatabase>()));
    gh.lazySingleton<_i5.CafeRepository>(() => _i6.CafeRepositoryImpl(
        cafeLocalDataSource: get<_i4.CafeLocalDataSource>()));
    gh.lazySingleton<_i7.GetProducts>(
        () => _i7.GetProducts(get<_i5.CafeRepository>()));
    gh.factory<_i8.MainCubit>(() => _i8.MainCubit());
    gh.factory<_i9.ShoplistCubit>(() => _i9.ShoplistCubit());
    gh.lazySingleton<_i10.AddProduct>(
        () => _i10.AddProduct(get<_i5.CafeRepository>()));
    gh.factory<_i11.ProductsCubit>(() => _i11.ProductsCubit(
          getProducts: get<_i7.GetProducts>(),
          addProduct: get<_i10.AddProduct>(),
        ));
    return this;
  }
}
