import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:store313/controller/home/favorite_controller.dart';
import 'package:store313/controller/items_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
import 'package:store313/data/model/itemsmodel.dart';
import 'package:store313/view/widiget/castomappbar.dart';
import 'package:store313/view/widiget/items/categoresitemcostum.dart';
import 'package:store313/view/widiget/items/gridviewitemssostum.dart';
class ItemsHome extends StatelessWidget {
 
  const ItemsHome({super.key});
  @override
  Widget build(BuildContext context){
   Get.put(ItemsControllerImp());
   FavoriteControllerImp controllerfav=Get.put(FavoriteControllerImp());
    return Scaffold(
    body: Container(
      padding:const EdgeInsets.all(15),
      child:GetBuilder<ItemsControllerImp>(builder: (controller)=>
     ListView(children: [
        CustomAppBar(title: 'Search ', onPressednotifcation: () {  }, onPressedSearsh: () {  },),
        const SizedBox(height: 15,),
        
        const ListCategoriesItems(),
          HandlingDataView(statusRequest:controller.statusRequest, widget: 
        GridView.builder(
        itemCount: controller.data.length,
        //نستعملها من يكون عدنا اكثر من لست وحد ببطن الثانية
      shrinkWrap: true, 
      physics: const NeverScrollableScrollPhysics(), 
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.6), 
      itemBuilder:(BuildContext context,index){
controllerfav.isFavorite[
  controller.data[index]['items_id']]=controller.data[index]['favorite'];
  
        return  GridViewItemsCostum(itemsModel: ItemsModel.fromJson(controller.data[index]), 
        fav: controller.data[index]["favorite"].toString(),);
      })
        ,
      
 
    )],),))
    );
    
  }
}
