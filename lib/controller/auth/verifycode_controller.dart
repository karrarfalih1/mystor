 //في هذه الصفحة نحن نفحص الايميل فقط 
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/routesname.dart';

abstract class VerifyCode_Controller extends  GetxController{
  checkCode();
  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  GoToResetPassword();
}
class VerifyCode_ControllerImp extends VerifyCode_Controller{
 String? verfiycode;

 

  @override
  checkCode() {
    
  }
  
  @override
  GoToResetPassword() {
   Get.offNamed(Approute.resetpassword);
  }

}