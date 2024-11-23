// اول صفحة ومن خلالها احدد اللغة 

import 'package:flutter/rendering.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:otp_text_field/otp_field.dart';
import 'package:otp_text_field/style.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/localizationk/changelocal.dart';
import 'package:store313/view/widiget/langouage/custombuttomlang.dart';

class Test extends GetView<LocaleController>{
  const Test({super.key});

  @override
  Widget build(BuildContext context) {

   
   return Scaffold(
body: SizedBox(
 // color: Colors.amber,
  width: double.infinity,
  child: ListView(
    scrollDirection:Axis.vertical ,
    children: [
   const SizedBox(height: 300,),
   const Text("karrar"),
OtpTextField(
  focusedBorderColor: AppColor.maincolor,
borderWidth: 2.5,
  fieldWidth: 45,
        numberOfFields: 5,
        borderColor: const Color(0xFF512DA8),
        //set to true to show as box or false to show as dash
        showFieldAsBox: true, 
        //runs when a code is typed in
        onCodeChanged: (String code) {
            //handle validation or checks here           
        },
        //runs when every textfield is filled
        onSubmit: (String verificationCode){
            showDialog(
                context: context,
                builder: (context){
                return AlertDialog(
                    title: const Text("Verification Code"),
                    content: Text('Code entered is $verificationCode'),
                );
                }
            );
        }, // end onSubmit
    ), const Text("karrar"),
  ],),
)
   );
  }

}