import 'package:erpos/data/base/consts.dart';

Widget CustomFee(
    {required BuildContext context,
    required String title,
    required String data}) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.spaceBetween,
    children: [
      Text(
        title,
        style:
            const TextStyle(color: hintColor, fontFamily: bold, fontSize: 16),
      ),
      Container(
        decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(
              color: appColor,
              width: 1,
            )),
        width: MediaQuery.of(context).size.width * 0.4,
        height: MediaQuery.of(context).size.height * 0.05,
        child: Center(
          child: Text(
            data,
            style: const TextStyle(
                color: blackColor, fontFamily: bold, fontSize: 20),
          ),
        ),
      ),
    ],
  );
}
