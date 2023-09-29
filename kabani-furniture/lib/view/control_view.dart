import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lc/core/view_model/auth_view_model.dart';
import 'package:lc/core/view_model/controll_view_model.dart';
import 'package:lc/view/auth/login_screen.dart';
import 'package:lc/view/home/cart_screen.dart';
import 'package:lc/view/home/home_screen.dart';
import 'package:lc/view/account/profile_screen.dart';

class ControllerView extends GetWidget<AuthViewModel> {
  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return (Get.find<AuthViewModel>().user != null)
          ? GetBuilder<ControllViewModel>(
              init: ControllViewModel(),
              builder: (controller) => Scaffold(
                body: controller.currentScreen,
                bottomNavigationBar: bottomNavigationBar(),
              ),
            )
          : LoginScreen();
    });
  }

  Widget bottomNavigationBar() {
    return GetBuilder<ControllViewModel>(
      init: Get.find(),
      builder: (controller) => BottomNavigationBar(
        elevation: 0,
        backgroundColor: Colors.white,
        selectedItemColor: Colors.black,
        items: [
          BottomNavigationBarItem(
              activeIcon: Text('Explore'),
              label: '',
              icon: Image.asset(
                'assets/images/Icon_Explore.png',
                fit: BoxFit.contain,
                width: 20,
              )),
          BottomNavigationBarItem(
              activeIcon: Text('Cart'),
              label: '',
              icon: Image.asset(
                'assets/images/Icon_Cart.png',
                fit: BoxFit.contain,
                width: 20,
              )),
          BottomNavigationBarItem(
              activeIcon: Text('Account'),
              label: '',
              icon: Image.asset(
                'assets/images/Icon_User.png',
                fit: BoxFit.contain,
                width: 20,
              )),
        ],
        currentIndex: controller.navigatorValue,
        onTap: (index) {
          controller.changeSelectedValue(index);
        },
      ),
    );
  }
}
