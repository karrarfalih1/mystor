 
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/data/datasource/remote/auth/login.dart';

abstract class LoginController extends  GetxController{
  login();
  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  goToSignUp();
  goToforget();
  hidandviewpassword();
}
class LoginControllerImp extends LoginController{
  LoginData logindata= LoginData(Get.find());
GlobalKey<FormState> formstatesignin=GlobalKey<FormState>();
 late TextEditingController email_controller;
 late TextEditingController password_controller;
 StatusRequest? statusRequest=StatusRequest.none;
 late bool typepaworrdtext=true;

 MyServices myservices=Get.find();
  @override
  login() async{ 
     if(formstatesignin.currentState!.validate()){
       
    //نعطي قيمة ابتدائية وهي اللودنغ
    statusRequest=StatusRequest.loading;
    update();

//لجلب المعلومات
//الكيت داتا ترجعلنا اما خطا معين اما المصفوفة الي بيها البيانات
    var response=await logindata.postdata(
    
     email_controller.text,password_controller.text
    );
    statusRequest=handleingData(response);
//القيمة الفوك متوقع ترجعلي ثلالث اشياء  الاولى نجاح  والثانية خطا بالانترنيت والثالثة خطا بالاتصال
if(StatusRequest.success==statusRequest){
  if(response['status']=='success'){
    myservices.sharedPreferences.setString("id", response['data']['users_id'].toString());
     myservices.sharedPreferences.setString("username", response['data']['users_name']);
      myservices.sharedPreferences.setString("email", response['data']['users_email']);
       myservices.sharedPreferences.setString("phone", response['data']['users_phone']);
       //نستفاد منها بالاولةية عند بداية تسجيل الدخول
       myservices.sharedPreferences.setString("step","2");
    Get.toNamed(Approute.homepage);
  }else{
   Get.defaultDialog(title: "خطا",middleText: "الايميل او الرمز غير صحيح");
  }
 
}
update();
    }
  }
  
  @override
  goToSignUp() {
   Get.offAllNamed(Approute.signup);
  }
@override
  void onInit() {
    print("------------------------------------");
    FirebaseMessaging.instance.getToken().then((value){
      print(value);
      String? token=value;
    });
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
   @override
  hidandviewpassword(){
   typepaworrdtext=typepaworrdtext==true? false:true;
   update();
  }
}