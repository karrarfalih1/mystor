
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:get/get.dart';
import 'package:store313/controller/auth/veerifycodesignup_controller.dart';
import 'package:store313/controller/auth/verifycode_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/view/widiget/auth/customsubtitleauth.dart';
import 'package:store313/view/widiget/auth/customtexttitleaout.dart';

class VerifyCodeSignUp extends StatelessWidget{
  const VerifyCodeSignUp({super.key});
  @override
  Widget build(BuildContext context) {

//نحقن الكونترولر الخاص بها
 VerifyCodeSignUp_ControllerImp controller= Get.put(VerifyCodeSignUp_ControllerImp());
    return SafeArea(child:   Scaffold(
      appBar: AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
       backgroundColor: Colors.white,
        title: Text("Verification Code",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.grey),),),
body: Container(
   color: Colors.white,
  //color: Colors.red,
  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
  width: double.infinity,
  child: ListView(
    children:[
       const SizedBox(height: 15,),
    
    const SizedBox(height: 15,),
    const CustomTextTitleAuth(title:"Chek Code",),
     const SizedBox(height: 10,),
     const CustomTextSubTitleAuth(subtitle: 'plees Entter the Code',)
     ,const SizedBox(height: 35,),
    
  OtpTextField(
  focusedBorderColor: AppColor.maincolor,
borderWidth: 2.5,
  fieldWidth: 45,
        numberOfFields: 5,
        borderColor: Color(0xFF512DA8),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true, 
        //runs when a code is typed in
        onCodeChanged: (String code) {
            //handle validation or checks here           
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode){
      controller.goToSuccessSingUp();
         
            showDialog(
                context: context,
                builder: (context){

                return AlertDialog(
                    title:const Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                );
                }
            );
        }, // end onSubmit
    ),

    ],

  ),)
    ));
    
  
  }

}
  