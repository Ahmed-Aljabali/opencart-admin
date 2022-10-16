import 'package:opencart/controllers/BaseController.dart';
import '../Interface/Iproduct_options.dart';

class ProductOptionController extends BaseController implements IPorductOption {
  @override
  void onInit(){
    super.onInit();
  }
  @override
  fetchOption(String limit,String page )async{
    var res = await get("product_options/limit/$limit/page/$page");
    if (res.statusCode == 200) {
      msg="successfully saved";
    }
  }
}