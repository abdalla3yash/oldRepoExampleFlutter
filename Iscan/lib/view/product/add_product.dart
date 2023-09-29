import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:iscan/models/products.dart';
import 'package:iscan/models/session.dart';
import 'package:iscan/provider/prod_provider.dart';
import 'package:iscan/view/product/all_products.dart';
import 'package:provider/provider.dart';

class Scan extends StatefulWidget {
  final SessionModel session;
  final ProductsModal productsModal;
  Scan(this.session, this.productsModal);

  @override
  _ScanState createState() => _ScanState(this.session, this.productsModal);
}

class _ScanState extends State<Scan> {
  final SessionModel session;
  final ProductsModal productsModal;
  _ScanState(this.session, this.productsModal);

  TextEditingController barcodecontroller;
  TextEditingController quentityController;
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  String barcodeScanRes;

  @override
  void initState() {
    super.initState();
    barcodecontroller = new TextEditingController();
    quentityController = new TextEditingController(text: '1');
  }

  scanBarcodeNormal() async {
    try {
      barcodeScanRes = await FlutterBarcodeScanner.scanBarcode(
          "#ff6666", "Cancel", true, ScanMode.BARCODE);
      if (barcodeScanRes != '-1') {
        scanshowAlertDialog(context);
      } else {
        return;
      }
    } on PlatformException {
      barcodeScanRes = 'Failed to get platform version.';
    }
    if (!mounted) {
      return Navigator.of(context).pop();
    }
  }

  scanshowAlertDialog(BuildContext context) {
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        final FormState form = _formKey.currentState;
        if (form.validate()) {
          int value1 = int.parse(quentityController.text);
          ProductsModal taskModel =
              ProductsModal(barcodeScanRes, value1, productsModal.sessionIId);
          Provider.of<ProdDBProvider>(context, listen: false)
              .insertOrUpdateProducts(taskModel);
          quentityController.clear();
          quentityController..text = '1';
          barcodecontroller.clear();
          Navigator.of(context).pop();
          scanBarcodeNormal();
        }
      },
    );

    Widget cancel = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      title: Text(' $barcodeScanRes'),
      content: TextFormField(
        controller: quentityController,
        keyboardType: TextInputType.number,
        decoration: new InputDecoration(labelText: 'Quentity'),
        inputFormatters: <TextInputFormatter>[
          FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
        ],
        validator: (val) => val.isEmpty ? "Enter Quentity" : null,
      ),
      actions: [
        cancel,
        okButton,
      ],
    );

    // show the dialog
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Form(
          key: _formKey,
          child: alert,
        );
      },
    );
  }

  showAlertDialog(BuildContext context) {
    // set up the button
    Widget okButton = FlatButton(
      child: Text("OK"),
      onPressed: () {
        final FormState form = _formKey.currentState;
        if (form.validate()) {
          int value1 = int.parse(quentityController.text);

          ProductsModal taskModel = ProductsModal(
              barcodecontroller.text, value1, productsModal.sessionIId);

          Provider.of<ProdDBProvider>(context, listen: false)
              .insertOrUpdateProducts(taskModel);
          barcodecontroller.clear();
          quentityController.clear();
          quentityController..text = '1';
          Navigator.of(context).pop();
        }
      },
    );

    Widget cancel = FlatButton(
      child: Text("Cancel"),
      onPressed: () {
        Navigator.of(context).pop();
      },
    );

    // set up the AlertDialog
    AlertDialog alert = AlertDialog(
      shape:
          RoundedRectangleBorder(borderRadius: new BorderRadius.circular(15)),
      title: Text('Add product'),
      content: Container(
        height: MediaQuery.of(context).size.height * .22,
        child: Column(
          children: [
            TextFormField(
              controller: barcodecontroller,
              decoration: new InputDecoration(labelText: 'product Name'),
              validator: (val) => val.isEmpty ? "Enter product Name" : null,
            ),
            TextFormField(
              controller: quentityController,
              keyboardType: TextInputType.number,
              decoration: new InputDecoration(labelText: 'Quentity'),
              inputFormatters: <TextInputFormatter>[
                FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
              ],
              validator: (val) => val.isEmpty ? "Enter Quentity" : null,
            ),
          ],
        ),
      ),
      actions: [
        cancel,
        okButton,
      ],
    );
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Form(
          key: _formKey,
          child: alert,
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: Text(
            session.sessiontitle,
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
        ),
        body: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {
                        scanBarcodeNormal();
                      },
                      child: Text('Scan'),
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: RaisedButton(
                      onPressed: () {
                        showAlertDialog(context);
                      },
                      child: Text('Add Manually'),
                    ),
                  ),
                ),
              ],
            ),
            Expanded(
              child: AllProducts(this.session),
            ),
          ],
        ),
      ),
    );
  }
}
