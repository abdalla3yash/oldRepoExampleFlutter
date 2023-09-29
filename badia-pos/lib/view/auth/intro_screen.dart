import 'dart:async';

import 'package:erpos/controller/auth_controller.dart';
import 'package:erpos/data/base/consts.dart';
import 'package:erpos/view/auth/login_screen.dart';

class IntroScreen extends StatefulWidget {
  const IntroScreen({super.key});

  @override
  State<IntroScreen> createState() => _IntroScreenState();
}

class _IntroScreenState extends State<IntroScreen> {
  var controller = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Get.to(() => LoginScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: appColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Spacer(),
          const Spacer(),
          const Spacer(),
          SvgPicture.asset(companyLogo),
          const Spacer(),
          const Spacer(),
          SvgPicture.asset(visionLogo),
          const Spacer(),
        ],
      ),
    );
  }
}
