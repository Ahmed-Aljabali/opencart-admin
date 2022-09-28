class StoresData {
  List<Stores>? data;

  StoresData({this.data});

  StoresData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Stores>[];
      json['data'].forEach((v) {
        data!.add(Stores.fromJson(v));
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

class Stores {
  int? storeId;
  String? name;


  Stores(
      {this.storeId,
        this.name,
       });

  Stores.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['store_id'] = storeId;
    data['name'] = name;

    return data;
  }
}