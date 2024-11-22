

import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'package:path/path.dart';
import 'package:store313/controller/onboarding_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/data/datasource/static/static.dart';

class CustomSliderOnBoarding extends GetView<OnboardingControllerImp>{
 const CustomSliderOnBoarding({super.key});
  @override
  Widget build(BuildContext context) {
    return     PageView.builder(
      controller: controller.pageControllerk,
      //لتغيير الصفحة 
      onPageChanged: (val){
      controller.onPageChanged(val);
      },
              itemCount: onBordingList.length,
              itemBuilder: (context, i) {
                return Column(children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Text(
                    onBordingList[i].title!,
                    style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold)
                  ),
                  const SizedBox(
                    height: 50,
                  ),
                  SizedBox(
                      //     color: Colors.red,
                      width: double.infinity,
                      height: 230,
                      child: Image.asset(onBordingList[i].image!,
                          fit: BoxFit.contain)),
                  const SizedBox(
                    height: 50,
                  ),
                  Container(
                    //اقصى عرض ممكن
                    width: double.infinity,
                    alignment: Alignment.center,
                    child: Text(
                      onBordingList[i].body!,
                      textAlign: TextAlign.center,

                     
                      style:TextStyle(fontSize: 16,color: AppColor.grey)
                    ),
                  )
                ]);
              });}

}
