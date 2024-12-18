//من خلاله  استطيع ان اتخطى  صفحه اللغة والصفحات التعريفيه وايضا تسجيل الدخول والخروج   ومعرفه اذا كان الشخص قد سجل سابقا ام لا 


import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/servicesk/services.dart';

class Mymiddleware extends GetMiddleware{
//تحديد الاولويات 
  @override
  int? priority = 0;
MyServices myServices=Get.find();
  @override
  //هنا نعمل عمليات المقارنه 
  RouteSettings? redirect(String? route) {
    
    if(myServices.sharedPreferences.getString("step")=="2"){
      // اذا كان الشخص شاف الاون بوردنغ فكبل روح لصفحة تسجيل الدخول
      return const RouteSettings(name: Approute.homepage);
    }
    if(myServices.sharedPreferences.getString("step")=="1"){
      // اذا كان الشخص شاف الاون بوردنغ فكبل روح لصفحة تسجيل الدخول
      return const RouteSettings(name: Approute.login);
    }
    return null;
  }

}