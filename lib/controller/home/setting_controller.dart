import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/home_controller.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/servicesk/services.dart';

abstract class SettingController extends GetxController{

}
class SettingControllerImp extends SettingController{
MyServices myServices =Get.find();
  
  @override
  void onInit() {
   
    super.onInit();
  }
  void logout ()async{
     String? userid=myservices.sharedPreferences.getString("id");
    await   FirebaseMessaging.instance.unsubscribeFromTopic("users");
     await     FirebaseMessaging.instance.unsubscribeFromTopic("users${userid}");
myServices.sharedPreferences.clear();
Get.offAllNamed(Approute.login);
  }
}