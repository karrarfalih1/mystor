

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:store313/controller/onboarding_controller.dart';

class CustombuttonOnBoarding extends GetView<OnboardingControllerImp>{
 const CustombuttonOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return    
 Container(decoration: BoxDecoration(
    color: Colors.blue[400],
  borderRadius: BorderRadius.circular(10)
 ),
      
      margin:const EdgeInsets.only(bottom: 50),
      height: 45,
    //  padding:const EdgeInsets.symmetric(horizontal: 100,vertical: 1),
    
      child: MaterialButton(
        
        minWidth: 200,
        textColor:Colors.white,
        
        onPressed:(){
          
          controller.next();
        
        },child:const Text("Continue",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 15),),),); 
  }

}
