class CartProductModel {
  String name, image, price, productId;
  int quentity;
  CartProductModel(
      {this.productId, this.name, this.image, this.quentity, this.price});

  CartProductModel.fromJson(Map<dynamic, dynamic> map) {
    if (map == null) {
      return;
    }
    productId = map['productId'];
    name = map['name'];
    image = map['image'];
    quentity = map['quentity'];
    price = map['price'];
  }

  toJson() {
    return {
      'productId': productId,
      'name': name,
      'image': image,
      'quentity': quentity,
      'price': price,
    };
  }
}
