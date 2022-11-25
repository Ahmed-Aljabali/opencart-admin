import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:opencart/Controllers/customer_controller.dart';
import 'package:opencart/controllers/wizard_controller.dart';
import 'package:opencart/core/utils/math_utils.dart';
import 'package:opencart/pages/customer/addcustomer/widgets/adresses/adress.dart';



import '../../edit_wizard/widgets/custom_stepper.dart';
import '../../widgets/dialogs.dart';
import 'widgets/generl/general.dart';
import 'package:opencart/model/cutomers/add_customer.dart';

class AddCustomerPage extends GetView<CustomerController> {
  const AddCustomerPage({Key? key}) : super(key: key);


  @override
  StatelessElement createElement() {
    controller.fetchCustomer("1");
    return super.createElement();
  }


  @override
  Widget build(BuildContext context) {
    final MainWizardController wizardController = Get.find();
    return  SafeArea(
      child: Obx(
            () => Scaffold(
          appBar: AppBar(
            backgroundColor: Colors.white,
            automaticallyImplyLeading: false,
            title:const Text(
              'إضافة عميل',
              style: TextStyle(color: Colors.black, fontSize: 17),
            ),
            centerTitle: true,
          ),
          body:Column(
            children: [
              Expanded(
                flex: 1,
                child: Container(
                  decoration: const BoxDecoration(
                    color: Colors.green,
                    borderRadius: BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  margin: getMargin(top: 10,right: 8,left: 8,bottom: 8),
                  padding: getPadding(left: 10,right: 10),
                  child: Text(get_title2(wizardController.currentStep.value),style: TextStyle(fontSize: 20,fontFamily: 'Cairo Regular',color: Colors.white,fontWeight: FontWeight.bold),),
                ),),

              Expanded(
                flex: 8,
                child: Timeline(
                  children: <Widget>[
                    wizardController.SingleStep(0,
                        StepData(
                            Column(
                              children: [
                                GeneralFirstCustomerExpantionPanel()
                              ],
                            )
                        )),
                    // wizardController.SingleStep(1,
                    //     StepData(
                    //         AddressForm()
                    //     )
                    // ),
                  ],
                  indicators: <Widget>[
                    wizardController.stepheader( wizardController.currentStep.value,0,Icons.account_circle_rounded),
                    wizardController.stepheader( wizardController.currentStep.value,1,Icons.info_outline_rounded),

                  ],
                ),
              ),



                 Expanded(

                    flex: 1,
                    child:  InkWell(
                      onTap: () {
                        wizardController.currentStep.value != 1 ?
                        wizardController.tapped(
                            wizardController.currentStep.value + 1) : null;
                      },
                      child:   wizardController.currentStep.value <1 ? Container(


                        decoration: const BoxDecoration(

                          color: Colors.green,
                          borderRadius: BorderRadius.all(
                            Radius.circular(20),
                          ),

                        ),

                        margin: getMargin(top: 10,right: 8,left: 8,bottom: 8),
                        padding:getPadding(all: 10),
                        child: Text('NextStep',style: TextStyle(fontSize: 20,fontFamily: 'Cairo Regular',color: Colors.white,fontWeight: FontWeight.bold),),
                      ):Container(),
                    ),
                ),

            ],
          ),

              floatingActionButton: FloatingActionButton(
                backgroundColor: Colors.green,
                onPressed: ()async {
                  print(controller.email.text);
                   controller.postCustomer.firstname=controller.firstName.text;
                  controller.postCustomer.lastname=controller.lastName.text;
                  controller.postCustomer.email=controller.email.text;
                  print(controller.postCustomer.email);
                  controller.postCustomer.telephone=controller.phone.text;
                  controller.postCustomer.password=controller.password.text;
                  controller.postCustomer.confirm=controller.password.text;
                  controller.postCustomer.customerGroupId=controller.postCustomer.customerGroupId;
                 controller.addNewCustomer(controller.postCustomer).then((value) =>
                {

                if (controller.error.isNotEmpty)
                {
                    errorDialog(controller.error.first)
                }else
                  {
                  successDialog(controller.msg)
                  }
                });
                },
                tooltip: 'add a new Customer',
                highlightElevation: 1,

                child:   Container(

                    decoration: const BoxDecoration(

                      color: Colors.transparent,
                      borderRadius: BorderRadius.all(
                        Radius.circular(100),
                      ),

                    ),
                    child: const Text('حفظ')
                ),


              ),

        ),
      ),
    );
  /*    Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Obx(
                  () => !controller.isDataLoading.value? const Center(
          child: CircularProgressIndicator(),
                 ): Text("controller.trx.data.toString()"),
            ),
          ],
        ),
      ),
    );*/

  }
}
