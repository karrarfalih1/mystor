// اول صفحة ومن خلالها احدد اللغة 


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/localizationk/changelocal.dart';
import 'package:store313/view/widiget/langouage/custombuttomlang.dart';

class Languagek extends GetView<LocaleController>{
  const Languagek({super.key});

  @override
  Widget build(BuildContext context) {

   
   return Scaffold(
body: Container(
  padding:const EdgeInsets.all(20),
  
  child: Column(
    mainAxisAlignment: MainAxisAlignment.center,

    
    children: [
      Text("1".tr,style:Theme.of(context).textTheme.headlineSmall),
     const SizedBox(height: 50,),
 
 CustombuttomLang(title: "عربي",onPressedk:(){
  controller.changeLang("ar");
  Get.offNamed(Approute.onboarding);

 }),
 CustombuttomLang(title:"English",onPressedk: (){
  controller.changeLang("en");
   Get.offNamed(Approute.onboarding);
 }, ),
],),),
   );
  }

}