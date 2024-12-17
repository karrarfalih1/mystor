// اول صفحة ومن خلالها احدد اللغة 


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/localizationk/changelocal.dart';


class homepage extends GetView<LocaleController>{
  const homepage({super.key});

  @override
  Widget build(BuildContext context) {

   
   return const Scaffold(
body:Center(child:Text("HOME PAGE",style: TextStyle(fontSize: 40),)

)
   );
  }

}