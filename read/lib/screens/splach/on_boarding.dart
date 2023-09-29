import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

class OnBoardingPage extends StatefulWidget {
  static const String routeName = "/onboardingpage";
  @override
  _OnBoardingPageState createState() => _OnBoardingPageState();
}

class _OnBoardingPageState extends State<OnBoardingPage> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(context) =>
      Navigator.pushNamed(context, '/welcome-sign');

  Widget _buildImage(String assetName) {
    return Align(
      child: Image.asset('assets/splach/$assetName.png',fit: BoxFit.fitWidth,),
      alignment: Alignment.bottomCenter,
    );
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    const bodyStyle = TextStyle(fontSize: 14.0,color: Color.fromRGBO(112, 112, 112, 1));
    const pageDecoration = const PageDecoration(
      titleTextStyle: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w700,color: Color.fromRGBO(28, 26, 26, 1)),
      bodyTextStyle: bodyStyle,
      descriptionPadding: EdgeInsets.fromLTRB(16.0, 40.0, 16.0, 16.0),
      pageColor: Colors.white,
      titlePadding: const EdgeInsets.only(top: 50),
    );

    return IntroductionScreen(
      key: introKey,
      pages: [
        PageViewModel(
          title: "Build Your Library",
          body: "Discover Restaurants offering the best \n fast food food near you on Foodwa",
          image: _buildImage('splach1'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title: "Explore the available books",
          body:
          "Food delivery or pickup from local restaurants, \n Explore restaurants that deliver near you.",
          image: _buildImage('splach2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          title:"Select your next read",
          body:"Food delivery or pickup from local restaurants, \n Explore restaurants that deliver near you.",
          image: _buildImage('splach3'),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      showSkipButton: true,
      skipFlex: 0,
      nextFlex: 0,
      skip: const Text('Skip'),
      next: const Text('Next'),
      done: const Text('Done', style: TextStyle(fontWeight: FontWeight.w600)),
      dotsDecorator: const DotsDecorator(
        size: Size(10.0, 10.0),
        color: Colors.grey,
        activeColor: Colors.amber,
        activeSize: Size(22.0, 10.0),
        activeShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
    );
  }
}
