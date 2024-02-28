import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'main_cubit.freezed.dart';
part 'main_state.dart';

@injectable
class MainCubit extends Cubit<MainState> {
  final CupertinoTabController _tabController;

  MainCubit()
      : _tabController = CupertinoTabController(initialIndex: 0),
        super(const MainState());

  CupertinoTabController get tabController => _tabController;

  void changePage(int index) {
    _tabController.index = index;
    emit(
      state.copyWith(page: index),
    );
  }

  void updateShoplistCount(int count) async {
    emit(
      state.copyWith(shoplistCount: count),
    );
  }

  @override
  Future<void> close() {
    _tabController.dispose();
    return super.close();
  }
}
