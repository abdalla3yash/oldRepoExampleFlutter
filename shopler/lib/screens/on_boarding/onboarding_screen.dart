import 'package:flutter/material.dart';
import 'package:shop_app/components/components.dart';
import 'package:shop_app/screens/login/login_screen.dart';
import 'package:shop_app/shared/network/remote/cache_helper.dart';
import 'package:shop_app/shared/styles/colors.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class BoardingModel {
  final String image, title, body;

  BoardingModel({required this.image, required this.title, required this.body});
}

class OnBoardingScreen extends StatefulWidget {
  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  var BoardingController = PageController();

  List<BoardingModel> boarding = [
    BoardingModel(
        image: 'assets/onboarding/shop1.png',
        title: 'A Group Of Brands',
        body:
            'Here you will find everything you want from brands and valuable and clean things for a very attractive price'),
    BoardingModel(
        image: 'assets/onboarding/shop2.png',
        title: 'Customers Satisfaction',
        body:
            'We strive to satisfy customers and make sure to provide all their requirements and provide a fertile environment for trading and buying with all comfort'),
    BoardingModel(
        image: 'assets/onboarding/shop3.png',
        title: 'Accessibility',
        body:
            'Ease of searching for the product you want to buy at the lowest possible price with the provision of shipping to all places and the provision of the cash back feature, are you ready?'),
  ];
  bool isLast = false;
  void submit() {
    CacheHelper.saveData(key: 'onBoarding', value: true).then((value) {
      if (value) {
        navigateAndFinish(context, ShopLoginScreen());
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          defaultTextButton(function: submit, text: 'Skip'),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.only(bottom: 20.0, left: 20.0, right: 20.0),
        child: Column(
          children: [
            Expanded(
              child: PageView.builder(
                onPageChanged: (int index) {
                  if (index == boarding.length - 1) {
                    setState(() {
                      isLast = true;
                    });
                    // ignore: avoid_print
                    print('Last');
                  } else {
                    setState(() {
                      isLast = false;
                    });
                    // ignore: avoid_print
                    print('Not Last');
                  }
                },
                physics: const BouncingScrollPhysics(),
                controller: BoardingController,
                itemBuilder: (context, index) =>
                    buildBoardingItem(boarding[index]),
                itemCount: boarding.length,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Row(
              children: [
                SmoothPageIndicator(
                  controller: BoardingController,
                  count: boarding.length,
                  effect: const ExpandingDotsEffect(
                    dotColor: Colors.grey,
                    activeDotColor: defaultColor,
                    dotHeight: 10,
                    dotWidth: 10,
                    spacing: 5,
                    expansionFactor: 4,
                  ),
                ),
                const Spacer(),
                FloatingActionButton(
                  onPressed: () {
                    if (isLast) {
                      submit();
                    } else {
                      BoardingController.nextPage(
                          duration: const Duration(milliseconds: 750),
                          curve: Curves.fastLinearToSlowEaseIn);
                    }
                  },
                  child: const Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget buildBoardingItem(BoardingModel model) => Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Expanded(
            child: Image(
              fit: BoxFit.contain,
              image: AssetImage(model.image),
            ),
          ),
          Text(
            model.title,
            style: const TextStyle(
              fontSize: 26,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
          Text(
            model.body,
            textAlign: TextAlign.center,
            style: const TextStyle(
              fontSize: 16,
            ),
          ),
          const SizedBox(
            height: 15,
          ),
        ],
      );
}
