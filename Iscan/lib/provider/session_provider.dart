import 'package:flutter/material.dart';
import 'package:iscan/db/database.dart';
import 'package:iscan/models/session.dart';

class DBProvider with ChangeNotifier {
  Future<List<SessionModel>> getAllSessions() async {
    List<Map<String, dynamic>> allTasks =
        await DBHelper.dbinstance.getAllSessions();
    List<SessionModel> tasks =
        allTasks.map((e) => SessionModel.frmJson(e)).toList();
    return tasks;
  }

  excuteAllMethods() {
    getAllSessions();
    notifyListeners();
  }

  insertNewData(SessionModel taskModel) async {
    await DBHelper.dbinstance.insertNewSession(taskModel);
    excuteAllMethods();
  }

  updateTask(SessionModel taskModel) async {
    await DBHelper.dbinstance.updateSession(taskModel);
    excuteAllMethods();
  }

  deleteTask(SessionModel taskModel) async {
    await DBHelper.dbinstance.deleteSession(taskModel);
    excuteAllMethods();
  }
}
