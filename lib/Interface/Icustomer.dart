import 'package:get/get.dart';
import 'package:get_it/get_it.dart';

import '../Hepler/Base.dart';
abstract class ICustomer{

  var isDataLoading=false.obs;
  Http client =GetIt.instance.get<Http>();

  fetchCustomer(String limit,String page);
  Future<String?> deleteCustomer(String id);
}
