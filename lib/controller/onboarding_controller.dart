

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/data/datasource/static/static.dart';
//ال apstract يوضه المثودات مال كل  صفحة 
abstract class OnBoardingController extends GetxController{

  next();
  //ملاحضة في  ال  بيج فيو بلدر  هناك ميزه انه عطيك رقم الصفحة الي انت بيها لهذا راح نستخدم هل رقم بهاي الدالة
  onPageChanged(int index);
}


class OnboardingControllerImp extends OnBoardingController{
late PageController pageControllerk;
  int currentPage=0;
  //نحن مسبقا  حاقنين ال  MyServices
  MyServices myServices=Get.find();


  @override
  next() {
   
    currentPage++;

     if(currentPage == onBordingList.length){
      //راح استفاد منها حتى اعرف اذا الشخص شاف الاون بوردنغ لو لا
      myServices.sharedPreferences.setString("onboarding", "1");
      Get.offAllNamed(Approute.login);
print("00000000000000000000000");
    }else{ pageControllerk.animateToPage(currentPage,duration: const Duration(milliseconds: 90),curve: Curves.easeInOut);}

  // print(currentPage);
  }

  @override
  onPageChanged(int index) {
    currentPage=index;
    update();
  }
  @override
  void onInit() {
    pageControllerk=PageController();
    super.onInit();
  }

}