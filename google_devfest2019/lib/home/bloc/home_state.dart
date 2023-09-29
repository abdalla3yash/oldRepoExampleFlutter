import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class HomeState extends Equatable {
  HomeState([Iterable props]);

  HomeState getStateCopy();
}

class unHomeState extends HomeState {
  @override
  HomeState getStateCopy() {
    return unHomeState();
  }

  @override
  String toString() => 'unHomeState';

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class InHomeState extends HomeState {
  @override
  String toString() => 'InHomeState';

  @override
  HomeState getStateCopy() {
    return InHomeState();
  }

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class ErrorHomeState extends HomeState {
  final String errorMessage;

  ErrorHomeState(this.errorMessage);

  @override
  String toString() => 'ErrorHomeState';

  @override
  HomeState getStateCopy() {
    return ErrorHomeState(this.errorMessage);
  }

  @override
  // TODO: implement props
  List<Object> get props => null;
}
