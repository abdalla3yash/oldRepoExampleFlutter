import 'package:flutter/material.dart';
import 'package:lc/helper/extenstion.dart';

class ProductModel {
  String productId, name, image, description, size, price, category;
  Color color;
  ProductModel(
      {this.productId,
      this.name,
      this.image,
      this.description,
      this.color,
      this.size,
      this.price,
      this.category});

  ProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    productId = map['productId'];
    name = map['name'];
    image = map['image'];
    description = map['description'];
    color = HexColor.fromHex(map['color']);
    size = map['size'];
    price = map['price'];
    category = map['category'];
  }

  toJson() {
    return {
      'productId': productId,
      'name': name,
      'image': image,
      'description': description,
      'color': color,
      'size': size,
      'price': price,
      'category': category
    };
  }
}
