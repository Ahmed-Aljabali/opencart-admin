class AddOrders {
  int? storeId;
  String? comment;
  String? affiliateId;
  String? tracking;
  String? voucher;
  String? coupon;
  List<ProductsOrder>? products;
  OrderShippingMethod? shippingMethod;
  OrderShippingMethod? paymentMethod;
  PaymentAddress? paymentAddress;
  PaymentAddress? shippingAddress;
  Customer? customer;

  AddOrders(
      {this.storeId,
        this.comment,
        this.affiliateId,
        this.tracking,
        this.voucher,
        this.coupon,
        this.products,
        this.shippingMethod,
        this.paymentMethod,
        this.paymentAddress,
        this.shippingAddress,
        this.customer});

  AddOrders.fromJson(Map<String, dynamic> json) {
    storeId = json['store_id'];
    comment = json['comment'];
    affiliateId = json['affiliate_id'];
    tracking = json['tracking'];
    voucher = json['voucher'];
    coupon = json['coupon'];
    if (json['products'] != null) {
      products = <ProductsOrder>[];
      json['product'].forEach((v) {
        products!.add( ProductsOrder.fromJson(v));
      });
    }
    shippingMethod = json['shipping_method'] != null
        ?  OrderShippingMethod.fromJson(json['shipping_method'])
        : null;
    paymentMethod = json['payment_method'] != null
        ?  OrderShippingMethod.fromJson(json['payment_method'])
        : null;
    paymentAddress = json['payment_address'] != null
        ?  PaymentAddress.fromJson(json['payment_address'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ?  PaymentAddress.fromJson(json['shipping_address'])
        : null;
    customer = json['customer'] != null
        ?  Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['store_id'] = storeId;
    data['comment'] = comment;
    data['affiliate_id'] = affiliateId;
    data['tracking'] = tracking;
    data['voucher'] = voucher;
    data['coupon'] = coupon;
    if (products != null) {
      data['products'] = products!.map((v) => v.toJson()).toList();
    }
    if (shippingMethod != null) {
      data['shipping_method'] = shippingMethod!.toJson();
    }
    if (paymentMethod != null) {
      data['payment_method'] = paymentMethod!.toJson();
    }
    if (paymentAddress != null) {
      data['payment_address'] = paymentAddress!.toJson();
    }
    if (shippingAddress != null) {
      data['shipping_address'] = shippingAddress!.toJson();
    }
    if (customer != null) {
      data['customer'] = customer!.toJson();
    }
    return data;
  }
}

class ProductsOrder {
  int? productId;
  int? quantity;
  Option? option;

  ProductsOrder({this.productId, this.quantity, this.option});

  ProductsOrder.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
    option =
    json['option'] != null ?  Option.fromJson(json['option']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['product_id'] = productId;
    data['quantity'] = quantity;
    if (option != null) {
      data['option'] = option!.toJson();
    }
    return data;
  }
}

class Option {
  int? i227;

  Option({this.i227});

  Option.fromJson(Map<String, dynamic> json) {
    i227 = json['227'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['227'] = i227;
    return data;
  }
}

class OrderShippingMethod {
  String? title;
  String? code;

  OrderShippingMethod({this.title, this.code});

  OrderShippingMethod.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['title'] = title;
    data['code'] = code;
    return data;
  }
}

class PaymentAddress {
  String? firstname;
  String? lastname;
  String? city;
  String? address1;
  int? countryId;
  String? postcode;
  int? zoneId;
  String? zone;
  String? address2;
  String? country;

  PaymentAddress(
      {this.firstname,
        this.lastname,
        this.city,
        this.address1,
        this.countryId,
        this.postcode,
        this.zoneId,
        this.zone,
        this.address2,
        this.country});

  PaymentAddress.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    city = json['city'];
    address1 = json['address_1'];
    countryId = json['country_id'];
    postcode = json['postcode'];
    zoneId = json['zone_id'];
    zone = json['zone'];
    address2 = json['address_2'];
    country = json['country'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['city'] = city;
    data['address_1'] =address1;
    data['country_id'] = countryId;
    data['postcode'] = postcode;
    data['zone_id'] = zoneId;
    data['zone'] = zone;
    data['address_2'] = address2;
    data['country'] = country;
    return data;
  }
}

class Customer {
  String? firstname;
  String? lastname;
  String? email;
  String? telephone;
  String? fax;
  int? customerId;
  int? customerGroupId;

  Customer(
      {this.firstname,
        this.lastname,
        this.email,
        this.telephone,
        this.fax,
        this.customerId,
        this.customerGroupId});

  Customer.fromJson(Map<String, dynamic> json) {
    firstname = json['firstname'];
    lastname = json['lastname'];
    email = json['email'];
    telephone = json['telephone'];
    fax = json['fax'];
    customerId = json['customer_id'];
    customerGroupId = json['customer_group_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  <String, dynamic>{};
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['telephone'] = telephone;
    data['fax'] = fax;
    data['customer_id'] = customerId;
    data['customer_group_id'] = customerGroupId;
    return data;
  }
}