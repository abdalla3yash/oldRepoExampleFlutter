// ignore_for_file: unnecessary_null_comparison

import 'package:flutter/material.dart';
import 'package:market/providers/auth.dart';
import 'package:market/providers/cart.dart';
import 'package:market/providers/orders.dart';
import 'package:market/providers/product.dart';
import 'package:market/providers/products.dart';
import 'package:market/screens/auth_screen.dart';
import 'package:market/screens/home/cart_screen.dart';
import 'package:market/screens/edit_product_screen.dart';
import 'package:market/screens/orders_screen.dart';
import 'package:market/screens/product_detail_screen.dart';
import 'package:market/screens/product_overview_screen.dart';
import 'package:market/screens/splach_screen.dart';
import 'package:market/screens/user_products_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MyApp(),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: Auth()),
        ChangeNotifierProxyProvider<Auth, Products>(
          create: (_) => Products(),
          update: (
            context,
            authValue,
            previousProducts,
          ) =>
              previousProducts!.getData(
                  authValue.token,
                  authValue.userId,
                  (previousProducts = previousProducts.items as Products?) as List<Product>,
                ),
        ),
        ChangeNotifierProvider.value(
          value: Cart(),
        ),
        ChangeNotifierProxyProvider<Auth, Orders>(
          create: (_) => Orders(),
          update: (
            context,
            authValue,
            previousOrders,
          ) =>
              previousOrders!.getData(
                  authValue.token,
                  authValue.userId,
                  (previousOrders == previousOrders.orders) as List<OrderItem>,
                ),
        ),
      ],
      child: Consumer<Auth>(
        builder: (
          context,
          auth,
          _,
        ) =>
            MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            primarySwatch: Colors.amber,
            fontFamily: 'Lato',
          ),
          home: auth.isAuth
              ? ProductsOverviewScreen()
              : FutureBuilder(
                  future: auth.tryAutoLogin(),
                  builder: (
                    BuildContext context,
                    AsyncSnapshot snapshot,
                  ) =>
                      snapshot.connectionState == ConnectionState.waiting
                          ? SplachScreen()
                          : AuthScreen(),
                ),
          routes: {
            ProductDetailScreen.routeName: (_) => ProductDetailScreen(),
            CartScreen.routeName: (_) => CartScreen(),
            OrdersScreen.routeName: (_) => OrdersScreen(),
            UserProductScreen.routeName: (_) => UserProductScreen(),
            EditProductScreen.routeName: (_) => EditProductScreen(),
          },
        ),
      ),
    );
  }
}
