// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'responces.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

BaseResponce _$BaseResponceFromJson(Map<String, dynamic> json) => BaseResponce()
  ..status = json['status'] as int?
  ..message = json['message'] as String?;

Map<String, dynamic> _$BaseResponceToJson(BaseResponce instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
    };

CustomerResponce _$CustomerResponceFromJson(Map<String, dynamic> json) =>
    CustomerResponce(
      json['id'] as String?,
      json['name'] as String?,
      json['numOfNotifications'] as int?,
    );

Map<String, dynamic> _$CustomerResponceToJson(CustomerResponce instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'numOfNotifications': instance.numOfNotifications,
    };

ContactsResponce _$ContactsResponceFromJson(Map<String, dynamic> json) =>
    ContactsResponce(
      json['email'] as String?,
      json['link'] as String?,
      json['phone'] as String?,
    );

Map<String, dynamic> _$ContactsResponceToJson(ContactsResponce instance) =>
    <String, dynamic>{
      'phone': instance.phone,
      'email': instance.email,
      'link': instance.link,
    };

AuthencationResponse _$AuthencationResponseFromJson(
        Map<String, dynamic> json) =>
    AuthencationResponse(
      json['customer'] == null
          ? null
          : CustomerResponce.fromJson(json['customer'] as Map<String, dynamic>),
      json['contacts'] == null
          ? null
          : ContactsResponce.fromJson(json['contacts'] as Map<String, dynamic>),
    )
      ..status = json['status'] as int?
      ..message = json['message'] as String?;

Map<String, dynamic> _$AuthencationResponseToJson(
        AuthencationResponse instance) =>
    <String, dynamic>{
      'status': instance.status,
      'message': instance.message,
      'customer': instance.customer,
      'contacts': instance.contacts,
    };
