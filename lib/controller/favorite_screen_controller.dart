
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home_controller.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/data/datasource/remote/favorite/favorite_screen_data.dart';
import 'package:store313/data/model/favoritemodel.dart';

abstract class FavoriteScreenController extends GetxController{

initialData();
getFav(String useridf);
 deletFavs(String favorite_id);
}
 

class FavoriteScreenControllerImp extends FavoriteScreenController{

  MyServices myServices=Get.find();

  FavoriteScreenData favoriteScreenData =FavoriteScreenData(Get.find());
    StatusRequest statusRequest=StatusRequest.none;
  
  List<FavoriteModel> data=[];
String? userid;

initialData(){
  userid=  myservices.sharedPreferences.getString("id");
getFav(userid.toString());
}
  @override
  void onInit() {
    initialData();
    super.onInit();
  }
  @override
void onClose() {
  super.onClose();
  print("Controller destroyed!");
}

  @override
  getFav(useridf)async{
    data.clear;
    
    statusRequest=StatusRequest.loading;
    
    var response= await favoriteScreenData.getFavorite(useridf);
      statusRequest=handleingData(response);
    if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
      List  responseData=response['data'];
     
   data.addAll(responseData.map((e) => FavoriteModel.fromJson(e),));
  // print(data); 
   
    }else{
      
      statusRequest=StatusRequest.failure;
    //  print(data);
    }
   }
      update();
  }
  
    @override
  deletFavs(favorite_id){
   
   
    var response=  favoriteScreenData.deletFavorite(favorite_id);
data.removeWhere((element)=>element.favoriteId.toString()==favorite_id.toString());
                                     
print("fav--------------fav");
print(data);
      update();
  }

}