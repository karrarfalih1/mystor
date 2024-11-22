 //في هذه الصفحة نحن نفحص الايميل فقط 
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/routesname.dart';

abstract class VerifyCodeSignUp_Controller extends  GetxController{
  checkCode();
  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  goToSuccessSingUp();
}
class VerifyCodeSignUp_ControllerImp extends VerifyCodeSignUp_Controller{
 String? verfiycode;

 

  @override
  checkCode() {
    
  }
  
  @override
  goToSuccessSingUp() {
   Get.offNamed(Approute.successSignup);
  }
@override
  void onInit() {

  
    super.onInit();
  }

}