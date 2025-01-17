
import 'package:get/get.dart';
import 'package:store313/controller/home/home_controller.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/data/datasource/remote/app/itemsdata.dart';
import 'package:store313/data/model/itemsmodel.dart';

abstract class ItemsController extends GetxController{
intialData();
changeCat(int selectedCatfromItemScreen, String catidfromsamescreen);
getItems(String categoriesid,userid );
goToItemsDeletes(ItemsModel itemsModel);
}
class ItemsControllerImp extends ItemsController{
  MyServices myServices =Get.find();
  ItemsData itemsdata=ItemsData(Get.find());
StatusRequest statusRequest=StatusRequest.none;
List data=[];
List categories=[];
String? userid;
//القسم ال انا ضغطت علي
int? selectedCat;
String? categoriesid;
  @override
  intialData() {
  userid=myservices.sharedPreferences.getString("id")!;
    categories=Get.arguments['categories'];
    selectedCat=Get.arguments['selectedCat'];
   
    categoriesid=Get.arguments["categoryid"];
     getItems( categoriesid! ,userid);
  }

@override
  void onInit() {
      print("----------------------itemscontroller");
     intialData();
    super.onInit();
  }
  
  @override
  changeCat(selectedCatfromItemScreen,catidfromsamescreen) {
   selectedCat=selectedCatfromItemScreen;
  categoriesid=catidfromsamescreen;
  print("----------------8");
  //print(categoriesid);
     getItems( categoriesid! ,userid);
   update();
  }

  @override
  getItems( categoriesidf,useridf)async {
    data.clear();
   statusRequest=StatusRequest.loading;
   var response=await itemsdata.postdata(categoriesidf,useridf);
   statusRequest=handleingData(response);
   if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
   data.addAll(response['data']);
print("---------itemscontrollerr--------------");

    }else{
      statusRequest=StatusRequest.failure;
    }
   }
   update();
  }
  
  @override
  goToItemsDeletes(itemsModel) {
    Get.toNamed(Approute.ItemsDetels,arguments:{"itemsModel":itemsModel});
  }
}