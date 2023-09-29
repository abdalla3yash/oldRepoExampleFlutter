import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';

class HomeService {
  final CollectionReference _categoryCollectionRef =
      FirebaseFirestore.instance.collection('categories');

  final CollectionReference _productsCollectionRef =
      FirebaseFirestore.instance.collection('products');

  var _productModel = [];
  get productModel => _productModel;

  Future<List<QueryDocumentSnapshot>> getCategory() async {
    var value = await _categoryCollectionRef.get();
    print(value.docs);

    return value.docs;
  }

  Future<List<QueryDocumentSnapshot>> getBestSelling() async {
    var value = await _productsCollectionRef.get();
    print(value.docs);
    return value.docs;
  }
}
