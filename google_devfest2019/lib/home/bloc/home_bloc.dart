import 'package:bloc/bloc.dart';
import 'package:use/home/bloc/index.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  static final HomeBloc _homeBlocSingleton = HomeBloc._internal();

  factory HomeBloc() {
    return _homeBlocSingleton;
  }

  HomeBloc._internal();

  @override
  HomeState get initialState => unHomeState();

  @override
  Stream<HomeState> mapEventToState(
    HomeEvent event,
  ) async* {
    try {
      yield unHomeState();
      yield await event.applyAsync(currentState: state, bloc: this);
    } catch (_, stackTrace) {
      print('$_ $stackTrace');
      yield state;
    }
  }
}
