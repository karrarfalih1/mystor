import 'package:get/get.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/data/datasource/remote/orders/pending_data.dart';
import 'package:store313/data/model/pendingmodel.dart';

class PendingController extends GetxController {
  List<PendtingModel> data = [];
  StatusRequest statusRequest = StatusRequest.none;
  MyServices myServices = Get.find();

  PendingData pendingData = PendingData(Get.find());

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

  getpending() async {
    data.clear();
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await pendingData.getData(myServices.sharedPreferences.getString('id'));
    statusRequest = handleingData(response);
    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {
        if (response['status'] == 'success') {
          List dataresponse = response['data'];
          data.addAll(dataresponse.map((e) => PendtingModel.fromJson(e)));
          

        Get.snackbar("true", "true");
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
refreshpage(){
  getpending();
}
  @override
  void onInit() {
    getpending();
    super.onInit();
  }
}
