/*
// Example Usage
Map<String, dynamic> map = jsonDecode(<myJSONString>);
var myRootNode = Root.fromJson(map);
*/
import '../address.dart';
import '../Bases/base_customer.dart';

class CustomerDetails extends BaseCustomer{
  List<Address?>? addresses;
  int? customerid;
  int? customergroupid;
  String? name;
  String? ip;
  int? rewardpoints;
  String? date_added;


  CustomerDetails({this.addresses,this.customerid, this.customergroupid, this.name,this.ip, this.rewardpoints,this.date_added});

  CustomerDetails.fromJson(Map<String, dynamic> json) {
    if (json['addresses'] != null) {
      addresses = <Address>[];
      json['addresses'].forEach((v) {
        addresses!.add(Address.fromJson(v));
      });
    }
    customerid = json['customer_id'];
    customergroupid = json['customer_group_id'];
    name = json['name'];
    email = json['email'];
    newsletter = json['newsletter'];
    telephone = json['telephone'];
    status = json['status'];
    approved = json['approved'];
    safe = json['safe'];
    ip = json['ip'];
    rewardpoints = json['reward_points'];
    date_added=json['date_added'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['customer_id'] = customerid;
    data['customer_group_id'] = customergroupid;
    data['name'] = name;
    data['email'] = email;
    data['newsletter'] = newsletter;
    data['telephone'] = telephone;
    data['status'] = status;
    data['approved'] = approved;
    data['safe'] = safe;
    data['ip'] = ip;
    data['reward_points'] = rewardpoints;
    data['date_added'] = date_added;
    return data;
  }
}

class Customer {
  List<CustomerDetails?>? data;

  Customer({this.data});
  Customer.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <CustomerDetails>[];
      json['data'].forEach((v) {
        data!.add(CustomerDetails.fromJson(v));
      });
    }
  }
  //
  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();

    return data;
  }
}






