import 'package:get/get.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/data/model/itemsmodel.dart';

abstract class ItemsdetelsController extends GetxController {}

class ItemsdetelsControllerImp extends ItemsdetelsController {
  List subitemscolors = [
    {"name": "red", "id": 1, "active": "1"},
    {"name": "yelow", "id": 2, "active": "0"},
    {"name": "black", "id": 3, "active": "0"}
  ];

  MyServices myServices = Get.find();
  late ItemsModel itemsModel;
  String? lang;
  initialData() {
    lang = myServices.sharedPreferences.getString("lang");
    print("-----------------lang----------------");
    print(lang);

    itemsModel = Get.arguments["itemsModel"];
    print("6666666666666666666666666");
    print(itemsModel.categoriesName);
  }

  @override
  void onInit() {
    initialData();
    super.onInit();
  }
}
