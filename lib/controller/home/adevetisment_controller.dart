import 'dart:async';

import 'package:flutter/widgets.dart';
import 'package:get/get.dart';
import 'package:store313/core/classk/statusRequest.dart';
import 'package:store313/core/functionsk/handlingdatacontroller.dart';
import 'package:store313/data/datasource/remote/sliderdata.dart';

class AdevetismentController extends GetxController{
List data=[];
Sliderdata sliderdata=Sliderdata(Get.find());
  StatusRequest statusRequest=StatusRequest.none;

 PageController pageController=PageController();
 var currenPage=0.obs;
    void startAutoSlide(){ 
    
    Timer.periodic(const Duration(seconds: 5), (timer){
      if(currenPage.value<data.length-1){
        currenPage.value++;
      }else{ 
        currenPage.value=0;
      }
      pageController.animateToPage(
        currenPage.value,

       duration: const Duration(milliseconds: 500), curve: Curves.easeInOut);

    });
  }
      getSlider() async{
    statusRequest=StatusRequest.loading;
      update();
    var response=await sliderdata.getdata();
    statusRequest=handleingData(response);
if(StatusRequest.success==statusRequest){
  if(response['status']=='success'){
   data.addAll(response['data']);
  
     startAutoSlide();
  }else{
    statusRequest=StatusRequest.failure; }
}
update();
  }
@override
  void onInit() {
    getSlider();
   
    super.onInit();
  }
}