

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/home_controller.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/data/datasource/remote/cart_data.dart';
import 'package:store313/data/model/cartmodel.dart';
import 'package:store313/data/model/couponmodel.dart';

class CartController extends GetxController{
 
  couponModel? couponmodel;
  int discountcoupon=0;
   String? couponname;
   String couponid="0";
  TextEditingController? coupon;
  CartData cartdata=CartData(Get.find());
  MyServices myServices =Get.find();
  List<CartModil> data=[];
  double totalpriceitems=0.0;

int totalitems=0;
StatusRequest statusRequest=StatusRequest.none;


resVarcart(){
  totalitems=0;
  totalpriceitems=0.0;
  
}
refreshpage()async{
  resVarcart();
 await viewcart();
myServices.sharedPreferences.setString("retC",totalitems.toString());
if(data.isNotEmpty){
myservices.sharedPreferences.setString("retid", data[0].itemsCat.toString());
}
}
 
    add(itemsid)async {
statusRequest=StatusRequest.loading;
update();
   var response=await cartdata.addcart(
    
   myServices.sharedPreferences.getString('id') ,"$itemsid");
   statusRequest=handleingData(response);
   if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
      int retcount =int.parse(myServices.sharedPreferences.getString("retC").toString())+1;
      myServices.sharedPreferences.setString("retC",retcount.toString());
      Get.rawSnackbar(
            animationDuration: const Duration(milliseconds: 600),
        snackPosition: SnackPosition.TOP,
        barBlur: 0.01,
        backgroundColor:  AppColor.maincolor,
        borderColor: AppColor.maincolor,
        title: "اشعار", messageText:Text("تم اضافة المنتج الى السلة",style: const TextStyle(fontSize: 20,color: Colors.white),));
    }else{
      statusRequest=StatusRequest.failure;
    }
   }
   update();
  }

 
    delet(itemsid)async {

   var response=await cartdata.deletcart(
    
   myServices.sharedPreferences.getString('id') ,"$itemsid");
   statusRequest=handleingData(response);
   if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){

      int retcount =int.parse(myServices.sharedPreferences.getString("retC").toString())-1;
      myServices.sharedPreferences.setString("retC",retcount.toString());


      Get.rawSnackbar(
            animationDuration: const Duration(milliseconds: 600),
        snackPosition: SnackPosition.TOP,
        barBlur: 0.01,
        backgroundColor:  AppColor.maincolor,
        borderColor: AppColor.maincolor,
        title: "اشعار", messageText:const Text("تم حذف المنتج من السلة",style:  TextStyle(fontSize: 20,color: Colors.white),));
    }else{
      statusRequest=StatusRequest.failure;
    }
   }
   update();
  }

  getCountItems(String itemsid)async{
     var response=await cartdata.getcountcart(
    
   myServices.sharedPreferences.getString('id') ,"$itemsid");
   statusRequest=handleingData(response);
   if(StatusRequest.success==statusRequest){
    int countcart=0;
    if(response['status']=='success'){
    countcart=int.parse(response['data'].toString());
   if(countcart==0){
     statusRequest=StatusRequest.failure;
   }
    return countcart;

    }else{
      statusRequest=StatusRequest.failure;
    }
   }
   update();
  }
    checkcoupon()async{
     var response=await cartdata.checkcoupon(
    coupon!.text
   );
   statusRequest=handleingData(response);
   if(StatusRequest.success==statusRequest){

    if(response['status']=='success'){
    Map<String,dynamic> coupondata=response['data'];
    couponmodel=couponModel.fromJson(coupondata);
  discountcoupon=int.parse(couponmodel!.couponDiscount!.toString());
  couponname=couponmodel!.couponName!;
  couponid=couponmodel!.couponId.toString();
    Get.snackbar("نجاح", " تم تفعيل الكوبون");
    }else{
      Get.snackbar("خطا", "الكوبون غير صالح");
        couponid="0";
      couponname=null;
       discountcoupon=0;
   //   statusRequest=StatusRequest.failure;
    }
   }
   update();
  }
  getTotalPrice(){
    return (totalpriceitems - totalpriceitems * discountcoupon/100);
  }
    viewcart()async {
      data.clear();
 statusRequest=StatusRequest.loading;
 update();
   var response=await cartdata.viewcart(
    
   myServices.sharedPreferences.getString('id') );
   statusRequest=handleingData(response);
   if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
      if(response['data']['status']=='success'){
    List dataresponse=response['data']['data'];
      Map dataresponsecount=response['countprice'] ;
      
         data.addAll(dataresponse.map((e)=>CartModil.fromJson(e)));
         totalitems=int.parse(dataresponsecount['totalcount'].toString());

         totalpriceitems= double.parse( dataresponsecount['totalprice'].toString());
      
      }
     
 }else{
      statusRequest=StatusRequest.failure;
    }
   }
   update();
  }
goToCheckOutScreen(){
  if(data.isEmpty){ Get.snackbar("تنبيه", "السلة فارعة");}else{
  Get.offNamed(Approute.checkout,arguments: {
    "couponid":couponid,
    "totalprice":totalpriceitems.toString(),
     "discountcoupon":discountcoupon.toString()
  });
  }

}

@override
  void onInit() {
    coupon=TextEditingController();
    ///  viewcart();
  refreshpage();
    super.onInit();
  }
}