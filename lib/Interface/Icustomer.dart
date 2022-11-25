import '../model/cutomers/add_customer.dart';
import 'package:http/http.dart' as http;

import '../model/cutomers/customer.dart';

abstract class ICustomers{

  Future<List<Customers>> fetchCustomer(String page);
    Future<http.Response> deleteCustomer(int id);
     addNewCustomer(PostCustomer postCustomer);

}
