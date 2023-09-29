class ProductModel {
  bool? status;
  String? message;
  List<DataModel>? data;

  ProductModel({this.status, this.message, this.data});

  ProductModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <DataModel>[];
      json['data'].forEach((v) {
        data!.add(DataModel.fromJson(v));
      });
    }
  }
}

class DataModel {
  String? id;
  String? barcode;
  String? title;
  String? titleEn;
  String? details;
  String? detailsEn;
  String? price;
  String? image;
  String? catalogue;
  String? quantity;
  String? storeId;

  DataModel(
      {required this.id,
      required this.barcode,
      required this.title,
      required this.titleEn,
      required this.details,
      required this.detailsEn,
      required this.price,
      required this.image,
      required this.catalogue,
      required this.quantity,
      required this.storeId});

  DataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    barcode = json['barcode'];
    title = json['title'];
    titleEn = json['title_en'];
    details = json['details'];
    detailsEn = json['details_en'];
    price = json['price'];
    image = json['image'];
    catalogue = json['catalogue'];
    quantity = json['quantity'];
    storeId = json['store_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['barcode'] = barcode;
    data['title'] = title;
    data['title_en'] = titleEn;
    data['details'] = details;
    data['details_en'] = detailsEn;
    data['price'] = price;
    data['image'] = image;
    data['catalogue'] = catalogue;
    data['quantity'] = quantity;
    data['store_id'] = storeId;
    return data;
  }
}
