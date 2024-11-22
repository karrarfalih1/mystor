//لتغيير اللغات 

//راح نخلي التطبيق يفتح بلغة الجهاز واذا راد يغير اللغه يكدر يغيرها من مكان محدد\

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/apptheme.dart';
import 'package:store313/core/servicesk/services.dart';

class LocaleController extends GetxController{

Locale? mylang;
MyServices myServices=Get.find();
ThemeData appTheme=themeArabic;


changeLang(String codlang){
  Locale locale=Locale(codlang);
  myServices.sharedPreferences.setString("lang", codlang);
  //لتغيير  الثيم حسب اللغة  
appTheme=codlang=="ar"?themeArabic:themeEnglish;
 Get.updateLocale(locale);
Get.changeTheme(appTheme);

 
}
@override
  void onInit() {
String?  curntlang= myServices.sharedPreferences.getString("lang");
    if(curntlang=="ar"){
      mylang= const Locale("ar");
      appTheme=themeArabic;
    }else if(curntlang=="en"){

 mylang=const Locale("ar");
  appTheme=themeEnglish;
    }else{

    mylang=Locale(Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }

}