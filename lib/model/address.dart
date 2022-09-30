
import 'Bases/base_address.dart';

class Address extends BaseAddress {
  String? addressid;
  String? customerid;
  String? zoneid;
  String? zone;
  String? zonecode;
  String? countryid;
  String? country;
  String? isocode2;
  String? isocode3;
  Address({this.addressid, this.customerid, this.zoneid, this.zone, this.zonecode, this.countryid, this.country, this.isocode2, this.isocode3});

  Address.fromJson(Map<String, dynamic> json) {
    addressid = json['address_id'];
    customerid = json['customer_id'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    company = json['company'];
    address1 = json['address_1'];
    address2 = json['address_2'];
    postcode = json['postcode'];
    city = json['city'];
    zoneid = json['zone_id'];
    zone = json['zone'];
    zonecode = json['zone_code'];
    countryid = json['country_id'];
    country = json['country'];
    isocode2 = json['iso_code_2'];
    isocode3 = json['iso_code_3'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['address_id'] = addressid;
    data['customer_id'] = customerid;
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['company'] = company;
    data['address_1'] = address1;
    data['address_2'] = address2;
    data['postcode'] = postcode;
    data['city'] = city;
    data['zone_id'] = zoneid;
    data['zone'] = zone;
    data['zone_code'] = zonecode;
    data['country_id'] = countryid;
    data['country'] = country;
    data['iso_code_2'] = isocode2;
    data['iso_code_3'] = isocode3;
    return data;
  }
}