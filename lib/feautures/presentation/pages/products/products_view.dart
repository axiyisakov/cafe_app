import 'package:cafe_app/feautures/data/models/domain_models/product.dart';
import 'package:cafe_app/feautures/presentation/bloc/products/cubit/products_cubit.dart';
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

  void _addProduct() {
    final productName = _productController.text;
    if (productName.isNotEmpty) {
      final product = Product(
        id: const Uuid().v4(),
        title: productName,
        count: 0,
      );
      context.read<ProductsCubit>().addProduct(product);
      _productController.clear();
    }
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
                  return ListTile(
                    title: Text(
                      product.title,
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
                    trailing: Text(
                      product.count.toString(),
                      style: const TextStyle(
                        fontSize: 20,
                        color: Colors.black,
                      ),
                    ),
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
