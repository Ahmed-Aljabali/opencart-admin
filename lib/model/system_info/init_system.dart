class LengthClasses {
  dynamic lengthClassId;
  dynamic value;
  dynamic languageId;
  dynamic unit;
  dynamic title;

  LengthClasses({this.title,this.value,this.languageId,this.lengthClassId,this.unit});

  LengthClasses.fromJson(Map<String, dynamic> json) {
    lengthClassId=json["length_class_id"];
    value=json["value"];
    languageId=json["language_id"];
    unit=json["unit"];
    title=json["title"];
  }
}
class WeightClasses {
  dynamic weightClassId;
  dynamic value;
  dynamic languageId;
  dynamic unit;
  dynamic title;

  WeightClasses({this.title,this.value,this.languageId,this.weightClassId,this.unit});

  WeightClasses.fromJson(Map<String, dynamic> json) {
    weightClassId=json["weight_class_id"];
    value=json["value"];
    languageId=json["language_id"];
    unit=json["unit"];
    title=json["title"];
  }
}
class TaxClasses {
  dynamic taxClassId;
  dynamic description;
  dynamic title;
  dynamic dateAdded;
  dynamic dateModified;

  TaxClasses({this.title,this.dateModified,this.taxClassId,this.description,this.dateAdded});

  TaxClasses.fromJson(Map<String, dynamic> json) {
    taxClassId=json["tax_class_id"];
    description=json["description"];
    dateAdded=json["date_added"];
    dateModified=json["date_modified"];
    title=json["title"];
  }
}
class StockStatuses {
  dynamic stockStatusId;
  dynamic languageId;
  dynamic name;

  StockStatuses({this.stockStatusId,this.languageId,this.name});

  StockStatuses.fromJson(Map<String, dynamic> json) {
    stockStatusId=json["stock_status_id"];
    languageId=json["language_id"];
    name=json["name"];
  }
}

class LengthData {
  List<LengthClasses>? data;
  List<WeightClasses>? weightClass;
  List<TaxClasses>? taxClass;
  List<StockStatuses>? stock;
  LengthData({this.data,this.weightClass});

  LengthData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <LengthClasses>[];
      weightClass = <WeightClasses>[];
      taxClass = <TaxClasses>[];
      stock = <StockStatuses>[];

     json['data']['length_classes'].forEach((v) {
              data!.add(LengthClasses.fromJson(v));
     });
      json['data']['weight_classes'].forEach((v) {
        weightClass!.add(WeightClasses.fromJson(v));
     });
      json['data']['tax_classes'].forEach((v) {
        taxClass!.add(TaxClasses.fromJson(v));
     });
     json['data']['stock_statuses'].forEach((v) {
       stock!.add(StockStatuses.fromJson(v));
     });


    }

  }

}
// class WeightData {
//   List<WeightClasses>? data;
//   WeightData({this.data});
//
//   WeightData.fromJson(Map<String, dynamic> json) {
//     if (json['data'] != null) {
//       data = <LengthClasses>[];
//      json['data']['length_classes'].forEach((v) {
//               data!.add(LengthClasses.fromJson(v));
//      });
//
//
//     }
//
//   }
//
// }
//
