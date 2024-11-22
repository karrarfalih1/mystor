 //في هذه الصفحة نحن نفحص الايميل فقط 
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/routesname.dart';

abstract class ForgetPassword_controller extends  GetxController{
  checkemail();
  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  goToVerfiyCode();
}
class ForgetPassword_controllerImp extends ForgetPassword_controller{
 late TextEditingController email_controller;

 

  @override
  checkemail() {
    
  }
  
  @override
  goToVerfiyCode() {
   Get.offNamed(Approute.verfiycode);
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