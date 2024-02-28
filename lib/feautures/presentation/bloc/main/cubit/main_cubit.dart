import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:injectable/injectable.dart';

@injectable
class MainCubit extends Cubit<int> {
  final CupertinoTabController _tabController;
  MainCubit()
      : _tabController = CupertinoTabController(initialIndex: 0),
        super(0);

  CupertinoTabController get tabController => _tabController;

  void changePage(int index) {
    _tabController.index = index;
    emit(index);
  }

  @override
  Future<void> close() {
    _tabController.dispose();
    return super.close();
  }
}
