 
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/functionsk/validinput.dart';

abstract class SignUp_Controller extends  GetxController{
  signup();
  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  goToSignIn();
  goToCheckEmail();
}
class SignUp_ControllerImp extends SignUp_Controller{
GlobalKey<FormState> formstateSignUp=GlobalKey<FormState>();
 late TextEditingController email_controller;
 late TextEditingController password_controller;
 late TextEditingController username_controller;
 late TextEditingController phone_controller;
 

  @override
  signup() {
    
  }
  
  @override
  goToSignIn() {
    
   Get.offAllNamed(Approute.login);
  }
@override
  void onInit() {

   email_controller =TextEditingController();
   password_controller=TextEditingController();
   username_controller=TextEditingController();
   phone_controller=TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
   email_controller.dispose();
   password_controller.dispose();
    username_controller.dispose();
  phone_controller.dispose();
    super.dispose();
  }
  
  @override
  goToCheckEmail() {

    
   var formdatasignup=formstateSignUp.currentState;
   if(formdatasignup!.validate()){
    print("vlidet-----------------------signUp");
     Get.offNamed(Approute.verifyCodeSignUp);
     Get.delete<SignUp_ControllerImp>();
   }else{
     print("note vlidet-----------------------signUp");
   }
   
  }
}