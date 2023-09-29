class CustomerModel {
  bool? status;
  String? message;
  List<CustomerDataModel>? data;

  CustomerModel({this.status, this.message, this.data});

  CustomerModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CustomerDataModel>[];
      json['data'].forEach((v) {
        data!.add(CustomerDataModel.fromJson(v));
      });
    }
  }
}

class CustomerDataModel {
  String? id;
  String? arTitle;
  String? enTitle;

  CustomerDataModel({this.id, this.arTitle, this.enTitle});

  CustomerDataModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    arTitle = json['ar_title'];
    enTitle = json['en_title'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['ar_title'] = arTitle;
    data['en_title'] = enTitle;
    return data;
  }
}
