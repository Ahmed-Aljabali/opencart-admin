
import 'option_value_description.dart';

class OptionValues{
  dynamic optionValueId;
  dynamic sortOrder;
  OptionValueDescription? optionValueDescription;

  OptionValues({this.optionValueId, this.sortOrder, this.optionValueDescription});
  OptionValues.fromJson(Map<String, dynamic> json) {
    optionValueId = json['option_value_id'];
    sortOrder = json['sort_order'];
    optionValueDescription = json['option_value_description'] != null ? new OptionValueDescription.fromJson(json['option_value_description']) : null;
  }
}