import 'dart:math';

import 'package:flutter/material.dart';
import 'package:iscan/models/products.dart';
import 'package:iscan/provider/prod_provider.dart';
import 'package:iscan/widgets/alert.dart';
import 'package:iscan/widgets/tools.dart';
import 'package:provider/provider.dart';

class ProductItem extends StatelessWidget {
  final ProductsModal taskModel;
  ProductItem(this.taskModel);
  @override
  Widget build(BuildContext context) {
    void delete() async {
      Provider.of<ProdDBProvider>(context, listen: false)
          .deleteProduct(taskModel);
      Navigator.of(context).pop();
    }

    _deleteItem() {
      var baseDialog = BaseAlertDialog(
          title: "Delete Product!",
          content: "This Product will be delete , are you Sure?",
          yesOnPressed: delete,
          yes: "Delete",
          no: "Cancel");
      showDialog(
          context: context, builder: (BuildContext context) => baseDialog);
    }

    return InkWell(
      child: Dismissible(
        key: UniqueKey(),
        confirmDismiss: (direction) async {
          if (direction == DismissDirection.endToStart) {
            await _deleteItem();
          }
        },
        background: Container(
          color: Colors.red,
          alignment: Alignment.centerRight,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Icon(
              Icons.delete_forever,
              color: Colors.white,
            ),
          ),
        ),
        direction: DismissDirection.endToStart,
        child: Card(
          // child: ListTile(
          //     title: Text("Code: " + taskModel.productscode.toString()),
          //     trailing: Container(
          //       color: Tools.multiColors[Random().nextInt(4)],
          //       child: Padding(
          //         padding: EdgeInsets.all(5),
          //         child: Text(
          //           '  qunentity:  ' + taskModel.productsquentity.toString(),
          //           style: TextStyle(color: Colors.white),
          //         ),
          //       ),
          //     )),

          child: Row(mainAxisSize: MainAxisSize.min, children: [
            Container(
              color: Tools.multiColors[Random().nextInt(8)],
              width: 3,
              height: 60,
            ),
            Expanded(
              child: ListTile(
                  title: Text(
                    "  " + taskModel.productscode.toString(),
                    style: TextStyle(fontSize: 19),
                  ),
                  trailing: Container(
                    decoration: BoxDecoration(
                        color: Tools.multiColors[Random().nextInt(8)],
                        borderRadius: BorderRadius.circular(15)),
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Text(
                        taskModel.productsquentity.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 20),
                      ),
                    ),
                  )),
            ),
          ]),
        ),
      ),
    );
  }
}
