import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

@immutable
abstract class ConfigState extends Equatable {
  ConfigState([List props = const <dynamic>[]]);

  ConfigState getStateCopy();
}

class unConfigState extends ConfigState {
  @override
  String toString() => 'unConfigState';

  @override
  ConfigState getStateCopy() {
    // TODO: implement getStateCopy
    return unConfigState();
  }

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class inConfigState extends ConfigState {
  @override
  String toString() => 'inConfigState';

  @override
  ConfigState getStateCopy() {
    // TODO: implement getStateCopy
    return inConfigState();
  }

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class errorConfigState extends ConfigState {
  final String errorMessage;
  errorConfigState(this.errorMessage);
  @override
  String toString() => 'errorConfigState';

  @override
  ConfigState getStateCopy() {
    // TODO: implement getStateCopy
    return errorConfigState(this.errorMessage);
  }

  @override
  // TODO: implement props
  List<Object> get props => null;
}
