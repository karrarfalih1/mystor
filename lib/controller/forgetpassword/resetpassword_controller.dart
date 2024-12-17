 //في هذه الصفحة نحن نفحص الايميل فقط 
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/data/datasource/remote/forgetpassword/resetpassword.dart';

abstract class ResetPassword_Controller extends  GetxController{
  goToSuccessResetPassword();
  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  ResetPassword();
}
class ResetPassword_ControllerImp extends ResetPassword_Controller{
 late TextEditingController newpassword_controller;
 late TextEditingController Renewpassword_controller;
 Resetpassword resetpassword= Resetpassword(Get.find());
 String? email;
StatusRequest statusRequest=StatusRequest.none;
  @override
  goToSuccessResetPassword()  async{ 
    if(newpassword_controller.text==Renewpassword_controller.text){
 statusRequest=StatusRequest.loading;
    update();

//لجلب المعلومات
//الكيت داتا ترجعلنا اما خطا معين اما المصفوفة الي بيها البيانات
    var response=await resetpassword.postdata(
    
   email!,Renewpassword_controller.text
    );
 
  print(response);
    statusRequest=handleingData(response);
//القيمة الفوك متوقع ترجعلي ثلالث اشياء  الاولى نجاح  والثانية خطا بالانترنيت والثالثة خطا بالاتصال
if(StatusRequest.success==statusRequest){
  print(response);
  if(response['status']=='success'){
    Get.toNamed(Approute.successResetPassword);
  }else{
   Get.defaultDialog(title: "خطا",middleText: " حاول مرة اخرى");
  }
 
}
update();
  ////////  }
    }else{
      Get.defaultDialog(title: "خطا",middleText: "اكتب كلمة مرور مطابقة");
    }
 
  }
  
  @override
  ResetPassword() {
   Get.offNamed(Approute.verfiycode);
  }
@override
  void onInit() {
 email=Get.arguments['email'];
   newpassword_controller =TextEditingController();
   Renewpassword_controller =TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
   newpassword_controller.dispose();
   Renewpassword_controller.dispose();

    super.dispose();
  }
}