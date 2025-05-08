import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SterperConteroller extends GetxController{


  
int currentStep=0;
 List<Step> get Stepsk=>[
    Step(
    
      state: StepState.indexed// currentStep >0?StepState.complete:controllerSignup.stateform==0?StepState.error: StepState.indexed,
     , isActive: currentStep >= 0,
      title: const Text("يطبخ",style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold),),
      
       content: const SizedBox(
       width: double.infinity,
       height: 550,
        child:Center(child: Text("one"),) ,) ),
     Step(
       state: currentStep >1?StepState.complete:StepState.indexed,
       isActive: currentStep >= 1,
      title: const Text(
      
      "على الطريق",style: TextStyle(fontSize: 9,fontWeight: FontWeight.bold)), content: const SizedBox(
    width: double.infinity,
    height: 600,
    child: Center(child: Text("one"),),
      )),
      Step(
         state: currentStep >2?StepState.complete:StepState.indexed,
        
         isActive: currentStep >= 2,
        title: const Text("تم ",style: TextStyle(fontSize: 9)), content: const SizedBox(
           width: double.infinity,
    height: 600,
          child: Center(child: Text("one"),),
        ))

  ];
}