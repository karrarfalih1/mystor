 //في هذه الصفحة نحن نفحص الايميل فقط 
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/core/servicesk/services.dart';
import 'package:store313/data/datasource/remote/app/homedata.dart';
import 'package:store313/data/model/itemsmodel.dart';
MyServices myservices=Get.find();
abstract class HomeController extends  MixSearchController{
  initialData();
  getdata();
  goToItems(List categories,int selectedCat,String categoryid);
}
class HomeControllerImp extends HomeController{
  //TextEditingController myname=TextEditingController();
@override
  // ignore: overridden_fields
  HomeData homedata=HomeData(Get.find());
String? username;
List categories=[];
List items=[];
MyServices myServices=Get.find();
String? lang;

@override
  // ignore: overridden_fields
  StatusRequest statusRequest=StatusRequest.none;

goToNotification(){
  Get.toNamed(Approute.notification);
}

@override
  initialData(){
     
  getdata();
  username=myservices.sharedPreferences.getString("username");
  lang=myServices.sharedPreferences.getString("lang");
}
@override
  void onInit() {
    FirebaseMessaging.instance.subscribeToTopic("users");
initialData();
   search=TextEditingController();
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
   categories.addAll(response['categories']['data']);
   items.addAll(response['items']['data']);
  
  
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


    goToItemsDeletes(itemsModel) {
    Get.toNamed(Approute.itemsDetels,arguments:{"itemsModel":itemsModel});
  }
}

///////////////////////////////////////////////////////////////////////////////
class MixSearchController extends GetxController{
  
HomeData homedata=HomeData(Get.find());
TextEditingController? search;
bool isSearch=false;
List<ItemsModel> listdatasearch=[];

StatusRequest statusRequest=StatusRequest.none;
checksearch(val){
if(val==""){
  statusRequest=StatusRequest.none;
  isSearch=false;
}
update();
}
onsearchItems(){
  isSearch=true;
   searchdata();
  update();

}
    searchdata()async{
      listdatasearch.clear();
    //نعطي قيمة ابتدائية وهي اللودنغ
    statusRequest=StatusRequest.loading;
//لجلب المعلومات
//الكيت داتا ترجعلنا اما خطا معين اما المصفوفة الي بيها البيانات
    var response=await homedata.searchdata(
      search!.text
    );

    statusRequest=handleingData(response);

//القيمة الفوك متوقع ترجعلي ثلالث اشياء  الاولى نجاح  والثانية خطا بالانترنيت والثالثة خطا بالاتصال
if(StatusRequest.success==statusRequest){
  if(response['status']=='success'){
    List responsdata=response['data'];
  listdatasearch.addAll(responsdata.map((e)=>ItemsModel.fromJson(e)));
  }else{
    statusRequest=StatusRequest.failure;
  }
 
}
update();
  }


}