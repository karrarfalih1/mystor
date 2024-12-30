import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/data/datasource/remote/favorite/favorite_data.dart';

//فكرة هذه الصفحة هي اعتبار الايدي هو الكي  والفاليو تكون اما  صفر او  واحد وهكذا سوف نتعامل  ونضيف ونحذف من المفضلة   وسوف يتعامل التطبيق مع هذه الماب
abstract class FavoriteController extends GetxController{

setFavorite(id,val);
}

class FavoriteControllerImp extends FavoriteController{
Map isFavorite={};
MyServices myServices=Get.find();
 Favorite favorite= Favorite(Get.find());
StatusRequest statusRequest=StatusRequest.none;
setFavorite(id,val){
  isFavorite[id]=val;
  update();
}
  deletFav(itemsid)async {

   var response=await favorite.deletFavorite(myServices.sharedPreferences.getString('id'),itemsid);
   statusRequest=handleingData(response);
   if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
         Get.rawSnackbar(
        barBlur: 0.01,
         snackPosition: SnackPosition.TOP,
        backgroundColor:  AppColor.maincolor,
        borderColor: AppColor.maincolor,
            animationDuration: Duration(milliseconds: 600),
        title: "اشعار", messageText:Text("تم حذف المنتج من المفضلة",style: TextStyle(fontSize: 20,color: Colors.white),));
    }else{
      statusRequest=StatusRequest.failure;
    }
   }
   update();
  }
   addFav(itemsid)async {

   var response=await favorite.addFavorite(
    
   myServices.sharedPreferences.getString('id') ,itemsid);
   statusRequest=handleingData(response);
   if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
      Get.rawSnackbar(
            animationDuration: Duration(milliseconds: 600),
        snackPosition: SnackPosition.TOP,
        barBlur: 0.01,
        backgroundColor:  AppColor.maincolor,
        borderColor: AppColor.maincolor,
        title: "اشعار", messageText:Text("تم اضافة المنتج الى المفضلة",style: TextStyle(fontSize: 20,color: Colors.white),));
    }else{
      statusRequest=StatusRequest.failure;
    }
   }
   update();
  }
}