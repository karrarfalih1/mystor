
import 'package:get/get.dart';
import 'package:store313/controller/home/home_controller.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/data/datasource/remote/notifay_data.dart';

class NotificationController extends GetxController{

StatusRequest statusRequest =StatusRequest.none;

  NotifayData notifayData =  NotifayData(Get.find());
  List data=[];
    getdata()async{
    //نعطي قيمة ابتدائية وهي اللودنغ
    statusRequest=StatusRequest.loading;
//لجلب المعلومات
//الكيت داتا ترجعلنا اما خطا معين اما المصفوفة الي بيها البيانات
    var response=await notifayData.getntefy(
      myservices.sharedPreferences.getString("id")!
    );

    statusRequest=handleingData(response);

//القيمة الفوك متوقع ترجعلي ثلالث اشياء  الاولى نجاح  والثانية خطا بالانترنيت والثالثة خطا بالاتصال
if(StatusRequest.success==statusRequest){
  if(response['status']=='success'){
  data.addAll(response['data']);
  }else{
    statusRequest=StatusRequest.failure;
  }
 
}
update();
  }
  @override
  void onInit() {
     getdata();
    // TODO: implement onInit
    super.onInit();
  }
}