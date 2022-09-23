class CheckBoxDataModel {
  var optionValue, qty , tax, price, point, weight;
  var index;

  CheckBoxDataModel(
      {this.index,
      this.optionValue,
      this.qty,
      this.tax,
      this.price,
      this.point,
      this.weight});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['optionValue'] = optionValue;
    data['qty'] = qty;
    data['tax'] = tax;
    data['price'] = price;
    data['point'] = point;
    data['width'] = weight;
    return data;
  }
}
