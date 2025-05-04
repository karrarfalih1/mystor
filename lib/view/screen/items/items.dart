
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/favorite_controller.dart';
import 'package:store313/controller/items_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
import 'package:store313/data/model/itemsmodel.dart';
import 'package:store313/view/screen/home/home.dart';
import 'package:store313/view/widiget/items/abbimageandtitle.dart';
import 'package:store313/view/widiget/items/gridviewitemssostum.dart';
class ItemsHome extends StatelessWidget {
 
  const ItemsHome({super.key});
  @override
  Widget build(BuildContext context){
   Get.put(ItemsControllerImp());
   FavoriteControllerImp controllerfav=Get.put(FavoriteControllerImp());
    return Scaffold(
    body: SafeArea(
      child: SizedBox(
      
        child:GetBuilder<ItemsControllerImp>(builder: (controller)=>
       Column(
      
        children: [
     const Abbimageandtitle(),
          const SizedBox(height: 15,),
            
            HandlingDataView(statusRequest:controller.statusRequest, widget: 
            controller.isSearch?ListItemsSearch(modelitemssearch:controller.listdatasearch):
                   Expanded(
                     child: Container(
                      padding: EdgeInsets.all(15),
                       child: GridView.builder(
                               itemCount: controller.data.length,
                               //نستعملها من يكون عدنا اكثر من لست وحد ببطن الثانية
                            
                               gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.6), 
                             itemBuilder:(BuildContext context,index){
                       controllerfav.isFavorite[
                         controller.data[index]['items_id']]=controller.data[index]['favorite'];
                         
                               return  GridViewItemsCostum(itemsModel: ItemsModel.fromJson(controller.data[index]), 
                               fav: controller.data[index]["favorite"].toString(),);
                             }),
                     ),
                   )
       
          ,
        
       
      )],),)),
    )
    );
    
  }
}
