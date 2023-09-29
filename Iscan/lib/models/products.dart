import 'package:flutter/foundation.dart';
import 'package:iscan/constant.dart';

class ProductsModal with ChangeNotifier {
  int productsid;
  String productscode;
  int productsquentity;
  int sessionIId;

  ProductsModal(this.productscode, this.productsquentity, this.sessionIId);

  ProductsModal.frmJson(Map<String, dynamic> map) {
    this.productsid = map[productsId];
    this.productscode = map[productsCode];
    this.productsquentity = map[productsQuentity];
    this.sessionIId = map[podsessionId];
  }

  toJson() {
    return {
      productsCode: this.productscode,
      productsQuentity: this.productsquentity,
      podsessionId: this.sessionIId,
    };
  }
}
