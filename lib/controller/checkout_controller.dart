import 'package:get/get.dart';
import 'package:store313/controller/home/home_controller.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/data/datasource/remote/address_data.dart';
import 'package:store313/data/model/addressviewmodel.dart';

class CheckoutController extends GetxController{
  AddressData addressData = AddressData(Get.find());
  StatusRequest statusRequest=StatusRequest.none;
   String? paymentMethod;
      String? addressid;
         String? deloveryType;
List<Addressviewmodel> dataaddress=[];

         choosePaymentMethod(String val){
paymentMethod=val;
update();


         }
            chosseDeliveryType(String val){
deloveryType=val;
update();
         }
            chossShippingAddress(String val){
addressid=val;
update();
         }


           addressView() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await addressData.addressview(
        myservices.sharedPreferences.getString("id"),);
      
   
    statusRequest = handleingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
       List responsedata=response['data'];
       dataaddress.addAll(responsedata.map((e)=>Addressviewmodel.fromJson(e),));
      } else {
      }
    }
    update();
  }
  @override
  void onInit() {
     addressView();
    super.onInit();
  }
}