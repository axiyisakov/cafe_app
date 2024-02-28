import 'package:equatable/equatable.dart';

sealed class Failures extends Equatable {
  const Failures([List properties = const <dynamic>[]]);
}

class ServerFailure extends Failures {
  @override
  List<Object?> get props => [];
}

class CacheFailure extends Failures {
  @override
  List<Object?> get props => [];
}
