import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:iscan/constant.dart';
import 'package:iscan/db/database.dart';
import 'package:iscan/models/products.dart';
import 'package:iscan/models/session.dart';
import 'package:iscan/provider/prod_provider.dart';
import 'package:iscan/provider/session_provider.dart';
import 'package:iscan/view/product/add_product.dart';
import 'package:iscan/view/product/all_products.dart';
import 'package:iscan/widgets/alert.dart';
import 'package:provider/provider.dart';
import 'package:permission_handler/permission_handler.dart';
import 'dart:io';
import 'package:syncfusion_flutter_xlsio/xlsio.dart'
    hide Column, Alignment, Row;
import 'package:path_provider/path_provider.dart' as path_provider;

class ExistSession extends StatefulWidget {
  final SessionModel sessionModel;
  final ProductsModal productsModal;
  ExistSession(this.sessionModel, this.productsModal);

  @override
  _ExistSessionState createState() =>
      _ExistSessionState(this.sessionModel, this.productsModal);
}

class _ExistSessionState extends State<ExistSession> {
  final ProductsModal productsModal;

  final SessionModel sessionModel;
  _ExistSessionState(this.sessionModel, this.productsModal);
  int quentity;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          sessionModel.sessiontitle,
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: sessionModel.isEnd ? withEnd(context) : withoutEnd(context),
        ),
      ),
    );
  }

  Widget withoutEnd(BuildContext context) {
    return Column(
      children: [
        endSession(context),
        secondRow(context),
        Expanded(
          child: AllProducts(this.widget.sessionModel),
        ),
      ],
    );
  }

  Widget withEnd(BuildContext context) {
    return Column(
      children: [
        secondRow(context),
        Expanded(
          child: AllProducts(this.widget.sessionModel),
        ),
      ],
    );
  }

  Widget endSession(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => Scan(sessionModel,
                          ProductsModal('', quentity, sessionModel.sessionid))),
                );
              },
              child: Text('Add/Resume'),
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () {
                _endSession();
              },
              child: Text('End session'),
            ),
          ),
        ),
      ],
    );
  }

  void end() async {
    Navigator.of(context).pop();
    sessionModel.isEnd = !sessionModel.isEnd;
    Provider.of<DBProvider>(context, listen: false).updateTask(sessionModel);
    print(sessionModel.isEnd);
    Navigator.of(context).pop(context);
  }

  _endSession() {
    var baseDialog = BaseAlertDialog(
        title: "End Session!",
        content: "This Session will be ended forever, Are you Sure!",
        yesOnPressed: end,
        yes: "OK",
        no: "Cancel");
    showDialog(context: context, builder: (BuildContext context) => baseDialog);
  }

  Widget secondRow(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              onPressed: () => _deleteSession(),
              child: Text('Delete'),
              color: Colors.red,
              textColor: Colors.white,
            ),
          ),
        ),
        Expanded(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              child: Text('Export'),
              color: Colors.green,
              textColor: Colors.white,
              onPressed: () => generateExcel(),
            ),
          ),
        ),
      ],
    );
  }

  void delete() async {
    Navigator.of(context).pop();
    Provider.of<ProdDBProvider>(context, listen: false)
        .deleteAllProduct(sessionModel);
    Provider.of<DBProvider>(context, listen: false).deleteTask(sessionModel);
    Navigator.of(context).pop();
  }

  _deleteSession() {
    var baseDialog = BaseAlertDialog(
        title: "Delete Session!",
        content: "This session will be permanently deleted, are you sure!",
        yesOnPressed: delete,
        yes: "OK",
        no: "Cancel");
    showDialog(context: context, builder: (BuildContext context) => baseDialog);
  }

  Future<void> generateExcel() async {
    //Creating a workbook.
    final Workbook workbook = Workbook();
    //Accessing via index
    final Worksheet sheet = workbook.worksheets[0];

    // Enable calculation for worksheet.
    sheet.enableSheetCalculations();

    var result =
        await DBHelper.dbinstance.getAllProducts(sessionModel.sessionid);

    print(result);

    sheet.getRangeByIndex(1, 1).setText('product');
    sheet.getRangeByIndex(1, 2).setText('quantity');

    int i = 0;
    int y = 2;
    do {
      sheet.getRangeByIndex(y, 1).setText(result[i][productsCode]);

      sheet
          .getRangeByIndex(y, 2)
          .setText(result[i][productsQuentity].toString());
      y++;
      i++;
    } while (i < result.length);
    final List<int> bytes = workbook.saveAsStream();
    //Dispose the document.
    workbook.dispose();

    //Get the storage folder location using path_provider package.
    if (await Permission.storage.request().isGranted) {
      final Directory directory =
          await path_provider.getExternalStorageDirectory();
      final String path = directory.path;
      final File file = File('$path/${sessionModel.sessionid}.xlsx');
      await file.create(recursive: false);
      await file.writeAsBytes(bytes);

      await file.rename(
          '/storage/emulated/0/documents/${sessionModel.sessiontitle}.xlsx');

      print(sessionModel.sessionid);
      print(path);
      Fluttertoast.showToast(
        msg: 'file Saved in documents File!',
        toastLength: Toast.LENGTH_LONG,
        gravity: ToastGravity.CENTER,
        timeInSecForIosWeb: 1,
        backgroundColor: Colors.black54,
        textColor: Colors.white,
      );
    }
  }
}
