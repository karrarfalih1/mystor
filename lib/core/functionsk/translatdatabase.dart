
import 'package:get/get.dart';
import 'package:store313/controller/home_controller.dart';
import 'package:store313/core/servicesk/services.dart';

translateDataBase(ar,en){
MyServices myServices=Get.find();

if(myservices.sharedPreferences.getString("lang")=="en"){
return en;
}else{
return ar;
}

}