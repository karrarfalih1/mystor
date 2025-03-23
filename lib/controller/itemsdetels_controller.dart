import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/cart_controller.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/data/datasource/remote/cart_data.dart';
import 'package:store313/data/model/itemsmodel.dart';

abstract class ItemsdetelsController extends GetxController {}

class ItemsdetelsControllerImp extends ItemsdetelsController {

  
CartData cartdata=CartData(Get.find());
MyServices myServices =Get.find();
int countitems=0;

  late ItemsModel itemsModel;
  StatusRequest statusRequest=StatusRequest.none;
  String? lang;


  
  List subitemscolors = [
    {"name": "red", "id": 1, "active": "1"},
    {"name": "yelow", "id": 2, "active": "0"},
    {"name": "black", "id": 3, "active": "0"}
  ];



      additems(itemsid)async {
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

 
    deletitems(itemsid)async {
statusRequest=StatusRequest.loading;
update();
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
  add(){
        additems(itemsModel.itemsId);
    countitems++;
    update();
  }
  remove(){
    if(countitems>0){
  deletitems(itemsModel.itemsId);
      countitems--;
    }
    update();
  }


  gotocart(){
   
    Get.offNamed(Approute.cart);
  }
  initialData()async {

   statusRequest=StatusRequest.loading;
      lang = myServices.sharedPreferences.getString("lang");
  

    itemsModel = Get.arguments["itemsModel"];
  countitems= await getCountItems("${itemsModel.itemsId!}");
  statusRequest=StatusRequest.success;
  update();
  }

  @override
  void onInit() {
   
    initialData();
    super.onInit();
  }
}
