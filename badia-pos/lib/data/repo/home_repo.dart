import 'package:erpos/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../base/consts.dart';

class HomeRepo {
  final ApiClient apiClient;
  SharedPreferences sharedPreferences;
  final _connect = GetConnect();

  HomeRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getProducts() async {
    return await apiClient.getData(AppConstant.PRODUCTS_URL, headers: {
      'Authorization': '${sharedPreferences.getString("token")}',
    });
  }
}
