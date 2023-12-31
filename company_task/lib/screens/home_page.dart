import 'package:flutter/material.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:loading_animations/loading_animations.dart';
//import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';
import 'package:mobilsharelocation/locator.dart';
import 'package:mobilsharelocation/models/location.dart';
import 'package:mobilsharelocation/screens/google_map.dart';
import 'package:mobilsharelocation/screens/scanner.dart';
import 'package:mobilsharelocation/utilities/constant.dart';
import 'package:mobilsharelocation/viewmodels/location_viewmodel.dart';
import 'package:mobilsharelocation/widgets/button_widget.dart';
import 'package:mobilsharelocation/widgets/column.dart';
import 'package:mobilsharelocation/widgets/platform_alert_widget.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  static final String id = "home_screen";
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  _getLocation() async {
    final _locationUserViewModel = Provider.of<LocationViewModel>(context);
    try {
      await _locationUserViewModel.getLocation();
      Navigator.of(context)
          .push(MaterialPageRoute(builder: (context) => GoogleMapWidget()));
    } catch (e) {
      PlatformAlertWidget(
        title: "ALERT",
        content: "No Internet",
        mainButtonText: e.toString(),
      ).show(context);
      print(e.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    final width = MediaQuery.of(context).size.width;
    final height = MediaQuery.of(context).size.height;

    return Scaffold(
        body: Consumer<LocationViewModel>(
      builder: (context, viewmodel, child) {
        if (viewmodel.state == ViewState.Idle && viewmodel.location == null) {
          return child;
        } else {
          return Center(
            child: LoadingFlipping.circle(
              backgroundColor: Colors.black,
            ),
          );
        }
      },
      child: Stack(
        overflow: Overflow.visible,
        children: <Widget>[
          Container(
            height: width,
            width: width,
            child: Align(
              alignment: Alignment.topCenter,
              child: Center(
                child: AnimationConfiguration.synchronized(
                  child: SlideAnimation(
                    delay: Duration(seconds: 3),
                    verticalOffset: 75.0,
                    child: Image(
                        image: AssetImage(
                          "assets/images/bg.png",
                        ),
                        fit: BoxFit.cover),
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: ClipRRect(
              borderRadius: kBorderRadius,
              child: Container(
                width: double.infinity,
                height: height * 0.40,
                decoration: kHomeContainerDecoration,
                child: CustomColumn(
                  text: Text(
                    "Location Service",
                    style: kHomeTextStyle,
                  ),
                  content: buildContentColumn(),
                  button1: buildqrButton(),
                  button2: buildCustomButton(),
                ),
              ),
            ),
          ),
        ],
      ),
    ));
  }

  Column buildContentColumn() {
    return Column(
      children: <Widget>[
        Text("You can share your location using button",
            style: kHomeContentTextStyle),
        Text("enable your location on your phone",
            style: kHomeContentTextStyle),
      ],
    );
  }

  CustomButton buildqrButton() {
    return CustomButton(
        width: 250.0,
        buttonText: Text("Scan QR Code", style: kCustomButtonTextStyle),
        onPressed: () => Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => ScannerPage(),
              ),
            ),
        buttonColor: Color(0xFFFF7A53));
  }

  CustomButton buildCustomButton() {
    return CustomButton(
        width: 250.0,
        buttonText: Text("FIND MY LOCATION", style: kCustomButtonTextStyle),
        onPressed: () => _getLocation(),
        buttonColor: Color(0xFFFF7A53));
  }
}
