

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/auth/sugnup_controller.dart';

import 'package:store313/core/constantk/color.dart';
import 'package:store313/view/widiget/auth/costomtestfeld.dart';
import 'package:store313/view/widiget/auth/custombuttomauth.dart';
import 'package:store313/view/widiget/auth/customsubtitleauth.dart';
import 'package:store313/view/widiget/auth/customtexttitleaout.dart';
import 'package:store313/view/widiget/auth/logoauth.dart';
import 'package:store313/view/widiget/auth/textSignUp.dart';

class SignUp extends StatelessWidget{
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {

//نحقن الكونترولر الخاص بها
 SignUp_ControllerImp controller= Get.put(SignUp_ControllerImp());
    return SafeArea(child:   Scaffold(
      appBar: AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
       backgroundColor: Colors.white,
        title: Text("Sign Up",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.grey),),),
body: Container(
   color: Colors.white,
  //color: Colors.red,
  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
  width: double.infinity,
  child: ListView(
    children:[
       const SizedBox(height: 15,),
    
    const SizedBox(height: 15,),
    const CustomTextTitleAuth(title:"welcome",),
     const SizedBox(height: 10,),
     const CustomTextSubTitleAuth(subtitle: 'welcome2',)
     ,const SizedBox(height: 35,),
    
      Customtextfeld(
        mycontroller: controller.username_controller,
        hintText: "Enter your Username",
       labeltext: 'Username',
        iconss:Icons.person_outline,
      //   mycontroller: ,
      ),
    
       Customtextfeld(
        mycontroller: controller.email_controller,
        hintText: "Enter your Email",
       labeltext: 'Email',
        iconss:Icons.email_outlined,
      //   mycontroller: ,
      ),
           Customtextfeld(
            mycontroller: controller.phone_controller,
            hintText: "Enter your Phone",
       labeltext: 'Phone',
        iconss:Icons.phone_outlined,
      //   mycontroller: ,
      ),
        Customtextfeld(
          mycontroller: controller.password_controller,
          hintText: "Enter your Password",
       labeltext: 'Password',
        iconss:Icons.lock_outline,
      //   mycontroller: ,
      ),
     CustomButtomAuth(textbuttom: "Sign Up",onPressed: (){
      controller.goToCheckEmail();
     },),
    const SizedBox(height: 30,),
TextSignUpAndSignIn(
  title2: "have account? ",
  title: "Sing In",onTap: (){
  controller.goToSignIn();
},)
    ],

  ),)
    ));
    
  
  }

}
  