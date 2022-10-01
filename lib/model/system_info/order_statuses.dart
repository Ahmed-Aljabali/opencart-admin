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
  OrderStatusesData({this.data});

  OrderStatusesData.fromJson(Map<String, dynamic> json) {

    json['data'].forEach((c){
      data = <OrderStatuses>[];
      c.forEach((a){
        data!.add(OrderStatuses.fromJson(a));
      });

    });
  }

}

