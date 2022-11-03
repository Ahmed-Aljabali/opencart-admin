class VoucherData {
  List<Vouchers>? data;

  VoucherData({this.data});

  VoucherData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Vouchers>[];
      json['data'].forEach((v) {
        data!.add(Vouchers.fromJson(v));
      });
    }
  }

}


class Vouchers {
  int? id;
  String? code;
  Vouchers({this.id, this.code});

  Vouchers.fromJson(Map<String, dynamic> json) {
    id = json['voucher_id'];
    code = json['code'];
  }
}


