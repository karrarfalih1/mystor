

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/data/datasource/remote/cart_data.dart';

class CartController extends GetxController{
  
CartData cartdata=CartData(Get.find());
MyServices myServices =Get.find();

StatusRequest statusRequest=StatusRequest.none;

    add(itemsid)async {

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
 
}