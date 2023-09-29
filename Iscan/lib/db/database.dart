import 'dart:io';

import 'package:iscan/constant.dart';
import 'package:iscan/models/products.dart';
import 'package:iscan/models/session.dart';
import 'package:path_provider/path_provider.dart';
import 'package:sqflite/sqflite.dart';

class DBHelper {
  DBHelper._();
  static final DBHelper dbinstance = DBHelper._();
  Database database;

  Future<Database> initDb() async {
    if (database == null) {
      database = await connectToDb();
      return database;
    } else {
      return database;
    }
  }

  Future<Database> connectToDb() async {
    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String dbPath = appDocPath + dbName;
    Database db = await openDatabase(dbPath,
        version: 1, onCreate: _createDb, onConfigure: _onConfigure);
    return db;
  }

  void _createDb(Database db, int newVersion) async {
    await db.execute(
        '''CREATE TABLE $sessiontable($sessionId INTEGER PRIMARY KEY AUTOINCREMENT, $sessionTitle TEXT ,$sessionDate TEXT, $sessionIsEnd BOOLEAN )''');
    await db.execute(
        '''CREATE TABLE $productsTable($productsId INTEGER PRIMARY KEY AUTOINCREMENT, $productsCode TEXT ,$productsQuentity INTEGER, $podsessionId INTEGER,FOREIGN KEY ($podsessionId) REFERENCES $sessiontable ($sessionId) ON DELETE NO ACTION ON UPDATE NO ACTION)''');
    
  }

  void _onConfigure(Database db) async {
    await db.execute('PRAGMA foreign_keys = ON');
  }

  insertNewSession(SessionModel sessionModel) async {
    database = await initDb();
    database.insert(sessiontable, sessionModel.toJson());
  }

  insertOrUpdateProducts(ProductsModal productsModal) async {
    database = await initDb();
    var currentproduct = await database.rawQuery(
        "SELECT * FROM $productsTable WHERE $productsCode LIKE '%${productsModal.productscode}%' and $podsessionId LIKE'%${productsModal.sessionIId}%';");

    print(currentproduct);
    if (currentproduct.isEmpty) {
      var result = await database.rawInsert(
        "INSERT Into $productsTable ($productsCode,$productsQuentity,$podsessionId) "
        "VALUES (?,?,?)",
        [
          productsModal.productscode,
          productsModal.productsquentity,
          productsModal.sessionIId
        ],
      );
      return result;
    } else {
      print('Update Row!');
      int i = 0;
      List<Map> prodQuentity = await database.rawQuery(
          "SELECT $productsQuentity FROM $productsTable WHERE $productsCode LIKE '%${productsModal.productscode}%' and $podsessionId LIKE'%${productsModal.sessionIId}%';");
      print(prodQuentity[i][productsQuentity]);
      int value = prodQuentity[i][productsQuentity];
      var response = database.rawUpdate(
          "UPDATE $productsTable SET $productsQuentity= ${productsModal.productsquentity} + $value  WHERE $productsCode LIKE '%${productsModal.productscode}%' and $podsessionId LIKE'%${productsModal.sessionIId}%';");
      return response;
    }
  }

  Future<List<Map<String, dynamic>>> getAllSessions() async {
    database = await initDb();
    List<Map<String, dynamic>> response =
        await database.query(sessiontable, orderBy: "$sessionId DESC");
    return response;
  }

  Future<List<Map<String, dynamic>>> getAllProducts(int id) async {
    database = await initDb();
    List<Map<String, dynamic>> response = await database
        .rawQuery('SELECT * FROM $productsTable WHERE $podsessionId = $id');
    return response;
  }

  updateSession(SessionModel sessionModel) async {
    database = await initDb();
    database.update(sessiontable, sessionModel.toJson(),
        where: '$sessionId = ?', whereArgs: [sessionModel.sessionid]);
  }

  updateProduct(ProductsModal productsModal) async {
    database = await initDb();
    database.update(productsTable, productsModal.toJson(),
        where: '$productsId = ?', whereArgs: [productsModal.productsid]);
  }

  deleteSession(SessionModel sessionModel) async {
    database = await initDb();
    database.delete(sessiontable,
        where: '$sessionId = ?', whereArgs: [sessionModel.sessionid]);
  }

  deleteProduct(ProductsModal productsModal) async {
    database = await initDb();
    database.delete(productsTable,
        where: '$productsId = ?', whereArgs: [productsModal.productsid]);
  }

  deleteAllSessions() async {
    database = await initDb();
    database.delete(sessiontable);
  }

  deleteAllProducts(SessionModel sessionModel) async {
    database = await initDb();
    database.delete(productsTable,
        where: '$podsessionId = ?', whereArgs: [sessionModel.sessionid]);
  }
}
