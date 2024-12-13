

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import 'package:store313/controller/auth/sugnup_controller.dart';
import 'package:store313/core/classk/statusRequest.dart';

import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/constantk/imagesasset.dart';
import 'package:store313/core/functionsk/alertexitapp.dart';
import 'package:store313/core/functionsk/validinput.dart';
import 'package:store313/view/widiget/auth/costomtestfeld.dart';
import 'package:store313/view/widiget/auth/custombuttomauth.dart';
import 'package:store313/view/widiget/auth/customsubtitleauth.dart';
import 'package:store313/view/widiget/auth/customtexttitleaout.dart';
import 'package:store313/view/widiget/auth/textSignUp.dart';

class SignUp extends StatelessWidget{
  const SignUp({super.key});
  @override
  Widget build(BuildContext context) {

//نحقن الكونترولر الخاص بها
 Get.lazyPut(()=>SignUp_ControllerImp());
    return SafeArea(child:   Scaffold(
      appBar: AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
       backgroundColor: Colors.white,
        title: Text("Sign Up",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.grey),),),
body: WillPopScope(
  onWillPop: alertExitApp
  ,
  child: GetBuilder<SignUp_ControllerImp>(builder: (controller)=>
  controller.statusRequest==StatusRequest.loading?Center(child: Lottie.asset(AppImagesasset.Loading),):
Container(
   color: Colors.white,
  //color: Colors.red,
  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
  width: double.infinity,
  child: Form(
    key: controller.formstateSignUp,
    child: ListView(
      children:[
         const SizedBox(height: 15,),
      
      const SizedBox(height: 15,),
      const CustomTextTitleAuth(title:"welcome",),
       const SizedBox(height: 10,),
       const CustomTextSubTitleAuth(subtitle: 'welcome2',)
       ,const SizedBox(height: 35,),
      
        Customtextfeld(
           valid: (val){
            return  validInput(val!, 6, 30, "username");
    
                
              },
          mycontroller: controller.username_controller,
          hintText: "Enter your Username",
         labeltext: 'Username',
          iconss:Icons.person_outline,
        //   mycontroller: ,
        ),
      
         Customtextfeld(
           valid: (val){
                return validInput(val!, 5, 100, "email");
              },
          mycontroller: controller.email_controller,
          hintText: "Enter your Email",
         labeltext: 'Email',
          iconss:Icons.email_outlined,
        //   mycontroller: ,
        ),
             Customtextfeld(
              valid: (val){
    return validInput(val!, 11, 11, "phone");
              },
              keyboardType: TextInputType.phone,
              mycontroller: controller.phone_controller,
              hintText: "Enter your Phone",
         labeltext: 'Phone',
          iconss:Icons.phone_outlined,
        //   mycontroller: ,
        ),
          Customtextfeld(
             valid: (val){
                return validInput(val!, 6, 30, "password");
              },
              onTap: (){
                controller.hidandviewpassword();
              },
              obscureText: controller.typepaworrdtext==true?true:false,
            mycontroller: controller.password_controller,
            hintText: "Enter your Password",
         labeltext: 'Password',
          iconss:controller.typepaworrdtext==true? Icons.remove_red_eye_outlined:Icons.lock,
        //   mycontroller: ,
        ),
       CustomButtomAuth(textbuttom: "Sign Up",onPressed: (){
        controller.signup();
       },),
      const SizedBox(height: 30,),
    TextSignUpAndSignIn(
    title2: "have account? ",
    title: "Sing In",onTap: (){
    controller.goToSignIn();
    },)
      ],
    
    ),
  ),)), )


    ));
    
  
  }

}
  