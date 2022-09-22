import 'dart:core';
import '../Bases/base_address.dart';
import '../Bases/base_customer.dart';

class PostCustomer extends BaseCustomer {
  String? firstname;
  String? lastname;
  String? password;
  String? confirm;
  String? fax;
  int? customerGroupId;
  CustomField? customField;
  List<Address>? address;

  PostCustomer({this.firstname, this.lastname, this.password, this.confirm,this.fax,this.customerGroupId, this.customField, this.address});

  PostCustomer.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    password = json['password'];
    confirm = json['confirm'];
    telephone = json['telephone'];
    fax = json['fax'];
    newsletter = json['newsletter'];
    status = json['status'];
    approved = json['approved'];
    safe = json['safe'];
    customerGroupId = json['customer_group_id'];
    customField = json['custom_field'] != null ? CustomField.fromJson(json['custom_field']) : null;
    if (json['address'] != null) {
      address = <Address>[];
      json['address'].forEach((v) { address!.add(Address.fromJson(v)); });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['password'] = password;
    data['confirm'] = confirm;
    data['telephone'] = telephone;
    data['fax'] = fax;
    data['newsletter'] = newsletter;
    data['status'] = status;
    data['approved'] = approved;
    data['safe'] = safe;
    data['customer_group_id'] = customerGroupId;
    if (customField != null) {
      data['custom_field'] = customField!.toJson();
    }
    if (address != null) {
      data['address'] = address!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CustomField {
  String? s1;
  int? i2;

  CustomField({this.s1, this.i2});

  CustomField.fromJson(Map<String, dynamic> json) {
    s1 = json['1'];
    i2 = json['2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['1'] = s1;
    data['2'] = i2;
    return data;
  }
}


class Address extends BaseAddress{
  int? countryId;
  int? zoneId;
  int? addressId;
  CustomField? customField;

  Address({this.countryId,this.zoneId,this.addressId,this.customField});

Address.fromJson(Map<String, dynamic> json) {
firstname = json['firstname'];
lastname = json['lastname'];
company = json['company'];
city = json['city'];
address1 = json['address_1'];
countryId = json['country_id'];
postcode = json['postcode'];
zoneId = json['zone_id'];
address2 = json['address_2'];
addressId = json['address_id'];
//default = json['default'];
customField = json['custom_field'] != null ?  CustomField.fromJson(json['custom_field']) : null;
}

Map<String, dynamic> toJson() {
  final Map<String, dynamic> data =  <String, dynamic>{};
  data['firstname'] = firstname;
  data['lastname'] = lastname;
  data['company'] = company;
  data['city'] = city;
  data['address_1'] = address1;
  data['country_id'] = countryId;
  data['postcode'] = postcode;
  data['zone_id'] = zoneId;
  data['address_2'] = address2;
  data['address_id'] = addressId;
  if (customField != null) {
  data['custom_field'] = customField!.toJson();
  }
  return data;
}
}

class CustomFieldAddress {
  String? s3;

  CustomFieldAddress({this.s3});

  CustomFieldAddress.fromJson(Map<String, dynamic> json) {
    s3 = json['3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['3'] = s3;
    return data;
  }
}
