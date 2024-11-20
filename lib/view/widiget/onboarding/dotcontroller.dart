

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:store313/controller/onboarding_controller.dart';
import 'package:store313/data/datasource/static/static.dart';

class DotcontrollerOnBoarding extends StatelessWidget{
 const DotcontrollerOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return   GetBuilder<OnboardingControllerImp>(builder:(controller)=>Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        ...List.generate(onBordingList.length,
         (index)=>AnimatedContainer(
          margin: const EdgeInsets.only(right: 5),
          duration:const Duration(milliseconds: 90, ),
          width: controller.currentPage==index?20:6,
          height: 6,
          decoration: BoxDecoration(color: Colors.blue[400],
          borderRadius: BorderRadius.circular(10)
          ),
          ))
    ],)) ;
  }

}