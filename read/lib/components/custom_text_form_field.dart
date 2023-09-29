import 'package:flutter/material.dart';


class CustomTextFormField extends StatelessWidget {

final String hintText;
final Function validate;
final bool obscureText;

  const CustomTextFormField({Key key, this.hintText, this.validate, this.obscureText}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      margin: EdgeInsets.symmetric(vertical: 10),
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 0),
      height: 50,
      width: size.width * 0.9,
      decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 1,
              blurRadius: 7,
              offset: Offset(0, 3),
            ),
          ],
          borderRadius: BorderRadius.circular(30.0)),
      child: Center(
        child: TextFormField(
          obscureText: obscureText,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hintText,
                focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                      color: Colors.white, width: 1),
                  borderRadius: BorderRadius.circular(30.0),
                )),
            validator: validate,
            ),
      ),
    );
  }

}
