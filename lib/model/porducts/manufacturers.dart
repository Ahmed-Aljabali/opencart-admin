class ManufacturersData {
  List<Manufacturers>? data;

  ManufacturersData({this.data});

  ManufacturersData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Manufacturers>[];
      json['data'].forEach((v) {
        data!.add( Manufacturers.fromJson(v));
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

class Manufacturers {
  int? manufacturerId;
  String? name;
  int? sortOrder;
  String? image;
  String? originalImage;

  Manufacturers(
      {this.manufacturerId,
        this.name,
        this.sortOrder,
        this.image,
        this.originalImage});

  Manufacturers.fromJson(Map<String, dynamic> json) {
    manufacturerId = json['manufacturer_id'];
    name = json['name'];
    sortOrder = json['sort_order'];
    image = json['image'];
    originalImage = json['original_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['manufacturer_id'] = manufacturerId;
    data['name'] = name;
    data['sort_order'] = sortOrder;
    data['image'] = image;
    data['original_image'] = originalImage;
    return data;
  }
}