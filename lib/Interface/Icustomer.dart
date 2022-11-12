import '../model/cutomers/add_customer.dart';
import 'package:http/http.dart' as http;

abstract class ICustomers{

    fetchCustomer(String limit,String page);
    Future<http.Response> deleteCustomer(int id);
     addNewCustomer(PostCustomer postCustomer);

}
