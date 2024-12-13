
import 'package:get/get.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/data/datasource/remote/test_data.dart';

class TestController extends GetxController{
 
  TestData  testData=TestData(Get.find());
//حتى نخزن البيانات من الباك ايند داخل هذا المتغير
  List data =[];

  late StatusRequest statusRequest;
// عملنا دالة لجلب المعلومات
  getData() async{
    //نعطي قيمة ابتدائية وهي اللودنغ
    statusRequest=StatusRequest.loading;
//لجلب المعلومات
//الكيت داتا ترجعلنا اما خطا معين اما المصفوفة الي بيها البيانات
    var response=await testData.getData();

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
    getData();
    super.onInit();
  }
}