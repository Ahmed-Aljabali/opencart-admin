class AttributeData {
  List<Attribute?>? data;

  AttributeData({this.data});

  AttributeData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Attribute>[];
      json['data'].forEach((v) {
        data!.add(Attribute.fromJson(v));
      });
    }
  }

}


class Attribute {
  int? attributeId;
  String? name;
  int? sortOrder;
  int? languageId;

  Attribute({this.attributeId, this.name, this.sortOrder, this.languageId});

  Attribute.fromJson(Map<String, dynamic> json) {
    attributeId = json['attribute_id'];
    name = json['name'];
    sortOrder = json['sort_order'];
    languageId = json['language_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['attribute_id'] = attributeId;
    data['name'] = name;
    data['language_id'] = languageId;
    data['sort_order'] = sortOrder;
    return data;
  }
}


