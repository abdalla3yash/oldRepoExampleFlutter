// ignore_for_file: must_be_immutable
import 'package:erpos/controller/auth_controller.dart';
import 'package:erpos/data/base/consts.dart';
import 'package:erpos/view/home/home_screen.dart';
import 'package:erpos/widget/customTextField.dart';

class LoginScreen extends StatelessWidget {
  LoginScreen({super.key});

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var controller = Get.put(AuthController());

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(fit: StackFit.passthrough, children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.7,
            decoration: const BoxDecoration(
              color: appColor,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.circular(50.0),
                bottomRight: Radius.circular(50.0),
              ),
            ),
            child: Center(
              child: Padding(
                padding: EdgeInsets.only(
                    bottom: MediaQuery.of(context).size.height * 0.5),
                child: SvgPicture.asset(companyLogo),
              ),
            ),
          ),
          Align(
            alignment: Alignment.center,
            child: Container(
              height: MediaQuery.of(context).size.height * 0.6,
              width: MediaQuery.of(context).size.width * 0.9,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(40),
              ),
              child: Form(
                key: _formKey,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    children: [
                      const Spacer(),
                      const Text(
                        "LOGIN",
                        style: TextStyle(
                            color: blackColor,
                            fontFamily: extrabold,
                            fontSize: 28),
                      ),
                      const Spacer(),
                      customTextField(
                          hint: "اسم المستخدم",
                          isPass: false,
                          controller: controller.usernameController),
                      const Spacer(),
                      customTextField(
                          hint: "كلمه المرور",
                          isPass: true,
                          controller: controller.passwordController),
                      const Spacer(),
                      GestureDetector(
                        onTap: () async {
                          if (_formKey.currentState!.validate()) {
                            controller
                                .login(controller.usernameController.text,
                                    controller.passwordController.text)
                                .then((status) {
                              Get.offAll(() => const HomeScreen());
                            });
                          }
                        },
                        child: Container(
                          height: MediaQuery.of(context).size.height * 0.08,
                          width: MediaQuery.of(context).size.width * 0.8,
                          decoration: BoxDecoration(
                              color: appColor,
                              borderRadius: BorderRadius.circular(15)),
                          child: const Center(
                              child: Text(
                            "LOGIN",
                            style: TextStyle(
                                color: Colors.white,
                                fontFamily: bold,
                                fontSize: 24),
                          )),
                        ),
                      ),
                      SizedBox(
                        height: MediaQuery.of(context).size.height * 0.05,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          Positioned(
              left: MediaQuery.of(context).size.width * 0.24,
              right: MediaQuery.of(context).size.width * 0.24,
              bottom: MediaQuery.of(context).size.height * 0.1,
              child: Row(
                children: const [
                  Text(
                    "Powered by ",
                    style: TextStyle(
                        color: blackColor, fontFamily: regular, fontSize: 20),
                  ),
                  Text(
                    "Arab Badia ",
                    style: TextStyle(
                        color: blackColor, fontFamily: bold, fontSize: 20),
                  ),
                ],
              ))
        ]));
  }
}
