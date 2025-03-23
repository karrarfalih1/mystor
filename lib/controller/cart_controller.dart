

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/data/datasource/remote/cart_data.dart';
import 'package:store313/data/model/cartmodel.dart';

class CartController extends GetxController{
  
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
refreshpage(){
  resVarcart();
  viewcart();

}
 
    add(itemsid)async {
statusRequest=StatusRequest.loading;
update();
   var response=await cartdata.addcart(
    
   myServices.sharedPreferences.getString('id') ,"$itemsid");
   statusRequest=handleingData(response);
   if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
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
      Get.rawSnackbar(
            animationDuration: const Duration(milliseconds: 600),
        snackPosition: SnackPosition.TOP,
        barBlur: 0.01,
        backgroundColor:  AppColor.maincolor,
        borderColor: AppColor.maincolor,
        title: "اشعار", messageText:Text("تم حذف المنتج من السلة",style: const TextStyle(fontSize: 20,color: Colors.white),));
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
    print("-----------------------------------");
    print("$countcart");
    return countcart;
    }else{
      statusRequest=StatusRequest.failure;
    }
   }
   update();
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
@override
  void onInit() {
      viewcart();
  
    super.onInit();
  }
}