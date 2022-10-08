class PaymentMethodData {
  List<PaymentMethod>? data;

  PaymentMethodData({this.data});

  PaymentMethodData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <PaymentMethod>[];
      json['data'].forEach((v) {
        data!.add(PaymentMethod.fromJson(v));
      });
    }
  }

}


class PaymentMethod {
  int? status;
  String? name;
  String? code;
  String? sortOrder;

  PaymentMethod({this.status, this.name, this.sortOrder, this.code});

  PaymentMethod.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    name = json['name'];
    sortOrder = json['sort_order'];
    code = json['code'];
  }
}


