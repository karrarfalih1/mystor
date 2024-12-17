 //في هذه الصفحة نحن نفحص الايميل فقط 
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/data/datasource/remote/forgetpassword/checkemail.dart';

abstract class ForgetPassword_controller extends  GetxController{
  checkemail();
  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  goToVerfiyCode();
}
class ForgetPassword_controllerImp extends ForgetPassword_controller{
GlobalKey<FormState> formstatcheckemail=GlobalKey<FormState>();
 late TextEditingController email_controller;
  CheckEmail checkemaildata= CheckEmail(Get.find());
 StatusRequest statusRequest=StatusRequest.none;

  @override
  checkemail() async{ 
  /////   if(formstatcheckemail.currentState!.validate()){
    //نعطي قيمة ابتدائية وهي اللودنغ
    statusRequest=StatusRequest.loading;
    update();

//لجلب المعلومات
//الكيت داتا ترجعلنا اما خطا معين اما المصفوفة الي بيها البيانات
    var response=await checkemaildata.postdata(
    
     email_controller.text
    );
 
  print(response);
    statusRequest=handleingData(response);
//القيمة الفوك متوقع ترجعلي ثلالث اشياء  الاولى نجاح  والثانية خطا بالانترنيت والثالثة خطا بالاتصال
if(StatusRequest.success==statusRequest){
  print(response);
  if(response['status']=='success'){
    Get.toNamed(Approute.verfiycode,arguments: {"email":email_controller.text});
  }else{
   Get.defaultDialog(title: "خطا",middleText: " الايميل غير موجود");
  }
 
}
update();
  ////////  }
  }
  
  @override
  goToVerfiyCode() {
 //  Get.offNamed(Approute.verfiycode);
  }
@override
  void onInit() {

   email_controller =TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
   email_controller.dispose();

    super.dispose();
  }
}