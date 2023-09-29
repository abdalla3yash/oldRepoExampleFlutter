import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:read/blocs/blocs.dart';
import 'package:read/components/button.dart';
import 'package:read/components/rounded_input_field.dart';
import 'package:read/components/social_divider.dart';
import 'package:read/components/social_sign.dart';
import 'package:read/home/index.dart';
import 'package:read/sign/forget_pass.dart';
import 'package:read/sign_up/sign_up.dart';
import 'package:read/utils/devRead.dart';


class SignInPage extends StatefulWidget {
 static const String routeName = "/signin";

 @override
 _SignInPageState createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
 @override
 Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
   BlocBuilder<LoginBloc, LoginState>(builder: (context, state) {
     return Scaffold(
       resizeToAvoidBottomInset: false,
       body: SingleChildScrollView(
         child: Container(
           alignment: Alignment.center,
           child: Column(children: <Widget>[
             InkWell(
               onTap: () => Navigator.pushNamed(context, SignUp.routeName),
               child: Image.asset(
                 DevRead.sign_in_img,
                 width: size.width,
                 height: size.height * 0.1,
                 alignment: Alignment.topRight,
               ),
             ),
             SizedBox(height: size.height * 0.05),
             Padding(
               padding: const EdgeInsets.only(left: 30),
               child: Row(
                 children: <Widget>[
                   Text(
                     'WELCOME ',
                     style: TextStyle(
                       fontWeight: FontWeight.bold,
                       fontSize: 25.0,
                     ),
                   ),
                   Text(
                     'BACK!',
                     style: TextStyle(
                       fontSize: 25.0,
                     ),
                   ),
                 ],
               ),
             ),
             Container(
               alignment: Alignment.centerLeft,
               child: Padding(
                 padding: EdgeInsets.only(left: 30),
                 child: Text(DevRead.sign_in_subtitle,
                     style: TextStyle(
                       fontSize: 17.0,
                     )),
               ),
             ),
             SizedBox(
               height: size.height * 0.05,
             ),
             RoundedInputField(
               hintText: DevRead.email,
             ),
             RoundedInputField(
               hintText: DevRead.password,
             ),
             Padding(
               padding: const EdgeInsets.all(16.0),
               child: Button(
                 textcolor: Colors.white,
                 textsize: 16,
                 height: 50,
                 width: size.width * 0.9,
                 text1: DevRead.sign_in,
                 color: Color.fromRGBO(250, 166, 26, 1),
                 onTap: () => Navigator.pushAndRemoveUntil(
                   context,
                   MaterialPageRoute(builder: (context) => HomePage()),
                   (Route<dynamic> route) => false,
                 ),
               ),
             ),
             GestureDetector(
               onTap: () =>
                   Navigator.pushNamed(context, ForgetPassword.routeName),
               child: Center(
                 child: Text(
                   'FORGET PASSWORD?',
                   style: TextStyle(
                     fontSize: 13.0,
                     fontWeight: FontWeight.bold,
                     color: Color.fromRGBO(120, 132, 158, 1),
                   ),
                 ),
               ),
             ),
             SizedBox(
               height: size.height * 0.25,
             ),
             SocialDivider(),
             SizedBox(
               height: 10,
             ),
             SocialSign(),
           ]),
         ),
       ),
     );
   });
 }
}


