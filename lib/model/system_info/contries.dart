class Countries {
  int? countryId;
  String? name;
  String? isoCode_2;
  String? isoCode_3;
  String? addressFormat;
  int? postcodeRequired;
  int? status;

  Countries({this.countryId,this.name,this.isoCode_2,this.status,this.addressFormat,this.isoCode_3,this.postcodeRequired});

  Countries.fromJson(Map<String, dynamic> json) {
    countryId = json['country_id'];
    name = json['name'];
    isoCode_2 = json['iso_code_2'];
    isoCode_3 = json['iso_code_3'];
    postcodeRequired = json['postcode_required'];
    addressFormat = json['address_format'];
    status = json['status'];
  }
}
class CountriesData {
  List<Countries?>? data;
  CountriesData({this.data});

  CountriesData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = <Countries>[];
      json['data'].forEach((v) {
        data!.add(Countries.fromJson(v));
      });
    }
  }

}

