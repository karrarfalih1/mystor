
// اللغات 



import 'package:get/get_navigation/get_navigation.dart';

class MyTranslation extends Translations{
  @override
  
  Map<String, Map<String, String>> get keys => {
   "ar":{
       "1":" اختر اللغة",
       "welcome":"اهلا بعودتك",
       "welcome2":"قم بالتسجيل باستخدام بريدك الإلكتروني وكلمة المرور أو تابع عبر وسائل التواصل الاجتماعي ",
       "5":"لدينا 100 ألف منتج، اختر منتجك من اختر اللغة\n التجارة الإلكترونية"
   },

   "en":{
    "1":"Choose Language",
     "welcome":"Welcome Back",
     "welcome2":"Sing in with your email and pasword or continue eith social media",
     "5":"We have a 100k product, Chosse \n Your Product From Our\n E_comerce Shap"


   }

  };

}