import 'package:json_annotation/json_annotation.dart';
part 'responces.g.dart';

@JsonSerializable()
class BaseResponce {
  @JsonKey(name: "status")
  int? status;
  @JsonKey(name: "message")
  String? message;
}

@JsonSerializable()
class CustomerResponce {
  @JsonKey(name: "id")
  String? id;
  @JsonKey(name: "name")
  String? name;
  @JsonKey(name: "numOfNotifications")
  int? numOfNotifications;
  CustomerResponce(this.id, this.name, this.numOfNotifications);

  //from json
  factory CustomerResponce.fromJson(Map<String, dynamic> json) =>
      _$CustomerResponceFromJson(json);
  // to json

  Map<String, dynamic> toJson() => _$CustomerResponceToJson(this);
}

@JsonSerializable()
class ContactsResponce {
  @JsonKey(name: "phone")
  String? phone;
  @JsonKey(name: "email")
  String? email;
  @JsonKey(name: "link")
  String? link;
  ContactsResponce(this.email, this.link, this.phone);

  //from json
  factory ContactsResponce.fromJson(Map<String, dynamic> json) =>
      _$ContactsResponceFromJson(json);
  // to json

  Map<String, dynamic> toJson() => _$ContactsResponceToJson(this);
}

@JsonSerializable()
class AuthencationResponse extends BaseResponce {
  @JsonKey(name: "customer")
  CustomerResponce? customer;
  @JsonKey(name: "contacts")
  ContactsResponce? contacts;
  AuthencationResponse(this.customer, this.contacts);

  //from json
  factory AuthencationResponse.fromJson(Map<String, dynamic> json) =>
      _$AuthencationResponseFromJson(json);
  // to json

  Map<String, dynamic> toJson() => _$AuthencationResponseToJson(this);
}
