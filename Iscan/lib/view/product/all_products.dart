import 'package:flutter/material.dart';
import 'package:iscan/models/products.dart';
import 'package:iscan/models/session.dart';
import 'package:iscan/provider/prod_provider.dart';
import 'package:iscan/view/product/product_item.dart';
import 'package:provider/provider.dart';

class AllProducts extends StatelessWidget {
  final SessionModel sessionModel;
  AllProducts(this.sessionModel);
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return Consumer<ProdDBProvider>(
      builder: (context, ProdDBProvider value, child) {
        return FutureBuilder<List<ProductsModal>>(
          future: value.getAllProducts(sessionModel.sessionid),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              if (snapshot.hasData) {
                List<ProductsModal> products = snapshot.data;
                if (products.length == 0) {
                  return Center(
                    child: Text(
                      'No Products Found!',
                      style: TextStyle(color: Theme.of(context).disabledColor),
                    ),
                  );
                }
                return ListView.builder(
                  itemCount: products.length,
                  itemBuilder: (context, index) {
                    return ProductItem(products[index]);
                  },
                );
              }
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        );
      },
    );
  }
}
