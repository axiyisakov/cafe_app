import 'package:cafe_app/core/di/locator.dart';
import 'package:cafe_app/feautures/presentation/bloc/products/cubit/products_cubit.dart';
import 'package:cafe_app/feautures/presentation/pages/products/products_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ProductsScreen extends StatelessWidget {
  const ProductsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => sl<ProductsCubit>(),
      child: const ProductsView(),
    );
  }
}
