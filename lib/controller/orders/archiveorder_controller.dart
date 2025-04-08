import 'package:get/get.dart';
import 'package:store313/controller/home/home_controller.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/data/datasource/remote/orders/orderarchive_data.dart';
import 'package:store313/data/model/pendingmodel.dart';

class ArchiveorderController extends GetxController{
StatusRequest statusRequest=StatusRequest.none;
OrderarchiveData  orderarchiveData =OrderarchiveData(Get.find());

List<PendtingModel> data=[];
String printPaymentMethod(String val){
  if(val=="0"){
    return "Cash On Delivery";
  }else{
  return "Payment Card";
  }
  

}
String printtypeorder(String val){
  if(val=="0"){
    return "Delivery";
  }else{
  return "Recive";
  }
  

}
String printOrderStatus(String val){
  if(val=="0"){
    return "Awit Approval";
  }else if(val=="1"){
  return "The Order Is Being Propared";
  }
  else if(val=="2"){
  return "On The Way";
  }else{
     return "Archive";
  }

}
@override
  void onInit() {
  getdata();
    super.onInit();
  }

getdata()async{
  statusRequest=StatusRequest.loading;
  update();
  var response=await orderarchiveData.getData(myservices.sharedPreferences.getString("id"));
   statusRequest=handleingData(response);
   if(StatusRequest.success==statusRequest){
     if(response['status']=="success"){
      List listdata=response['data'];
     data.addAll(listdata.map((e)=>PendtingModel.fromJson(e)));
     }
     
   }else{
      statusRequest=StatusRequest.failure;
   }
   update();
}

}