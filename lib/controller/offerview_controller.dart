
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/home_controller.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/data/datasource/remote/offers/offersviewdata.dart';
import 'package:store313/data/model/itemsmodel.dart';

abstract class OfferviewController extends MixSearchController{
    intialData();
}


class OfferviewControllerImp extends OfferviewController{
  
  List<ItemsModel> offerdata=[];

@override
  StatusRequest statusRequest=StatusRequest.none;

Offersviewdata  offersviewdata =Offersviewdata(Get.find());
String? userid;
  intialData() {
     search=TextEditingController();
  userid=myservices.sharedPreferences.getString("id")!;

   getdata(userid);
  }

  @override
  void onInit() {
   intialData();
    super.onInit();
  }

  getdata(userid)async{
statusRequest =StatusRequest.loading;
update();
var response=await offersviewdata.getdata(userid);
statusRequest=handleingData(response);
if(statusRequest==StatusRequest.success){
  if(response['status']=='success'){
   List offerlist=response['data'];
   offerdata.addAll(offerlist.map((e)=>ItemsModel.fromJson(e)));

  }else{
    statusRequest=StatusRequest.failure;
  }
}
update();
  }
    goToItemsDeletes(itemsModel) {
    Get.toNamed(Approute.itemsDetels,arguments:{"itemsModel":itemsModel});
  }
    @override
  @override
void onClose() {
  super.onClose();
  print("Controller destroyed!");
}
}