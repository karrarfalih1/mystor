import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/home_controller.dart';
import 'package:store313/data/model/itemsmodel.dart';
import 'package:store313/linkapi.dart';
import 'package:cached_network_image/cached_network_image.dart';
class CustomListItemsHome extends GetView<HomeControllerImp> {

  const CustomListItemsHome({super.key,});
  @override
  Widget build(BuildContext context) {
    
    return     SizedBox(
        
            height: 140,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: controller.items.length,
              itemBuilder:(context,index){
                return InkWell(
                  child: Items(itemsModel: ItemsModel.fromJson(controller.items[index]),));
 
            }),
           );
  }
}


class Items extends GetView<HomeControllerImp>{
  final ItemsModel itemsModel;
  const Items({super.key, required this.itemsModel });
  @override
  Widget build(BuildContext context) {
    HomeControllerImp controller=Get.find();
    return InkWell(
      onTap: (){
        controller.goToItemsDeletes(itemsModel);
      },
      child: Stack(children: [Container(
                    decoration: BoxDecoration(
                      // color: AppColor.maincolorm1,
                      borderRadius: BorderRadius.circular(20)
                    ),
                    margin:const EdgeInsets.symmetric(horizontal: 10),
      
                    padding:const EdgeInsets.symmetric(horizontal: 10),
                   
                  child:CachedNetworkImage(imageUrl:"${Applink.imagesitems}/${itemsModel.itemsImage}",height: 150,width: 150,fit: BoxFit.cover,) ,
                  ),
                  Container(
      
                    decoration: BoxDecoration(
                      color: Colors.black.withOpacity(0.4),
                      borderRadius: BorderRadius.circular(20)
                    ),
                    
                    height: 150,width: 170,),
                      controller.myServices.sharedPreferences.getString("lang")=="en"?
                     
                     Positioned(
                  left: 15,
                      child: Text("${itemsModel.itemsName}",style: const TextStyle(color: Colors.white),)):
                        Positioned(
                  right: 15,
                      child: Text("${itemsModel.itemsName}",style: const TextStyle(color: Colors.white),))
                  ],),
    );
  }

}