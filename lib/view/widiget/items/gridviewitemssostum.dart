import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/items_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/data/model/itemsmodel.dart';
import 'package:store313/linkapi.dart';

class GridViewItemsCostum extends GetView<ItemsControllerImp> {
  final ItemsModel itemsModel;
  final void Function()? onpressedfavorite;
    const GridViewItemsCostum({super.key, this.onpressedfavorite, required this.itemsModel});
  @override
  Widget build(BuildContext context) {
  
       return InkWell(
        onTap: () {
          controller.goToItemsDeletes(itemsModel);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Hero(
              tag:"${itemsModel.itemsId!}image",
              child: CachedNetworkImage(
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl:"${Applink.imagesitems}/${itemsModel.itemsImage}"),
            ),
          
            Text('${itemsModel.itemsName}',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            const SizedBox(height: 10,),
            Container(
            alignment: Alignment.bottomCenter ,
              height: 18,
              child: Row(
               
                children: [
                         
                const Text("Rating 3.6",style: TextStyle(fontSize: 12),),
                const Spacer(),
                ...List.generate(
              
                  5, (index)=>const Icon(Icons.star,size: 12,)
                  )
              
              ],),
            ),
             const Spacer(),
             Row(children: [
               const SizedBox(width: 5,),
              Text("${itemsModel.itemsPrice}\$",style: const TextStyle(color: AppColor.maincolor,fontFamily: "sans",fontWeight: FontWeight.bold),),
              const Spacer(),
              IconButton(onPressed:onpressedfavorite
               , icon: const Icon(Icons.favorite_outline),),
              const SizedBox(width: 5,)

             ],)

            ],),
          
          ),


        ),

      );
      
  }
}
