import 'package:erpos/data/base/consts.dart';
import 'package:erpos/data/repo/customer_repo.dart';
import 'package:erpos/model/customer_model.dart';

class CustomerController extends GetxController implements GetxService {
  final CustomerRepo customerRepo;
  CustomerController({required this.customerRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List<dynamic> _customerList = [];
  List<dynamic> get customerList => _customerList;

  Future<void> getCustomerList() async {
    print("here1");
    Response response = await customerRepo.getCustomer();
    print("here2");
    print(response.toString());
    if (response.statusCode == 200) {
      _customerList = [];
      _customerList.addAll(CustomerModel.fromJson(response.body).data!);
      _isLoaded = true;
      update();
    } else {}
  }
}
