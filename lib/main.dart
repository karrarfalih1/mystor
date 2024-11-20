import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/localizationk/translation.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/routes.dart';
import 'package:store313/view/screen/language.dart';

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
      title: 'Flutter Demo',
      theme: ThemeData(
 
        //للتحكم في نوع الخط 9
        fontFamily: "playfairDisplay",
        textTheme:const TextTheme(
          headlineSmall:   TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20), 
                        headlineMedium:   TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 28), 
          bodySmall:TextStyle(
                          height: 2, color: AppColor.grey, fontSize: 17),
        ),
      primarySwatch: Colors.blue
      ),
      home:Languagek(),
      routes: routes,
    );
  }
}
