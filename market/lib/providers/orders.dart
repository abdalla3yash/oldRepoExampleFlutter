import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:market/providers/cart.dart';
import 'package:http/http.dart' as http;

class OrderItem {
  final String id;
  final List<CartItem> products;
  final double amount;
  final DateTime dateTime;

  OrderItem({
    required this.id,
    required this.products,
    required this.dateTime,
    required this.amount,
  });
}

class Orders extends ChangeNotifier {
  List<OrderItem> _orders = [];
  String? authToken, userId;

  List<OrderItem> get orders {
    return [..._orders];
  }

  getData(String userToken, String uId, List<OrderItem> orders) {
    authToken = userToken;
    userId = uId;
    _orders = orders;
    notifyListeners();
  }

  Future<void> fetchAndSetOrders() async {
    var url = Uri.parse(
        'https://market-839bb-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken');

    try {
      final res = await http.get(url);
      final extractedData = json.decode(res.body) as Map<String, dynamic>;
      if (extractedData == null) {
        return;
      }

      final List<OrderItem> loadedOrders = [];
      extractedData.forEach((orderId, orderData) {
        loadedOrders.add(
          OrderItem(
            id: orderId,
            amount: orderData['amount'],
            dateTime: DateTime.parse(orderData['dateTime']),
            products: (orderData['products'] as List<dynamic>)
                .map((item) => CartItem(
                    id: item['id'],
                    price: item['price'],
                    quentity: item['quentity'],
                    title: item['title']))
                .toList(),
          ),
        );
      });
      _orders = loadedOrders.reversed.toList();
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }

  Future<void> addOrder(List<CartItem> cartProduct, double total) async {
    final url = Uri.parse(
        'https://market-839bb-default-rtdb.firebaseio.com/orders/$userId.json?auth=$authToken');
    try {
      final timeStamp = DateTime.now();
      final res = await http.post(
        url,
        body: json.encode({
          'amount': total,
          'dateTime': timeStamp.toIso8601String(),
          'products': cartProduct
              .map((cp) => {
                    'id': cp.id,
                    'title': cp.title,
                    'quentity': cp.quentity,
                    'price': cp.price,
                  })
              .toList(),
        }),
      );
      _orders.insert(
          0,
          OrderItem(
              id: json.decode(res.body)['name'],
              products: cartProduct,
              dateTime: timeStamp,
              amount: total));
      notifyListeners();
    } catch (e) {
      throw e;
    }
  }
}
