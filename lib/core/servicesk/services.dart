
import 'package:firebase_core/firebase_core.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
///الامور الي نحتاجها اول ما يفتح التطبيق
///
class MyServices extends GetxService{
late SharedPreferences sharedPreferences;

Future<MyServices> init()async{
await Firebase.initializeApp();
 sharedPreferences= await SharedPreferences.getInstance();
 return this;
}


}

//هاي الداله نستدعيها بال main
initialServices()async{
//حقن
 await Get.putAsync(()=> MyServices().init());
}