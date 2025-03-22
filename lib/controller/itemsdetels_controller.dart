import 'package:get/get.dart';
import 'package:store313/controller/cart_controller.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/data/model/itemsmodel.dart';

abstract class ItemsdetelsController extends GetxController {}

class ItemsdetelsControllerImp extends ItemsdetelsController {

  
    CartController cartController =Get.put(CartController());
  List subitemscolors = [
    {"name": "red", "id": 1, "active": "1"},
    {"name": "yelow", "id": 2, "active": "0"},
    {"name": "black", "id": 3, "active": "0"}
  ];
  add(){
        cartController.add(itemsModel.itemsId);
    countitems++;
    update();
  }
  remove(){
    if(countitems>0){
    cartController.delet(itemsModel.itemsId);
      countitems--;
    }
    update();
  }

int countitems=0;
  MyServices myServices = Get.find();
  late ItemsModel itemsModel;
  StatusRequest statusRequest=StatusRequest.none;
  String? lang;


  gotocart(){
    Get.offNamed(Approute.cart);
  }
  initialData()async {

   statusRequest=StatusRequest.loading;
      lang = myServices.sharedPreferences.getString("lang");
  

    itemsModel = Get.arguments["itemsModel"];
  countitems= await  cartController.getCountItems("${itemsModel.itemsId!}");
  statusRequest=StatusRequest.success;
  update();
  }

  @override
  void onInit() {
   
    initialData();
    super.onInit();
  }
}
