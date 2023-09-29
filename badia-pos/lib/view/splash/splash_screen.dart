import 'dart:async';

import 'package:erpos/controller/auth_controller.dart';
import 'package:erpos/data/base/consts.dart';
import 'package:erpos/view/auth/login_screen.dart';
import 'package:erpos/view/home/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  var controller = Get.put(AuthController());

  @override
  void initState() {
    super.initState();
    Timer(const Duration(seconds: 3), () => Get.to(() => const HomeScreen()));
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
