 //في هذه الصفحة نحن نفحص الايميل فقط 
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/routesname.dart';

abstract class CheckEmail_Controller extends  GetxController{
  checkemail();
  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  goToSuccessSingUp();
}
class CheckEmail_ControllerImp extends CheckEmail_Controller{
 late TextEditingController email_controller;

 

  @override
  checkemail() {
    
  }
  
  @override
  goToSuccessSingUp() {
   Get.offNamed(Approute.successSignup);
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