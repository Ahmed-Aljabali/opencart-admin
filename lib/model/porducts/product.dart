import 'option/option.dart';

class Products{
  dynamic id;
  dynamic model;
  dynamic quantity;
  dynamic price;
  dynamic taxClassId;
  dynamic manufacturerId;
  dynamic sku;
  dynamic keyword;
  dynamic status;
  dynamic points;
  dynamic reward;
  dynamic image;
 // List<String>? otherImages;
  dynamic shipping;
  dynamic stockStatusId;
  dynamic upc;
  dynamic ean;
  dynamic jan;
  dynamic isbn;
  dynamic mpn;
  dynamic location;
  dynamic dateAvailable;
  dynamic weight;
  dynamic weightClassId;
  dynamic length;
  dynamic width;
  dynamic height;
  dynamic lengthClassId;
  dynamic subtract;
  dynamic minimum;
  dynamic sortOrder;
  List<int>? productStore;
  List<int>? productRelated;
  List<int>? productFilter;
  List<ProductDescription>? productDescription;
  List<int>? productCategory;
  List<ProductSpecial>? productSpecial;
  List<ProductDiscount>? productDiscount;
  List<ProductAttribute>? productAttribute;
  List<AddProductOption>? productOption;

  Products(
      {this.model,
        this.quantity,
        this.price,
        this.taxClassId,
        this.manufacturerId,
        this.sku,
        this.keyword,
        this.status,
        this.points,
        this.reward,
        this.image,
     //   this.otherImages,
        this.shipping,
        this.stockStatusId,
        this.upc,
        this.ean,
        this.jan,
        this.isbn,
        this.mpn,
        this.location,
        this.dateAvailable,
        this.weight,
        this.weightClassId,
        this.length,
        this.width,
        this.height,
        this.lengthClassId,
        this.subtract,
        this.minimum,
        this.sortOrder,
        this.productStore,
        this.productRelated,
        this.productFilter,
        this.productDescription,
        this.productCategory,
        this.productSpecial,
        this.productDiscount,
        this.productAttribute,
        this.productOption});

  Products.fromJson(Map<String, dynamic> json) {
    id=json['id'];
    model = json['model'];
    quantity = json['quantity'];
    price = json['price'];
    taxClassId = json['tax_class_id'];
    manufacturerId = json['manufacturer_id'];
    sku = json['sku'];
    keyword = json['keyword'];
    status = json['status'];
    points = json['points'];
    reward = json['reward'];
    image = json['image'];
  //  otherImages = json['other_images'].cast<String>();
    shipping = json['shipping'];
    stockStatusId = json['stock_status_id'];
    upc = json['upc'];
    ean = json['ean'];
    jan = json['jan'];
    isbn = json['isbn'];
    mpn = json['mpn'];
    location = json['location'];
    dateAvailable = json['date_available'];
    weight = json['weight'];
    weightClassId = json['weight_class_id'];
    length = json['length'];
    width = json['width'];
    height = json['height'];
    lengthClassId = json['length_class_id'];
    subtract = json['subtract'];
    minimum = json['minimum'];
    sortOrder = json['sort_order'];
    productStore = json['product_store'];
    productRelated = json['product_related'];
    productFilter = json['product_filter'];
    if (json['product_description'] != null) {
      productDescription = <ProductDescription>[];
      json['product_description'].forEach((v) {
        productDescription!.add( ProductDescription.fromJson(v));
      });
    }
    productCategory = json['product_category'];
    if (json['product_special'] != null) {
      productSpecial = <ProductSpecial>[];
      json['product_special'].forEach((v) {
        productSpecial!.add( ProductSpecial.fromJson(v));
      });
    }
    if (json['product_discount'] != null) {
      productDiscount = <ProductDiscount>[];
      json['product_discount'].forEach((v) {
        productDiscount!.add(ProductDiscount.fromJson(v));
      });
    }
    if (json['product_attribute'] != null) {
      productAttribute = <ProductAttribute>[];
      json['product_attribute'].forEach((v) {
        productAttribute!.add( ProductAttribute.fromJson(v));
      });
    }
    if (json['product_option'] != null) {
      productOption = <AddProductOption>[];
      json['product_option'].forEach((v) {
        productOption!.add( AddProductOption.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['model'] = model;
    data['quantity'] = quantity;
    data['price'] = price;
    data['tax_class_id'] = taxClassId;
    data['manufacturer_id'] = manufacturerId;
    data['sku'] = sku;
    data['keyword'] = keyword;
    data['status'] = status;
    data['points'] = points;
    data['reward'] = reward;
    data['image'] = image;
   // data['other_images'] = otherImages;
    data['shipping'] = shipping;
    data['stock_status_id'] = stockStatusId;
    data['upc'] = upc;
    data['ean'] = ean;
    data['jan'] = jan;
    data['isbn'] = isbn;
    data['mpn'] = mpn;
    data['location'] = location;
    data['date_available'] = dateAvailable;
    data['weight'] = weight;
    data['weight_class_id'] =weightClassId;
    data['length'] = length;
    data['width'] = width;
    data['height'] = height;
    data['length_class_id'] = lengthClassId;
    data['subtract'] = subtract;
    data['minimum'] = minimum;
    data['sort_order'] = sortOrder;
    data['product_store'] = productStore;
    data['product_related'] = productRelated;
    data['product_filter'] = productFilter;
    if (productDescription != null) {
      data['product_description'] =
          productDescription!.map((v) => v.toJson()).toList();
    }
    data['product_category'] = productCategory;
    if (productSpecial != null) {
      data['product_special'] =
          productSpecial!.map((v) => v.toJson()).toList();
    }
    if (productDiscount != null) {
      data['product_discount'] =
          productDiscount!.map((v) => v.toJson()).toList();
    }
    if (productAttribute != null) {
      data['product_attribute'] =
          productAttribute!.map((v) => v.toJson()).toList();
    }
    if (productOption != null) {
      data['product_option'] = productOption!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductDescription {
  dynamic languageId;
  dynamic name;
  dynamic description;
  dynamic metaTitle;
  dynamic metaDescription;
  dynamic metaKeyword;
  dynamic tag;

  ProductDescription(
      {this.languageId,
        this.name,
        this.description,
        this.metaTitle,
        this.metaDescription,
        this.metaKeyword,
        this.tag});

  ProductDescription.fromJson(Map<String, dynamic> json) {
    languageId = json['language_id'];
    name = json['name'];
    description = json['description'];
    metaTitle = json['meta_title'];
    metaDescription = json['meta_description'];
    metaKeyword = json['meta_keyword'];
    tag = json['tag'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['language_id'] = languageId;
    data['name'] = name;
    data['description'] = description;
    data['meta_title'] = metaTitle;
    data['meta_description'] = metaDescription;
    data['meta_keyword'] = metaKeyword;
    data['tag'] = tag;
    return data;
  }
}

class ProductSpecial {
  dynamic customerGroupId;
  dynamic price;
  dynamic priority;
  dynamic dateStart;
  dynamic dateEnd;

  ProductSpecial(
      {this.customerGroupId,
        this.price,
        this.priority,
        this.dateStart,
        this.dateEnd});

  ProductSpecial.fromJson(Map<String, dynamic> json) {
    customerGroupId = json['customer_group_id'];
    price = json['price'];
    priority = json['priority'];
    dateStart = json['date_start'];
    dateEnd = json['date_end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['customer_group_id'] = customerGroupId;
    data['price'] = price;
    data['priority'] = priority;
    data['date_start'] = dateStart;
    data['date_end'] = dateEnd;
    return data;
  }
}

class ProductDiscount {
  dynamic name;
  dynamic customerGroupId;
  dynamic price;
  dynamic priority;
  dynamic quantity;
  dynamic dateStart;
  dynamic dateEnd;

  ProductDiscount(
      {this.name,
        this.customerGroupId,
        this.price,
        this.priority,
        this.quantity,
        this.dateStart,
        this.dateEnd});

  ProductDiscount.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    customerGroupId = json['customer_group_id'];
    price = json['price'];
    priority = json['priority'];
    quantity = json['quantity'];
    dateStart = json['date_start'];
    dateEnd = json['date_end'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['customer_group_id'] = customerGroupId;
    data['price'] = price;
    data['priority'] = priority;
    data['quantity'] = quantity;
    data['date_start'] = dateStart;
    data['date_end'] = dateEnd;
    return data;
  }
}

class ProductAttribute {
  dynamic attributeId;
  List<ProductAttributeDescription>? productAttributeDescription;

  ProductAttribute({this.attributeId, this.productAttributeDescription});

  ProductAttribute.fromJson(Map<String, dynamic> json) {
    attributeId = json['attribute_id'];
    if (json['product_attribute_description'] != null) {
      productAttributeDescription = <ProductAttributeDescription>[];
      json['product_attribute_description'].forEach((v) {
        productAttributeDescription!
            .add(ProductAttributeDescription.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['attribute_id'] = attributeId;
    if (productAttributeDescription != null) {
      data['product_attribute_description'] = productAttributeDescription!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductAttributeDescription {
  String? text;
  int? languageId;

  ProductAttributeDescription({this.text, this.languageId});

  ProductAttributeDescription.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    languageId = json['language_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['text'] = text;
    data['language_id'] = languageId;
    return data;
  }
}

class ProductOptionValue {
  dynamic price;
  dynamic pricePrefix;
  dynamic subtract;
  dynamic points;
  dynamic pointsPrefix;
  dynamic weight;
  dynamic weightPrefix;
  dynamic optionValueId;
  dynamic quantity;

  ProductOptionValue(
      {this.price,
        this.pricePrefix,
        this.subtract,
        this.points,
        this.pointsPrefix,
        this.weight,
        this.weightPrefix,
        this.optionValueId,
        this.quantity});

  ProductOptionValue.fromJson(Map<String, dynamic> json) {
    price = json['price'];
    pricePrefix = json['price_prefix'];
    subtract = json['subtract'];
    points = json['points'];
    pointsPrefix = json['points_prefix'];
    weight = json['weight'];
    weightPrefix = json['weight_prefix'];
    optionValueId = json['option_value_id'];
    quantity = json['quantity'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['price'] = price;
    data['price_prefix'] = pricePrefix;
    data['subtract'] = subtract;
    data['points'] = points;
    data['points_prefix'] = pointsPrefix;
    data['weight'] = weight;
    data['weight_prefix'] = weightPrefix;
    data['option_value_id'] = optionValueId;
    data['quantity'] = quantity;
    return data;
  }
}


class ProductData {
  var data = <Products>[];

  ProductData.fromJson(Map<String, dynamic> json) {
    for (var e in (json['data'] as List)) {
      data.add(Products.fromJson(e));
    }
  }
}

