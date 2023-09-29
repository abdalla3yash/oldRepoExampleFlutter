import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:use/utils/devfest.dart';
import 'index.dart';

@immutable
abstract class ConfigEvent extends Equatable {
  ConfigEvent([List props = const <dynamic>[]]);
  Future<ConfigState> applyAsync({ConfigState currentState, ConfigBloc bloc});
}

class DarkModeEvent extends ConfigEvent {
  final bool darkOn;
  DarkModeEvent(this.darkOn);

  @override
  String toString() => 'DarkModeEvent';

  @override
  Future<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc bloc}) async {
    try {
      bloc.darkModeOn = darkOn;
      Devfest.prefs.setBool(Devfest.darkModePref, darkOn);
      return inConfigState();
    } catch (_, stacktrace) {
      return errorConfigState(_?.toString());
    }
  }

  @override
  // TODO: implement props
  List<Object> get props => null;
}

class LoadConfigEvent extends ConfigEvent {
  @override
  String toString() => 'LoadConfigEvent';

  @override
  Future<ConfigState> applyAsync(
      {ConfigState currentState, ConfigBloc bloc}) async {
    try {
      await Future.delayed(Duration(seconds: 2));
      return inConfigState();
    } catch (_, stacktrace) {
      return errorConfigState(_?.toString());
    }
  }

  @override
  // TODO: implement props
  List<Object> get props => null;
}
