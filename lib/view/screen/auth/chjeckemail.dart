//للتحقق من البريد الاكتروني

//هذه الصفحة  لنتاكد ان  الايميل  موجود فعلا في قاعدة البيانات   ثم ننقله للتحقق  من البريد الالكتروني  
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/auth/checkemail_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/view/widiget/auth/costomtestfeld.dart';
import 'package:store313/view/widiget/auth/custombuttomauth.dart';
import 'package:store313/view/widiget/auth/customsubtitleauth.dart';
import 'package:store313/view/widiget/auth/customtexttitleaout.dart';

class CheckEmail extends StatelessWidget{
  const CheckEmail({super.key});
  @override
  Widget build(BuildContext context) {

//نحقن الكونترولر الخاص بها
 CheckEmail_ControllerImp controller= Get.put(CheckEmail_ControllerImp());
    return SafeArea(child:   Scaffold(
      appBar: AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
       backgroundColor: Colors.white,
        title: Text("Check Email",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.grey),),),
body: Container(
   color: Colors.white,
  //color: Colors.red,
  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
  width: double.infinity,
  child: ListView(
    children:[

    const SizedBox(height: 30,),
    const CustomTextTitleAuth(title:"Success SignUp",),
     const SizedBox(height: 10,),
     const CustomTextSubTitleAuth(subtitle: 'pless Enter your email to chack it',)
     ,const SizedBox(height: 35,),
    
      Customtextfeld(
        mycontroller: controller.checkemail(),
        hintText: "Enter your Email",
       labeltext: 'Email',
        iconss:Icons.email_outlined,
      //   mycontroller: ,
      ),
    
     CustomButtomAuth(textbuttom: "Check",onPressed: (){
      controller.goToSuccessSingUp();
     },),
    const SizedBox(height: 30,),

    ],

  ),)
    ));
    
  
  }

}
  