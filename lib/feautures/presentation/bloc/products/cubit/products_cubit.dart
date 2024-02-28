import 'package:bloc/bloc.dart';
import 'package:cafe_app/feautures/data/models/domain_models/product.dart';
import 'package:cafe_app/feautures/domain/usecases/add_product.dart';
import 'package:cafe_app/feautures/domain/usecases/get_products.dart';
import 'package:cafe_app/feautures/domain/usecases/update_product.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'products_cubit.freezed.dart';
part 'products_state.dart';

@injectable
class ProductsCubit extends Cubit<ProductsState> {
  final GetProducts _getProducts;
  final AddProduct _addProduct;
  final UpdateProduct _updateProduct;
  ProductsCubit({
    required GetProducts getProducts,
    required AddProduct addProduct,
    required UpdateProduct updateProduct,
  })  : _getProducts = getProducts,
        _addProduct = addProduct,
        _updateProduct = updateProduct,
        super(const ProductsState()) {
    _fetchProducts();
  }

  void _fetchProducts() async {
    emit(
      const ProductsState(
        status: ProductsStatus.loading,
      ),
    );
    final products = await _getProducts(const NoParams());
    final newState = products.fold<ProductsState>(
      (failure) => const ProductsState(
        status: ProductsStatus.error,
      ),
      (products) => ProductsState(
        products: products,
        status: ProductsStatus.loaded,
      ),
    );

    emit(newState);
  }

  void updateProduct(Product product) async {
    final result = await _updateProduct(UpdateParams(product));
    final newState = result.fold(
      (failure) => state.copyWith(
        status: ProductsStatus.error,
      ),
      (product) {
        final products = List<Product>.from(
          state.products ?? [],
          growable: true,
        );
        if (state.status == ProductsStatus.loaded) {
          final index =
              products.indexWhere((element) => element.uuid == product.uuid);
          products[index] = product;
          return state.copyWith(
            products: products,
            status: ProductsStatus.loaded,
          );
        } else {
          return state.copyWith(
            status: ProductsStatus.error,
          );
        }
      },
    );
    emit(newState);
  }

  void addProduct(Product product) async {
    final result = await _addProduct(Params(product));
    debugPrint(result.toString());
    final newState = result.fold(
      (failure) => state.copyWith(
        status: ProductsStatus.error,
      ),
      (product) {
        final products = List<Product>.from(
          state.products ?? [],
          growable: true,
        );
        if (state.status == ProductsStatus.loaded) {
          products.add(product);
          return state.copyWith(
            products: products,
            status: ProductsStatus.loaded,
          );
        } else {
          return state.copyWith(
            status: ProductsStatus.error,
          );
        }
      },
    );
    emit(newState);
  }
}
