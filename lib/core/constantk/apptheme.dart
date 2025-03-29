
import 'package:flutter/material.dart';
import 'package:store313/core/constantk/color.dart';
//الخاص باللغة الانكليزية 
ThemeData themeEnglish=
ThemeData(
 brightness: Brightness.light,
        //للتحكم في نوع الخط 9
        fontFamily: "playfairDisplay",
        appBarTheme: AppBarTheme(
          centerTitle: true
          ,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColor.maincolor),
          backgroundColor: Colors.grey[50],
          titleTextStyle: const TextStyle(
           fontWeight: FontWeight.bold,
               color: AppColor.maincolor,
               fontSize: 24,

          ),
        
        ),
        floatingActionButtonTheme:const FloatingActionButtonThemeData(
        backgroundColor: AppColor.maincolor
        ),
          textTheme:const TextTheme(
          headlineSmall:   TextStyle(
          fontFamily: "playfairDisplay",
                        fontWeight: FontWeight.bold, fontSize: 20), 
                        headlineMedium:   TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 28), 
      //    bodyMedium:TextStyle(
        //         height: 2, color: AppColor.grey, fontSize: 17),
        ),
      primarySwatch: Colors.blue
      
);

ThemeData  themeArabic=
ThemeData(
  // brightness: Brightness.dark,
 
        //للتحكم في نوع الخط 9
        fontFamily: "Cairo",
       appBarTheme: AppBarTheme(
             centerTitle: true
          ,
          elevation: 0,
          iconTheme: const IconThemeData(color: AppColor.maincolor),
          backgroundColor: Colors.grey[50],
          titleTextStyle: const TextStyle(
            fontFamily: "Cairo",
            fontWeight: FontWeight.bold,
               color: AppColor.maincolor,
               
               fontSize: 24,

          ),
        
        ),
                floatingActionButtonTheme:const FloatingActionButtonThemeData(
        backgroundColor: AppColor.maincolor
        ),
        textTheme:const TextTheme(
          headlineSmall:   TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 20), 
                        headlineMedium:   TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 28), 
      //    bodyMedium:TextStyle(
        //         height: 2, color: AppColor.grey, fontSize: 17),
        ),
      primarySwatch: Colors.blue
      
);