class AddOrders {
  int? storeId;
  String? comment;
  String? affiliateId;
  String? tracking;
  String? voucher;
  String? coupon;
  List<Products>? products;
  ShippingMethod? shippingMethod;
  ShippingMethod? paymentMethod;
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
      products = <Products>[];
      json['products'].forEach((v) {
        products!.add(new Products.fromJson(v));
      });
    }
    shippingMethod = json['shipping_method'] != null
        ? new ShippingMethod.fromJson(json['shipping_method'])
        : null;
    paymentMethod = json['payment_method'] != null
        ? new ShippingMethod.fromJson(json['payment_method'])
        : null;
    paymentAddress = json['payment_address'] != null
        ? new PaymentAddress.fromJson(json['payment_address'])
        : null;
    shippingAddress = json['shipping_address'] != null
        ? new PaymentAddress.fromJson(json['shipping_address'])
        : null;
    customer = json['customer'] != null
        ? new Customer.fromJson(json['customer'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['store_id'] = this.storeId;
    data['comment'] = this.comment;
    data['affiliate_id'] = this.affiliateId;
    data['tracking'] = this.tracking;
    data['voucher'] = this.voucher;
    data['coupon'] = this.coupon;
    if (this.products != null) {
      data['products'] = this.products!.map((v) => v.toJson()).toList();
    }
    if (this.shippingMethod != null) {
      data['shipping_method'] = this.shippingMethod!.toJson();
    }
    if (this.paymentMethod != null) {
      data['payment_method'] = this.paymentMethod!.toJson();
    }
    if (this.paymentAddress != null) {
      data['payment_address'] = this.paymentAddress!.toJson();
    }
    if (this.shippingAddress != null) {
      data['shipping_address'] = this.shippingAddress!.toJson();
    }
    if (this.customer != null) {
      data['customer'] = this.customer!.toJson();
    }
    return data;
  }
}

class Products {
  int? productId;
  int? quantity;
  Option? option;

  Products({this.productId, this.quantity, this.option});

  Products.fromJson(Map<String, dynamic> json) {
    productId = json['product_id'];
    quantity = json['quantity'];
    option =
    json['option'] != null ? new Option.fromJson(json['option']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    if (this.option != null) {
      data['option'] = this.option!.toJson();
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['227'] = this.i227;
    return data;
  }
}

class ShippingMethod {
  String? title;
  String? code;

  ShippingMethod({this.title, this.code});

  ShippingMethod.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['code'] = this.code;
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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['city'] = this.city;
    data['address_1'] = this.address1;
    data['country_id'] = this.countryId;
    data['postcode'] = this.postcode;
    data['zone_id'] = this.zoneId;
    data['zone'] = this.zone;
    data['address_2'] = this.address2;
    data['country'] = this.country;
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
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['firstname'] = firstname;
    data['lastname'] = lastname;
    data['email'] = email;
    data['telephone'] = telephone;
    data['fax'] = this.fax;
    data['customer_id'] = this.customerId;
    data['customer_group_id'] = this.customerGroupId;
    return data;
  }
}