 
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/routesname.dart';

abstract class LoginController extends  GetxController{
  login();
  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  goToSignUp();
  goToforget();
  hidandviewpassword();
}
class LoginControllerImp extends LoginController{
GlobalKey<FormState> formstatesignin=GlobalKey<FormState>();
 late TextEditingController email_controller;
 late TextEditingController password_controller;
 late bool typepaworrdtext=true;
  @override
  login() {
    //للتحقق من الفالديتر
    var formdatasignink=formstatesignin.currentState;
    if(formdatasignink!.validate()){
     print(" vlaid--------------------sign in");
    }else{
      print("note vlaid--------------------sign in");
    }
  }
  
  @override
  goToSignUp() {
   Get.offAllNamed(Approute.signup);
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
   hidandviewpassword(){
   typepaworrdtext=typepaworrdtext==true? false:true;
   update();
  }
}