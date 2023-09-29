import 'package:shop_app/components/components.dart';
import 'package:shop_app/screens/login/login_screen.dart';
import 'package:shop_app/shared/network/remote/cache_helper.dart';

void signOut(context) {
  CacheHelper.removeDate(key: 'token').then((value) {
    if (value) {
      navigateAndFinish(context, ShopLoginScreen());
    }
  });
}

String token = '';
String uID = '';

void printFullText(String text) {
  final pattern = RegExp('.{1800}');
  // ignore: avoid_print
  pattern.allMatches(text).forEach((element) => print(element.group(0)));
}
