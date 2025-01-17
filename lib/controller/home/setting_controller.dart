import 'package:get/get.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/servicesk/services.dart';

abstract class SettingController extends GetxController{

}
class SettingControllerImp extends SettingController{
MyServices myServices =Get.find();
  
  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
  }
  void logout (){
myServices.sharedPreferences.clear();
Get.offAllNamed(Approute.login);
  }
}