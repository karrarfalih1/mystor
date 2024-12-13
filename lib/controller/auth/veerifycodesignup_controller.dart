 //في هذه الصفحة نحن نفحص الايميل فقط 
import 'package:get/get.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';

import '../../core/classk/statusRequest.dart';
import '../../data/datasource/remote/auth/verfiycodesignup.dart';

abstract class VerifyCodeSignUp_Controller extends  GetxController{
  checkCode();
  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  goToSuccessSingUp(String verfiycode);
}
class VerifyCodeSignUp_ControllerImp extends VerifyCodeSignUp_Controller{
Verfiycodesignup verfiycodesignup =Verfiycodesignup(Get.find());
 String? verfiycode;
StatusRequest? statusRequest;
 String?email;

  @override
  checkCode() {
    
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
     ;
  }else{
    
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
}