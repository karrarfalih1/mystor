//لتغيير اللغات 

//راح نخلي التطبيق يفتح بلغة الجهاز واذا راد يغير اللغه يكدر يغيرها من مكان محدد\


import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/apptheme.dart';
import 'package:store313/core/functionsk/fcmconfig.dart';
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
requestPerLocation()async{
  bool serviceEnabled;
  LocationPermission permission;
  serviceEnabled = await Geolocator.isLocationServiceEnabled();
   if (!serviceEnabled) {
    return Get.snackbar("تنبيه", "عليك تشغيل الموقع ");
}


  permission = await Geolocator.checkPermission();
  if (permission == LocationPermission.denied) {
    permission = await Geolocator.requestPermission();
    if (permission == LocationPermission.denied) {
    
      return Get.snackbar("تنبيه", "يرجى من التطبيق صلاحية الوصول للموقع");
    }}
      if (permission == LocationPermission.deniedForever) {
    // Permissions are denied forever, handle appropriately. 
    return Get.snackbar("تنبيه", "لا يمكن استعمال التطبيق من دون الموقع الجغرافي");
  } 

}
@override
  void onInit() {
    
     requestPermissionNotification();
    fcmconfig();
    requestPerLocation();
String?  curntlang= myServices.sharedPreferences.getString("lang");
    if(curntlang=="ar"){
      mylang= const Locale("ar");
      appTheme=themeArabic;
    }else if(curntlang=="en"){

 mylang=const Locale("en");
  appTheme=themeEnglish;
    }else{

    mylang=Locale(Get.deviceLocale!.languageCode);
    }

    super.onInit();
  }

}