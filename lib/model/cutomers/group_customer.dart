class GroupCustomer {
  List<Data>? data;

  GroupCustomer({this.data});

  GroupCustomer.fromJson(Map<String, dynamic> json) {

    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};

    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  int? customerGroupId;
  String? name;
  int? sortOrder;
  int? approval;
  int? description;
  int? languageId;

  Data(
      {this.customerGroupId,
        this.name,
        this.sortOrder,
        this.approval,
        this.description,
        this.languageId});

  Data.fromJson(Map<String, dynamic> json) {
    customerGroupId = json['customer_group_id'];
    name = json['name'];
    sortOrder = json['sort_order'];
    approval = json['approval'];
    description = json['description'];
    languageId = json['language_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['customer_group_id'] = customerGroupId;
    data['name'] = name;
    data['sort_order'] = sortOrder;
    data['approval'] = approval;
    data['description'] = description;
    data['language_id'] = languageId;
    return data;
  }
}