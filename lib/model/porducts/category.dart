class CategoryData {
  List<Categories>? data;

  CategoryData({this.data});

  CategoryData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Categories>[];
      json['data'].forEach((v) {
        data!.add(Categories.fromJson(v));
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

class Categories {
  int? categoryId;
  String? name;
  String? description;
  int? sortOrder;
  String? metaTitle;
  String? metaDescription;
  String? metaKeyword;
  int? languageId;
  int? status;
  int? parentId;
  int? column;
  int? top;

  Categories(
      {this.categoryId,
        this.name,
        this.description,
        this.sortOrder,
        this.metaTitle,
        this.metaDescription,
        this.metaKeyword,
        this.languageId,
        this.status,
        this.parentId,
        this.column,
        this.top});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryId = json['category_id'];
    name = json['name'];
    description = json['description'];
    sortOrder = json['sort_order'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeyword = json['meta_keyword'];
    languageId = json['language_id'];
    status = json['status'];
    parentId = json['parent_id'];
    column = json['column'];
    top = json['top'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['category_id'] = categoryId;
    data['name'] = name;
    data['description'] = description;
    data['sort_order'] = sortOrder;
    data['meta_title'] =metaTitle;
    data['meta_description'] =metaDescription;
    data['meta_keyword'] =metaKeyword;
    data['language_id'] = languageId;
    data['status'] = status;
    data['parent_id'] =parentId;
    data['column'] = column;
    data['top'] =top;
    return data;
  }
}