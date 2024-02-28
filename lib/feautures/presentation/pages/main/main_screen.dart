import 'package:cafe_app/core/di/locator.dart';
import 'package:cafe_app/feautures/presentation/bloc/main/cubit/main_cubit.dart';
import 'package:cafe_app/feautures/presentation/pages/main/main_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider<MainCubit>(
      create: (context) => sl<MainCubit>(),
      child: const MainView(),
    );
  }
}
