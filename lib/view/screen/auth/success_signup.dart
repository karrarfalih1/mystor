//عندما يقوم بانشاء الحساب فانه يجب ان  نتحقق من بريده او  رقم هاتفه //بعد ان يقوم بتغيير كلمة المرور سوف ينتقل الى هذه الصفحة 

// اول صفحة ومن خلالها احدد اللغة 


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/auth/successsignup_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/localizationk/changelocal.dart';
import 'package:store313/view/widiget/auth/custombuttomauth.dart';

class Success_SignUp extends GetView<LocaleController>{
  const Success_SignUp({super.key});

  @override
  Widget build(BuildContext context) {

   CuccessSignUp_ControllerImp controller=Get.put(CuccessSignUp_ControllerImp());
   return Scaffold(
       appBar: AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
       backgroundColor: Colors.white,
        title: Text("Success SingUp",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.grey),),),

body: Container(
  color: Colors.white,
  width: double.infinity,
  padding:const EdgeInsets.all(20),
  
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,
    crossAxisAlignment: CrossAxisAlignment.center,
    
    children: [
     const Icon(Icons.check,size: 200,),
     const Text("Go to Login"),
  //   SizedBox(height: 100,),
  const Spacer(),
        SizedBox(
          width: double.infinity,
          child: CustomButtomAuth(textbuttom: "Sign In",onPressed: (){
            controller.GoToSignIn();
             //   controller.();
               },),
        ),
        const SizedBox(height: 40,)


],),),
   );
  }

}