
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/auth/login_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/functionsk/alertexitapp.dart';
import 'package:store313/core/functionsk/validinput.dart';
import 'package:store313/view/widiget/auth/costomtestfeld.dart';
import 'package:store313/view/widiget/auth/custombuttomauth.dart';
import 'package:store313/view/widiget/auth/customsubtitleauth.dart';
import 'package:store313/view/widiget/auth/customtexttitleaout.dart';
import 'package:store313/view/widiget/auth/logoauth.dart';
import 'package:store313/view/widiget/auth/textsignup.dart';

class Login extends StatelessWidget{

  const Login({super.key});
  @override
  Widget build(BuildContext context) {

//نحقن الكونترولر الخاص بها
LoginControllerImp controller_Login =Get.put(LoginControllerImp());
    return SafeArea(child:   Scaffold(
      appBar: AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
       backgroundColor: Colors.white,
        title: Text("Sign In",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.grey),),),
body: WillPopScope(
  //حتى  لا يخرج من التطبيق مباشرتا
  onWillPop: alertExitApp,
  child:
Container(
   color: Colors.white,
  //color: Colors.red,
  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
  width: double.infinity,
  child: Form(
    key:controller_Login.formstatesignin ,
    child: ListView(
      children:[
         const SizedBox(height: 15,),
         const CustomLogoAuth(),
      const SizedBox(height: 15,),
      const CustomTextTitleAuth(title:"welcome",),
       const SizedBox(height: 10,),
       const CustomTextSubTitleAuth(subtitle: 'welcome2',)
       ,const SizedBox(height: 35,),
      
        Customtextfeld(
           valid: (val){
                return validInput(val!, 5, 100,"email" );
              },
        mycontroller: controller_Login.email_controller,
          hintText: "Enter your Email",
         labeltext: 'Email',
          iconss:Icons.email_outlined,
        //   mycontroller: ,
        ),
       GetBuilder<LoginControllerImp>(
        builder:(controller_Login) {
          return    Customtextfeld(
             valid: (val){
                return validInput(val!, 6, 30, "password");
              },
              onTap: (){
                controller_Login.hidandviewpassword();
              },
              obscureText: controller_Login.typepaworrdtext==true?true:false,
            mycontroller: controller_Login.password_controller,
            hintText: "Enter your Password",
         labeltext: 'Password',
          iconss:controller_Login.typepaworrdtext==true? Icons.remove_red_eye_outlined:Icons.lock,
        //   mycontroller: ,
        );
        }),
       InkWell(
        onTap: (){controller_Login.goToforget();},
        child: const Text("Foreget Password", textAlign: TextAlign.end,)),
       CustomButtomAuth(textbuttom: "Sign In",onPressed: (){
        controller_Login.login();
       },),
      const SizedBox(height: 30,),
    TextSignUpAndSignIn(
    title2: "Don `t have account? ",
    title: "Sing Up",onTap: (){
      print("to ---------------------- sign up");
      controller_Login.goToSignUp();
     // Get.toNamed()
    },)
    
      ],
    
    ),
  ),)))
    );
    
  
  }

}