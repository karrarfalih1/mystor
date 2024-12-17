
import 'package:get/get.dart';
import 'package:store313/core/constantk/routesname.dart';

abstract class CuccessrestPassword_Controller extends  GetxController{

  //عند الضغط عليها راح ياخذني لثفحة  انشاسء الحساب
  GoToSignIn();
}
class CuccessrestPassword_ControllerImp extends CuccessrestPassword_Controller{


  @override
  GoToSignIn() {
   Get.offAllNamed(Approute.login);
  }

}