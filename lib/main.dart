import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/bindings/initbinding.dart';
import 'package:store313/core/localizationk/translation.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/routes.dart';
import 'core/localizationk/changelocal.dart';

void main()async {

WidgetsFlutterBinding.ensureInitialized();
//استدعيناها من  السسرفزس  
await initialServices();

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
   LocaleController controllerlang= Get.put(LocaleController());
    return GetMaterialApp(
//من اجل تعدد اللغات
      translations: MyTranslation(),
      //لاخفاء الشريط الاحمر
debugShowCheckedModeBanner: false,
      locale: controllerlang.mylang,
      theme: controllerlang.appTheme,
      title: 'Flutter Demo',   
      initialBinding: Initbindings(),  
   
    
     getPages: routes
      //من اجل اليزي بوت حتى لا اضطر لاستدعائها في كل صفحة 
     // initialBinding: MyBinding(),
    );
  }
}
