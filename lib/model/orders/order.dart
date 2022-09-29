class Orders {
  dynamic? orderid;
  String? name;
  String? status;
  String? dateadded;
  int? products;
  String? total;
  String? currencycode;
  String? currencyvalue;

  Orders({this.orderid, this.name, this.status, this.dateadded, this.products, this.total, this.currencycode, this.currencyvalue});

  Orders.fromJson(Map<String, dynamic> json) {
    orderid = json['order_id'];
    name = json['name'];
    status = json['status'];
    dateadded = json['date_added'];
    products = json['products'];
    total = json['total'];
    currencycode = json['currency_code'];
    currencyvalue = json['currency_value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['order_id'] = orderid;
    data['name'] = name;
    data['status'] = status;
    data['date_added'] = dateadded;
    data['products'] = products;
    data['total'] = total;
    data['currency_code'] = currencycode;
    data['currency_value'] = currencyvalue;
    return data;
  }
}

class OrdersData {
  var data = <Orders>[];
  OrdersData.fromJson(Map<String, dynamic> json) {
    (json['data'] as List).forEach((e) => data.add(Orders.fromJson(e)));

  }


}