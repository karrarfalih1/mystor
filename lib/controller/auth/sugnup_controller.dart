 

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/data/datasource/remote/auth/signup.dart';

abstract class SignUp_Controller extends  GetxController{
  signup();
  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  goToSignIn();
  goToCheckEmail();
  hidandviewpassword();
}
class SignUp_ControllerImp extends SignUp_Controller{
GlobalKey<FormState> formstateSignUp=GlobalKey<FormState>();
 late TextEditingController email_controller;
 late TextEditingController password_controller;
 late TextEditingController username_controller;
  late TextEditingController phone_controller;
   StatusRequest?  statusRequest=StatusRequest.none;
 bool typepaworrdtext=true;

 // ignore: prefer_typing_uninitialized_variables
 SignUpData signUpData= SignUpData(Get.find());
 List data=[];
  @override
  signup() async{
    if(formstateSignUp.currentState!.validate()){
       
    //نعطي قيمة ابتدائية وهي اللودنغ
    statusRequest=StatusRequest.loading;
    update();

//لجلب المعلومات
//الكيت داتا ترجعلنا اما خطا معين اما المصفوفة الي بيها البيانات
    var response=await signUpData.postdata(
      username_controller.text,email_controller.text,phone_controller.text,password_controller.text
    );

    statusRequest=handleingData(response);

//القيمة الفوك متوقع ترجعلي ثلالث اشياء  الاولى نجاح  والثانية خطا بالانترنيت والثالثة خطا بالاتصال
if(StatusRequest.success==statusRequest){
  if(response['status']=='success'){
 //  data.addAll(response['data']);
     Get.offNamed(Approute.verifyCodeSignUp,arguments: {
      "email":email_controller.text
     });
  }else{
    Get.defaultDialog(title: "Warning",middleText: "الايميل او الرقم موجود بالفعل");
    statusRequest=StatusRequest.failure;
  }
 
}
update();
    }
    
  }
  
  @override
  goToSignIn() {
    
   Get.offNamed(Approute.login);
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
   @override
  hidandviewpassword(){
   typepaworrdtext=typepaworrdtext==true? false:true;
   update();
  }
  
}