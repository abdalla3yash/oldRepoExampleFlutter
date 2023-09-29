import 'package:erpos/data/api/api_client.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../base/consts.dart';

class CustomerRepo {
  final ApiClient apiClient;
  SharedPreferences sharedPreferences;
  final _connect = GetConnect();

  CustomerRepo({required this.apiClient, required this.sharedPreferences});

  Future<Response> getCustomer() async {
    return await apiClient.getData(AppConstant.CUSTOMER_URL, headers: {
      'Authorization': '${sharedPreferences.getString("token")}',
    });
  }
}
