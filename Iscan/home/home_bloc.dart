import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:read/home/index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static final HomeBloc _homeBlocSingleton = HomeBloc._internal();
  factory HomeBloc() {
    return _homeBlocSingleton;
  }
  HomeBloc._internal() : super(null);

  HomeState get initialState => UnHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    yield UnHomeState();
    try {
      yield await event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield state;
    }
  }
}
