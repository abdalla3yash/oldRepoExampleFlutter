import 'package:dm_development/pages/Chat.dart';
import 'package:dm_development/pages/payments.dart';
import 'package:dm_development/pages/profile.dart';
import 'package:dm_development/pages/services.dart';
import 'package:dm_development/pages/timeline.dart';
import 'package:flutter/material.dart';
import 'package:drawerbehavior/drawerbehavior.dart';

class QrCodePage extends StatefulWidget {
  @override
  _QrCodePageState createState() => _QrCodePageState();
}

class _QrCodePageState extends State<QrCodePage> {
  ChatPage _chatPage = new ChatPage();
  ProfilePage _profilePage = new ProfilePage('profile');
  products _products = new products();
  PaymentPage _paymentPage = new PaymentPage();
  TimelinePage _timelinePage = new TimelinePage();

  final menu = new Menu(
    items: [
      new MenuItem(
        id: 'yourid',
        title: 'Your ID',
        icon: Icons.code,
      ),
      new MenuItem(
        id: 'profile',
        title: 'Profile',
        icon: Icons.person,
      ),
      new MenuItem(
        id: 'timeline',
        title: 'Timeline',
        icon: Icons.description,
      ),
      new MenuItem(
        id: 'payment',
        title: 'Payments',
        icon: Icons.payment,
      ),
      new MenuItem(
        id: 'chat',
        title: 'Chat',
        icon: Icons.chat,
      ),
      new MenuItem(
        id: 'services',
        title: 'Services',
        icon: Icons.settings,
      ),
      new MenuItem(
        id: 'logout',
        title: 'Log out',
        icon: Icons.arrow_back_ios,
      ),
    ],
  );

  var selectedMenuItemId ;
  var _widget;

  @override
  Widget build(BuildContext context) {
    return new DrawerScaffold(
        percentage: 0.6,
        appBar: AppBarProps(
            backgroundColor: Color.fromRGBO(61, 64, 69, 1),
            title: Text("DM Development"),
            actions: [
              IconButton(icon: Icon(Icons.settings), onPressed: () {})
            ]),
        menuView: new MenuView(
          menu: menu,
          animation: true,
          footerView: Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 80, 20),
            child: Image.asset(
              'assets/footer.png',
              width: 120,
              height: 80,
            ),
          ),
          headerView: Padding(
            padding: EdgeInsets.fromLTRB(20, 40, 100, 20),
            child: Image.asset(
              'assets/logo.png',
              width: 140,
              height: 100,
            ),
          ),
          color: Color.fromRGBO(61, 64, 69, 1),
          selectedItemId: selectedMenuItemId,
          onMenuItemSelected: (String itemId) {
            selectedMenuItemId = itemId;
            if (itemId == 'yourid') {
              setState(
                () => _widget = Center(
                      child: Image.asset("assets/scanner.png"),
                    ),
              );
            } else if (itemId == 'profile') {
              setState(
                () => _widget = _profilePage,
              );
            } else if (itemId == 'chat') {
              setState(
                () => _widget = _chatPage,
              );
            } else if (itemId == 'services') {
              setState(
                () => _widget = _products,
              );
            } else if (itemId == 'timeline') {
              setState(
                    () => _widget = _timelinePage,
              );
            } else if (itemId == 'payment') {
              setState(
                () => _widget = _paymentPage,
              );
            }
          },
        ),
        contentView: Screen(
          color: Color.fromRGBO(61, 64, 69, 1),
          contentBuilder: (context) => LayoutBuilder(
                builder: (context, constraint) => GestureDetector(
                      child: Container(
                        color: Colors.white,
                        width: constraint.maxWidth,
                        height: constraint.maxHeight,
                        child: Center(
                            child: _widget == null
                                ? Center(
                                    child: Image.asset("assets/scanner.png"),
                                  )
                                : _widget
                        ),
                      ),
                    ),
              ),
        ));
  }

  Widget YourIDPage(BuildContext context) {
    return Center(
      child: Image.asset("assets/scanner.png"),
    );
  }
}
