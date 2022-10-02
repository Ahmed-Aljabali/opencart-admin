class AddProductDataModel {
  var prodcut, qty , model, unitPrice, total;
  var index;

  AddProductDataModel(
      {this.index,
        this.prodcut,
        this.qty,
        this.model,
        this.unitPrice,
        this.total,
        });

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['prodcut'] = prodcut;
    data['qty'] = qty;
    data['model'] = model;
    data['unitPrice'] = unitPrice;
    data['unitPrice'] = unitPrice;
    data['total'] = total;
    return data;
  }
}
