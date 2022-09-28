class ProductOptions {
  int? optionid;
  String? name;
  String? type;
  int? sortorder;

  ProductOptions({this.optionid, this.name, this.type, this.sortorder});

  ProductOptions.fromJson(Map<String, dynamic> json) {
    optionid = json['option_id'];
    name = json['name'];
    type = json['type'];
    sortorder = json['sort_order'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['option_id'] = optionid;
    data['name'] = name;
    data['type'] = type;
    data['sort_order'] = sortorder;
    return data;
  }
}

class Root {
  List<ProductOptions?>? data;

  Root({this.data});

  Root.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <ProductOptions>[];
      json['data'].forEach((v) {
        data!.add(ProductOptions.fromJson(v));
      });
    }
  }

}

