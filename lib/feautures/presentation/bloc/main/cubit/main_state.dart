part of 'main_cubit.dart';

@freezed
class MainState with _$MainState {
  const factory MainState({
    @Default(0) int page,
    @Default(0) shoplistCount,
  }) = _MainState;
}
