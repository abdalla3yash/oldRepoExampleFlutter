import 'package:flutter/material.dart';
import 'package:lc/view/widgets/custom_text.dart';

class CustomTextFormField extends StatelessWidget {
  final String text, hint;
  final bool obscure;
  final Function onsaved, validator;

  const CustomTextFormField(
      {Key key,
      this.text,
      this.hint,
      this.onsaved,
      this.validator,
      this.obscure})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        CustomText(
          text: text,
          fontSize: 14,
          color: Colors.grey.shade600,
        ),
        TextFormField(
          onSaved: onsaved,
          validator: validator,
          obscureText: obscure,
          decoration: InputDecoration(
              hintText: hint,
              hintStyle: TextStyle(color: Colors.black),
              fillColor: Colors.white),
        )
      ],
    );
  }
}
