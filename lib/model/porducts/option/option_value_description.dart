import 'package:opencart/model/porducts/option/sub_option_value.dart';

class OptionValueDescription {
  subOptionValue? subOptionValueNumber;

  OptionValueDescription({this.subOptionValueNumber});

  OptionValueDescription.fromJson(Map<String, dynamic> json) {
    subOptionValueNumber = json['1'] != null ? new subOptionValue.fromJson(json['1']) : null;
  }

}