part of 'products_cubit.dart';

@freezed
class ProductsState with _$ProductsState {
  const factory ProductsState({
    List<Product>? products,
    @Default(ProductsStatus.initial) ProductsStatus status,
  }) = _ProductsState;
}

enum ProductsStatus { initial, loading, loaded, error }
