class OrderStatuses {
  String? orderStatusId;
  String? languageId;
  String? name;

  OrderStatuses({this.orderStatusId,this.name,this.languageId});

  OrderStatuses.fromJson(Map<String, dynamic> json) {
    orderStatusId = json['order_status_id'];
    name = json['name'];
    languageId = json['language_id'];
  }
}
class OrderStatusesData {
  List<OrderStatuses?>? data;
  List<List<OrderStatuses>>? list;
  List<List>? list2;

  OrderStatusesData({this.data});

  OrderStatusesData.fromJson(Map<String, dynamic> json) {
    print(json);

    if (json['data'] != null) {

      data = <OrderStatuses>[];
      json['data'].forEach((v) {
        for (var element in list!) {
      element.forEach((i) {
      data!.add(OrderStatuses.fromJson(v));
         });

        }
      });
    }
  }

}

