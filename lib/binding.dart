//حتى لا اضطر  في كل صفحة استدعي ال ليزي  بوت 

import 'package:get/get.dart';
import 'package:store313/controller/auth/login_controller.dart';
import 'package:store313/controller/auth/sugnup_controller.dart';

class MyBinding  extends Bindings{
  @override
  void dependencies() {

  Get.lazyPut(()=> Get.lazyPut(()=>SignUp_ControllerImp(),fenix: true));
  Get.lazyPut(()=>  Get.lazyPut(()=>LoginControllerImp()),fenix: true);
   
  }

}