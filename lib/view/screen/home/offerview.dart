import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/favorite_controller.dart';
import 'package:store313/controller/offerview_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
import 'package:store313/core/constantk/routesname.dart';
import 'package:store313/view/screen/home/home.dart';
import 'package:store313/view/widiget/castomappbar.dart';
import 'package:store313/view/widiget/offerwidget/gridviewofferscostum.dart';

class Offerview extends StatelessWidget{
  const Offerview({super.key});


  @override
  Widget build(BuildContext context) {

Get.lazyPut(()=>OfferviewControllerImp(),fenix: true);
     
   FavoriteControllerImp controllerfav=Get.put(FavoriteControllerImp());
    return Container(
      padding:const EdgeInsets.all(10),
      child: GetBuilder<OfferviewControllerImp>(builder: (controller)=>
      HandlingDataView(statusRequest:controller.statusRequest, widget:    ListView(
        children: [
       CustomAppBar(
                          mycontroller: controller.search! ,
                          onChanged: (val){
                            controller.checksearch(val);
                          },
                          title:"6".tr ,  onPressedSearsh: () { controller.onsearchItems(); },onPressednotifcation: () { 
                            Get.toNamed(Approute.notification);
                           },), 
      controller.isSearch?ListItemsSearch(modelitemssearch:controller.listdatasearch):
                 GridView.builder(
        itemCount: controller.offerdata.length,
        //نستعملها من يكون عدنا اكثر من لست وحد ببطن الثانية
      shrinkWrap: true, 
      physics: const NeverScrollableScrollPhysics(), 
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.6), 
      itemBuilder:(BuildContext context,index){
controllerfav.isFavorite[
  controller.offerdata[index].itemsId]=controller.offerdata[index].favorite;
  
        return   Gridviewofferscostum(itemsModel:controller.offerdata[index],
        fav:controller.offerdata[index].favorite.toString(),);
      })
       ]))));
      
    
  
  }

}