
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/view/widiget/auth/costomtestfeld.dart';

class Login extends StatelessWidget{
  const Login({super.key});
  @override
  Widget build(BuildContext context) {
    return SafeArea(child:   Scaffold(
      appBar: AppBar(
        //لجعلالعنوان في المنتصف
        centerTitle: true,
        
        title: Text("Sign In",style: Theme.of(context).textTheme.headlineSmall!.copyWith(color: AppColor.grey),),),
body: Container(
  //color: Colors.red,
  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
  width: double.infinity,
  child: Column(
 // mainAxisAlignment: MainAxisAlignment.center,
 crossAxisAlignment: CrossAxisAlignment.center,
  children: [
   const SizedBox(height: 30,),
  Text("welcome".tr,style: Theme.of(context).textTheme.headlineMedium,),
 const SizedBox(height: 10,),
  Container(
    margin:const EdgeInsets.symmetric(horizontal: 20),
    child: Text("welcome2".tr,style: Theme.of(context).textTheme.bodySmall!.copyWith(color:AppColor.grey ),textAlign: TextAlign.center,)),
    const SizedBox(height: 25,),
    const Customtextfeld(title: "")

],),)
    ));
    
  
  }

}