class DiscountDataModel {
  var clintGroup, qty, priority, price, endDate, startDate;
  var index;

  DiscountDataModel(
      {this.index,
        this.clintGroup,
        this.qty,
        this.priority,
        this.price,
        this.endDate,
        this.startDate});

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['clintGroup'] = clintGroup;
    data['qty'] = qty;
    data['tax'] = priority;
    data['price'] = price;
    data['endDate'] = endDate;
    data['startDate'] = startDate;
    return data;
  }
}
