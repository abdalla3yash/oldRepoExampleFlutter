import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:read/dialogs/error_dialog.dart';
import 'package:read/home/home_widgets/home_front.dart';
import 'package:read/home/index.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({
    Key key,
    @required HomeBloc homeBloc,
  })  : _homeBloc = homeBloc,
        super(key: key);

  final HomeBloc _homeBloc;

  @override
  HomeScreenState createState() {
    return HomeScreenState(_homeBloc);
  }
}

class HomeScreenState extends State<HomeScreen> {
  final HomeBloc _homeBloc;
  HomeScreenState(this._homeBloc);

  @override
  void initState() {
    super.initState();
    this._homeBloc.add(LoadHomeEvent());
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener(
      cubit: widget._homeBloc,
      listener: (context, state) {
        if (state is ErrorHomeState) {
          showDialog(
            context: context,
            barrierDismissible: false,
            builder: (context) => ErrorDialog(
              error: state.errorMessage,
              onTap: () {
                _homeBloc.add(LoadHomeEvent());
              },
            ),
          );
        }
      },
      child: BlocBuilder<HomeBloc, HomeState>(
          cubit: widget._homeBloc,
          builder: (
            BuildContext context,
            HomeState currentState,
          ) {
            if (currentState is UnHomeState) {
              return Center(
                child: SpinKitChasingDots(
                  color: Colors.red,
                ),
              );
            }
            if (currentState is ErrorHomeState) {
              return Container(
                  padding: const EdgeInsets.all(16.0),
                  child: Center(
                    child: Text(
                      currentState.errorMessage ?? 'Error',
                      textAlign: TextAlign.center,
                    ),
                  ));
            }
            return HomeFront();
          }),
    );
  }
}
