import 'package:cafe_app/core/di/locator.dart';
import 'package:cafe_app/feautures/presentation/bloc/shoplist/cubit/shoplist_cubit.dart';
import 'package:cafe_app/feautures/presentation/pages/shoplist/shoplist_view.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ShoplistScreen extends StatelessWidget {
  const ShoplistScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ShoplistCubit>(
      create: (context) => sl<ShoplistCubit>(),
      child: const ShoplistView(),
    );
  }
}
