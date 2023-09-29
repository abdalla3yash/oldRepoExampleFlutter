import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lc/view/home/cart_screen.dart';
import 'package:lc/view/home/home_screen.dart';
import 'package:lc/view/account/profile_screen.dart';

class ControllViewModel extends GetxController {
  int _navigatorValue = 0;
  Widget _currentScreen = HomeScreen();
  get currentScreen => _currentScreen;

  get navigatorValue => _navigatorValue;

  void changeSelectedValue(int selectVlue) {
    _navigatorValue = selectVlue;

    switch (selectVlue) {
      case 0:
        {
          _currentScreen = HomeScreen();
          break;
        }
      case 1:
        {
          _currentScreen = CartScreen();
          break;
        }
      case 2:
        {
          _currentScreen = ProfileScreen();
          break;
        }
    }

    update();
  }
}
