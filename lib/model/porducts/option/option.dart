
import '../product.dart';
import 'option_values.dart';

class ProductOptionData {
  var data = <ProductOption>[];

  ProductOptionData.fromJson(Map<String, dynamic> json) {

    for (var e in (json['data'] as List)) {
      data.add(ProductOption.fromJson(e));

    }
  }

}

class ProductOption {
  dynamic type;
  dynamic optionId;
  dynamic required;
  List<OptionValues>? productOptionValue;
  ProductOption(
      {this.type, this.optionId, this.required, this.productOptionValue});

  ProductOption.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    optionId = json['option_id'];
    required = json['required'];
    if (json['option_values'] != null) {
      productOptionValue = <OptionValues>[];
      json['option_values'].forEach((v) {
        productOptionValue!.add(OptionValues.fromJson(v));
      });
    }
  }


}
class AddProductOption {
  dynamic type;
  dynamic optionId;
  dynamic required;
  List<ProductOptionValue>? productOptionValue;
  AddProductOption(
      {this.type, this.optionId, this.required, this.productOptionValue});

  AddProductOption.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    optionId = json['option_id'];
    required = json['required'];
    if (json['option_values'] != null) {
      productOptionValue = <ProductOptionValue>[];
      json['option_values'].forEach((v) {
        productOptionValue!.add(ProductOptionValue.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['type'] = this.type;
    data['option_id'] = this.optionId;
    data['required'] = this.required;
    if (this.productOptionValue != null) {
      data['product_option_value'] =
          this.productOptionValue!.map((v) => v.toJson()).toList();
    }
    return data;
  }


}