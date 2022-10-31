class subOptionValue {
  String? name;
  String? languageId;

  subOptionValue({this.name, this.languageId});

  subOptionValue.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    languageId = json['language_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['language_id'] = this.languageId;
    return data;
  }
}
