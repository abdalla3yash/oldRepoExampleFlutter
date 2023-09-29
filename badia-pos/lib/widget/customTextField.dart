// ignore_for_file: file_names

import 'package:erpos/data/base/consts.dart';

Widget customTextField({
  String? hint,
  TextEditingController? controller,
  bool? isPass,
}) {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.start,
    children: [
      TextFormField(
        controller: controller,
        obscureText: isPass!,
        textAlign: TextAlign.right,
        decoration: InputDecoration(
          border: const UnderlineInputBorder(),
          hintText: hint,
          hintStyle: const TextStyle(fontFamily: medium, color: hintColor),
          isDense: true,
        ),
        validator: (text) {
          if (text == null || text.isEmpty) {
            return 'البيانات غير صحيحه';
          }
          return null;
        },
      ),
    ],
  );
}
