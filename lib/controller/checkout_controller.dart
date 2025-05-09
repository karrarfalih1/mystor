
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_state_manager/src/simple/get_controllers.dart';
import 'package:store313/controller/home/home_controller.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/data/datasource/remote/address_data.dart';
import 'package:store313/data/datasource/remote/checkoutdata.dart';
import 'package:store313/data/model/addressviewmodel.dart';

class CheckoutController extends GetxController {
  AddressData addressData = AddressData(Get.find());
  Checkoutdata checkoutdata =Checkoutdata(Get.find());
  StatusRequest statusRequest = StatusRequest.none;
  String? paymentMethod;
  String? addressid;
  String? deloveryType;
  String? coupondiscount;
  late String couponid;
  late String totalprice;
  List<Addressviewmodel> dataaddress = [];

  choosePaymentMethod(String val) {
    paymentMethod = val;
    update();
  }

  chosseDeliveryType(String val) {
    deloveryType = val;
    update();
  }

  chossShippingAddress(String val) {
    addressid = val;
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
        List responsedata = response['data'];
        dataaddress.addAll(responsedata.map(
          (e) => Addressviewmodel.fromJson(e),
        ));
      } else {}
    }
    update();
  }

goToAddAddress(){
  Get.offNamed(Approute.addressadd);
}
  checkout()async {
    print("ok -2");
   // if(paymentMethod ==null) return Get.snackbar("تنبيه", "عليك اختيار طريقة الدفع ");
    if(deloveryType==null) return Get.snackbar("تنبيه", "عليك اختيار طريقة الاستلام ");
    if(deloveryType=="0" && addressid==null) return Get.snackbar("تنبيه", "عليك اختيار موقعك الجغرافي ");
    if(myservices.sharedPreferences.getString("retid")==null)return Get.snackbar("تنبيه", " حدث خطا ما ");
    statusRequest = StatusRequest.loading;
    update();
    print("ok-1");
Map data={
"orders_cat_id":myservices.sharedPreferences.getString("retid").toString(),
"usersid":myservices.sharedPreferences.getString("id").toString(),
"orders_address":addressid.toString(),
"orderstype":deloveryType.toString(),
"pricedelivery":"200",
"paymentmethod":"0",// paymentMethod.toString(),
"orderspricee":totalprice,
"couponid":couponid,
"coupondiscount":coupondiscount.toString(),

};
print("ok 0");
   var response=await checkoutdata.checkout(data);
   statusRequest=handleingData(response);
   if(StatusRequest.success==statusRequest){
    print("ok 1");
    if(response['status']=='success'){
      print("ok2");
      await myservices.sharedPreferences.setString("retC","0");
      Get.offAllNamed(Approute.homepage);
         Get.rawSnackbar(
        barBlur: 0.01,
         snackPosition: SnackPosition.TOP,
        backgroundColor:  AppColor.maincolor,
        borderColor: AppColor.maincolor,
            animationDuration:const Duration(milliseconds: 600),
        title: "اشعار", messageText:const Text("تم الطلب بنجاح",style: TextStyle(fontSize: 20,color: Colors.white),));
    }else{
               Get.rawSnackbar(
        barBlur: 0.01,
         snackPosition: SnackPosition.TOP,
        backgroundColor:  AppColor.maincolor,
        borderColor: AppColor.maincolor,
            animationDuration:const Duration(milliseconds: 600),
        title: "تنبيه", messageText:const Text("حاول مرة اخرى",style: TextStyle(fontSize: 20,color: Colors.white),));
      statusRequest=StatusRequest.none;
    }
   }
   update();
  }
  @override
  void onInit() {
    couponid = Get.arguments['couponid'];
    totalprice = Get.arguments['totalprice'];
    coupondiscount= Get.arguments['discountcoupon'];
    addressView();
    super.onInit();
  }
}
