import 'package:erpos/data/base/consts.dart';
import 'package:erpos/data/repo/home_repo.dart';
import 'package:erpos/model/product_model.dart';

class HomeController extends GetxController implements GetxService {
  final HomeRepo homeRepo;
  HomeController({required this.homeRepo});

  bool _isLoaded = false;
  bool get isLoaded => _isLoaded;

  List<dynamic> _productList = [];
  List<dynamic> get productList => _productList;

  Future<void> getProductsList() async {
    print("here1");
    Response response = await homeRepo.getProducts();
    print("here2");
    print(response.toString());
    if (response.statusCode == 200) {
      _productList = [];
      _productList.addAll(ProductModel.fromJson(response.body).data!);
      _isLoaded = true;
      update();
    } else {}
  }
}
