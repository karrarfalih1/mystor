import 'package:flutter/material.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/get_instance.dart';
import 'package:store313/controller/onboarding_controller.dart';
import 'package:store313/view/widiget/onboarding/custombutton.dart';
import 'package:store313/view/widiget/onboarding/customslider.dart';
import 'package:store313/view/widiget/onboarding/dotcontroller.dart';

class OnBoarding extends StatelessWidget {
  const OnBoarding({super.key});
  @override
  Widget build(BuildContext context) {

    //عملنا حقن  حتى نكدر نوصل للمتحكم 
    Get.put(OnboardingControllerImp());
    return const Scaffold(
        body: SafeArea(
            child: Column(
      children: [
        Expanded(
          flex: 3,
          // height: 700,
          child: CustomSliderOnBoarding()
        ),
        Expanded(
          flex: 1,
          child: Column( 
            children: [
               DotcontrollerOnBoarding(),
            
              Spacer( flex: 2,),
                CustombuttonOnBoarding(),
             
            ],
          ),
        )
      ],
    )));
  }
}
