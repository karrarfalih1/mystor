
//هذه الصفحة  لنتاكد ان  الايميل  موجود فعلا في قاعدة البيانات   ثم ننقله للتحقق  من البريد الالكتروني  
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/auth/forgetpassword_controller.dart';
import 'package:store313/controller/auth/resetpassword_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/view/widiget/auth/costomtestfeld.dart';
import 'package:store313/view/widiget/auth/custombuttomauth.dart';
import 'package:store313/view/widiget/auth/customsubtitleauth.dart';
import 'package:store313/view/widiget/auth/customtexttitleaout.dart';

class ResetPassword extends StatelessWidget{
  const ResetPassword({super.key});
  @override
  Widget build(BuildContext context) {

//نحقن الكونترولر الخاص بها
 ResetPassword_ControllerImp controller=
  Get.put(ResetPassword_ControllerImp());
    return SafeArea(child:   Scaffold(
      appBar: AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
       backgroundColor: Colors.white,
        title: Text("Reset Password",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.grey),),),
body: Container(
   color: Colors.white,
  //color: Colors.red,
  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
  width: double.infinity,
  child: ListView(
    children:[
       const SizedBox(height: 15,),
    
    const SizedBox(height: 15,),
    const CustomTextTitleAuth(title:"New Password",),
     const SizedBox(height: 10,),
     const CustomTextSubTitleAuth(subtitle: 'plees enter new password',)
     ,const SizedBox(height: 35,),
    
      Customtextfeld(
        mycontroller: controller.newpassword_controller,
        hintText: "Enter The New Password",
       labeltext: 'New Password',
        iconss:Icons.person_outline,
      //   mycontroller: ,
      ),
      
      Customtextfeld(
        mycontroller: controller.Renewpassword_controller,
        hintText: "Re Enter The New Password",
       labeltext: 'New Password',
        iconss:Icons.person_outline,
      //   mycontroller: ,
      ),
    
     CustomButtomAuth(textbuttom: "Check",onPressed: (){
      controller.goToSuccessResetPassword();
     },),
    const SizedBox(height: 30,),

    ],

  ),)
    ));
    
  
  }

}
  