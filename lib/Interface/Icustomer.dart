import '../model/cutomers/add_customer.dart';
abstract class ICustomers{

    fetchCustomer(String limit,String page);
    Future<String?> deleteCustomer(String id);
     addNewCustomer(PostCustomer postCustomer);

}
