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
  List<ProductOption>? productOption;

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
      productOption = <ProductOption>[];
      json['product_option'].forEach((v) {
        productOption!.add( ProductOption.fromJson(v));
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
    data['product_category'] = this.productCategory;
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
      data['product_option'] =
          productOption!.map((v) => v.toJson()).toList();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language_id'] = this.languageId;
    data['name'] = this.name;
    data['description'] = this.description;
    data['meta_title'] = this.metaTitle;
    data['meta_description'] = this.metaDescription;
    data['meta_keyword'] = this.metaKeyword;
    data['tag'] = this.tag;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['customer_group_id'] = this.customerGroupId;
    data['price'] = this.price;
    data['priority'] = this.priority;
    data['date_start'] = this.dateStart;
    data['date_end'] = this.dateEnd;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['customer_group_id'] = this.customerGroupId;
    data['price'] = this.price;
    data['priority'] = this.priority;
    data['quantity'] = this.quantity;
    data['date_start'] = this.dateStart;
    data['date_end'] = this.dateEnd;
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
            .add(new ProductAttributeDescription.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attribute_id'] = this.attributeId;
    if (this.productAttributeDescription != null) {
      data['product_attribute_description'] =
          this.productAttributeDescription!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductAttributeDescription {
  dynamic text;
  dynamic languageId;

  ProductAttributeDescription({this.text, this.languageId});

  ProductAttributeDescription.fromJson(Map<String, dynamic> json) {
    text = json['text'];
    languageId = json['language_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['text'] = this.text;
    data['language_id'] = this.languageId;
    return data;
  }
}

class ProductOption {
 dynamic type;
 dynamic optionId;
 dynamic required;
  List<ProductOptionValue>? productOptionValue;

  ProductOption(
      {this.type, this.optionId, this.required, this.productOptionValue});

  ProductOption.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    optionId = json['option_id'];
    required = json['required'];
    if (json['product_option_value'] != null) {
      productOptionValue = <ProductOptionValue>[];
      json['product_option_value'].forEach((v) {
        productOptionValue!.add(ProductOptionValue.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = type;
    data['option_id'] = optionId;
    data['required'] = required;
    if (productOptionValue != null) {
      data['product_option_value'] =
          productOptionValue!.map((v) => v.toJson()).toList();
    }
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
    final Map<String, dynamic> data =  Map<String, dynamic>();
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


class Product {
  var data = <Products>[];

  Product.fromJson(Map<String, dynamic> json) {

    (json['data'] as List).forEach((e) => data.add(Products.fromJson(e)));
    print(data.length);
  }



}