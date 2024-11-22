 
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/routesname.dart';

abstract class LoginController extends  GetxController{
  login();
  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  goToSignUp();
  goToforget();
}
class LoginControllerImp extends LoginController{

 late TextEditingController email_controller;
 late TextEditingController password_controller;
  @override
  login() {
    
  }
  
  @override
  goToSignUp() {
   Get.toNamed(Approute.signup);
  }
@override
  void onInit() {
   email_controller =TextEditingController();
   password_controller=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
   email_controller.dispose();
   password_controller.dispose();
    super.dispose();
  }
  
  @override
  goToforget() {
   Get.toNamed(Approute.forgetpassword);
  }
}