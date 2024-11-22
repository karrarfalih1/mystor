 //في هذه الصفحة نحن نفحص الايميل فقط 
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/routesname.dart';

abstract class ResetPassword_Controller extends  GetxController{
  goToSuccessResetPassword();
  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  ResetPassword();
}
class ResetPassword_ControllerImp extends ResetPassword_Controller{
 late TextEditingController newpassword_controller;
 late TextEditingController Renewpassword_controller;

 

  @override
  goToSuccessResetPassword() {
    if(newpassword_controller.text==Renewpassword_controller.text){
      Get.offAllNamed(Approute.successResetPassword);
    }
  }
  
  @override
  ResetPassword() {
   Get.offNamed(Approute.verfiycode);
  }
@override
  void onInit() {

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