
import 'package:get/get.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/data/datasource/remote/app/itemsdata.dart';
import 'package:store313/data/model/itemsmodel.dart';

abstract class ItemsController extends GetxController{
intialData();
changeCat(int selectedCatfromItemScreen, String catidfromsamescreen);
getItems(String categoriesid );
goToItemsDeletes(ItemsModel itemsModel);
}
class ItemsControllerImp extends ItemsController{
  ItemsData itemsdata=ItemsData(Get.find());
StatusRequest statusRequest=StatusRequest.none;
List data=[];
List categories=[];
//القسم ال انا ضغطت علي
int? selectedCat;
String? categoriesid;
  @override
  intialData() {
  
    categories=Get.arguments['categories'];
    selectedCat=Get.arguments['selectedCat'];
   
    categoriesid=Get.arguments["categoryid"];
     getItems( categoriesid! );
  }

@override
  void onInit() {
     intialData();
    super.onInit();
  }
  
  @override
  changeCat(selectedCatfromItemScreen,catidfromsamescreen) {
   selectedCat=selectedCatfromItemScreen;
  categoriesid=catidfromsamescreen;
  print("----------------8");
  print(categoriesid);
     getItems( categoriesid! );
   update();
  }

  @override
  getItems( categoriesidf)async {
    data.clear();
   statusRequest=StatusRequest.loading;
   var response=await itemsdata.postdata(categoriesidf);
   statusRequest=handleingData(response);
   if(StatusRequest.success==statusRequest){
    if(response['status']=='success'){
   data.addAll(response['data']);

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