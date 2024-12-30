 //في هذه الصفحة نحن نفحص الايميل فقط 
import 'package:get/get.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/data/datasource/remote/app/homedata.dart';
MyServices myservices=Get.find();
abstract class HomeController extends  GetxController{
  initialData();
  getdata();
  goToItems(List categories,int selectedCat,String categoryid);
}
class HomeControllerImp extends HomeController{
  //TextEditingController myname=TextEditingController();
HomeData homedata=HomeData(Get.find());
String? username;
List categories=[];
List items=[];
MyServices myServices=Get.find();
String? lang;
StatusRequest statusRequest=StatusRequest.none;
@override
  initialData(){
      print("----------------------homtecontroller");
  getdata();
  username=myservices.sharedPreferences.getString("username");
  lang=myServices.sharedPreferences.getString("lang");
}
@override
  void onInit() {
  
initialData();
  
    super.onInit();
  }

  
  @override
  getdata()async{
    //نعطي قيمة ابتدائية وهي اللودنغ
    statusRequest=StatusRequest.loading;
//لجلب المعلومات
//الكيت داتا ترجعلنا اما خطا معين اما المصفوفة الي بيها البيانات
    var response=await homedata.postdata();

    statusRequest=handleingData(response);

//القيمة الفوك متوقع ترجعلي ثلالث اشياء  الاولى نجاح  والثانية خطا بالانترنيت والثالثة خطا بالاتصال
if(StatusRequest.success==statusRequest){
  if(response['status']=='success'){
   categories.addAll(response['categories']);
   items.addAll(response['items']);
  
  
  }else{
    statusRequest=StatusRequest.failure;
  }
 
}
update();
  }
  
  @override
  goToItems( categories , selectedCat, categoryid) {
    Get.toNamed(Approute.items,arguments: {
       'categories':categories,
       "selectedCat":selectedCat,
       "categoryid":categoryid,
    });
print("cata-------------------cata");
  }
}