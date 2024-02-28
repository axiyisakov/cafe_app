import 'package:bloc/bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

part 'shoplist_cubit.freezed.dart';
part 'shoplist_state.dart';

@injectable
class ShoplistCubit extends Cubit<ShoplistState> {
  ShoplistCubit() : super(const ShoplistState.initial());
}
