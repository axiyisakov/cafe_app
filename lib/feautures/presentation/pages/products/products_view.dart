import 'package:cafe_app/feautures/data/models/domain_models/product.dart';
import 'package:cafe_app/feautures/presentation/bloc/main/cubit/main_cubit.dart';
import 'package:cafe_app/feautures/presentation/bloc/products/cubit/products_cubit.dart';
import 'package:cafe_app/feautures/presentation/widgets/product_tile.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:uuid/uuid.dart';

class ProductsView extends StatefulWidget {
  const ProductsView({super.key});

  @override
  State<ProductsView> createState() => _ProductsViewState();
}

class _ProductsViewState extends State<ProductsView> {
  final _productController = TextEditingController();

  ProductsCubit get cubit => context.read<ProductsCubit>();
  MainCubit get mainCubit => context.read<MainCubit>();
  void _addProduct() {
    final productName = _productController.text;
    if (productName.isNotEmpty) {
      final product = Product(
        uuid: const Uuid().v4(),
        title: productName,
        count: 0,
      );
      cubit.addProduct(product);
      _productController.clear();
    }
  }

  void _updateProduct(Product product) {
    cubit.updateProduct(product);
    mainCubit.updateShoplistCount(cubit.state.count);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Products'),
        actions: [
          Builder(builder: (context) {
            return IconButton(
              onPressed: () {
                showAdaptiveDialog(
                  context: context,
                  builder: (context) {
                    return AlertDialog.adaptive(
                      title: const Text('Add product'),
                      content: CupertinoTextField(
                        controller: _productController,
                        placeholder: 'Product name',
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            _addProduct();
                            if (Navigator.of(context).canPop()) {
                              Navigator.of(context).pop();
                            }
                          },
                          child: const Text('Add'),
                        ),
                      ],
                    );
                  },
                );
              },
              icon: const Icon(Icons.add),
            );
          }),
        ],
      ),
      body: BlocConsumer<ProductsCubit, ProductsState>(
        listener: (context, state) {
          if (state.status == ProductsStatus.error) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Error'),
              ),
            );
          }
        },
        builder: (context, state) {
          return switch (state.status) {
            ProductsStatus.loading => const Center(
                child: CircularProgressIndicator.adaptive(),
              ),
            ProductsStatus.loaded => ListView.builder(
                itemCount: state.products!.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final product = state.products![index];
                  mainCubit.updateShoplistCount(state.count);
                  return ProductTile(
                    product: product,
                    onCountDecreased: () {
                      int productCount = product.count - 1;
                      final updatedProduct = product.copyWith(
                        count: productCount.isNegative ? 0 : productCount,
                      );
                      _updateProduct(updatedProduct);
                    },
                    onCountIncreaesed: () {
                      int productCount = product.count + 1;
                      final updatedProduct = product.copyWith(
                        count: productCount,
                      );
                      _updateProduct(updatedProduct);
                    },
                  );
                },
              ),
            _ => const Center(
                child: Text('error'),
              ),
          };
        },
      ),
    );
  }
}
