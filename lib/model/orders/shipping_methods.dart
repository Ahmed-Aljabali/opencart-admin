class ShippingMethodsData {
  List<ShippingMethods>? data;

  ShippingMethodsData({this.data});

  ShippingMethodsData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ShippingMethods>[];
      json['data'].forEach((v) {
        data!.add(ShippingMethods.fromJson(v));
      });
    }
  }

}


class ShippingMethods {
  int? status;
  String? name;
  String? code;
  String? sortOrder;

  ShippingMethods({this.status, this.name, this.sortOrder, this.code});

  ShippingMethods.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    sortOrder = json['sort_order'];
    code = json['code'];
  }
}


