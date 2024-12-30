 //في هذه الصفحة نحن نفحص الايميل فقط 
import 'dart:async';

import 'package:get/get.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';

import '../../core/classk/statusRequest.dart';
import '../../data/datasource/remote/auth/verfiycodesignup.dart';

abstract class VerifyCodeSignUp_Controller extends  GetxController{

  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  goToSuccessSingUp(String verfiycode);
   recode();
}
class VerifyCodeSignUp_ControllerImp extends VerifyCodeSignUp_Controller{
 
  RxInt remainingTime = 0.obs; // عداد يبدأ من 10
  Timer? timer;
Verfiycodesignup verfiycodesignup =Verfiycodesignup(Get.find());
 String? verfiycode;
StatusRequest statusRequest=StatusRequest.none;
 String?email;

 void startTimer() {

    timer?.cancel(); // إلغاء المؤقت السابق إن وجد
    remainingTime.value = 60; // إعادة تعيين العداد

    timer = Timer.periodic(Duration(seconds: 1), (timer) {
      if (remainingTime.value > 0) {
        remainingTime.value--; // تقليل العداد
      } else {
       
        timer.cancel(); // إيقاف المؤقت عند انتهاء العداد
         update();
      }
    });
    update();
  }

  
  @override
  goToSuccessSingUp(verfiycode)async {
 
       
    //نعطي قيمة ابتدائية وهي اللودنغ
    statusRequest=StatusRequest.loading;
    update();

//لجلب المعلومات
//الكيت داتا ترجعلنا اما خطا معين اما المصفوفة الي بيها البيانات
    var response=await verfiycodesignup.postData(
     email!,verfiycode
    );

    statusRequest=handleingData(response);

//القيمة الفوك متوقع ترجعلي ثلالث اشياء  الاولى نجاح  والثانية خطا بالانترنيت والثالثة خطا بالاتصال
if(StatusRequest.success==statusRequest){
  if(response['status']=='success'){
 //  data.addAll(response['data']);
 Get.offNamed(Approute.successSignup);
  }else{
    Get.defaultDialog(
      title:"Warning",
      middleText: "الكود الذي ادخلته غير صحيح"
    );
    statusRequest=StatusRequest.failure;
  }
 
}
update();
  }

@override
  void onInit() {
    email=Get.arguments['email'];
    // TODO: implement onInit
    super.onInit();
  }
    @override
  recode()async {
    var response=await verfiycodesignup.recode(
     email!
    );
  }
  @override
  void onClose() {
    timer?.cancel();
    // TODO: implement onClose
    super.onClose();
  }
}