import 'package:flutter/material.dart';
import 'package:iscan/db/database.dart';
import 'package:iscan/models/products.dart';
import 'package:iscan/models/session.dart';
import 'package:sqflite/sqflite.dart';

class ProdDBProvider with ChangeNotifier {
  Database database;
  SessionModel sessionModel;
  int id;
  Future<List<ProductsModal>> getAllProducts(int id) async {
    List<Map<String, dynamic>> allTasks =
        await DBHelper.dbinstance.getAllProducts(id);
    List<ProductsModal> tasks =
        allTasks.map((e) => ProductsModal.frmJson(e)).toList();
    return tasks;
  }

  excuteAllMethods() {
    getAllProducts(id);
    notifyListeners();
  }

  insertOrUpdateProducts(ProductsModal productsModal) async {
    await DBHelper.dbinstance.insertOrUpdateProducts(productsModal);
    excuteAllMethods();
  }

  updateProduct(ProductsModal productsModal) async {
    await DBHelper.dbinstance.updateProduct(productsModal);
    excuteAllMethods();
  }

  deleteProduct(ProductsModal productsModal) async {
    await DBHelper.dbinstance.deleteProduct(productsModal);
    excuteAllMethods();
  }

  deleteAllProduct(SessionModel sessionModel) async {
    await DBHelper.dbinstance.deleteAllProducts(sessionModel);
    excuteAllMethods();
  }
}
