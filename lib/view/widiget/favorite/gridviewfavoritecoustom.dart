import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/favorite_screen_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/data/model/favoritemodel.dart';
import 'package:store313/linkapi.dart';

import 'dart:math' as math;
class Gridviewfavoritecoustom extends GetView<FavoriteScreenControllerImp> {
  final FavoriteModel favoriteModel;
  final void Function()? onpressedfavorite;
    const Gridviewfavoritecoustom({super.key, this.onpressedfavorite, required this.favoriteModel});
  @override
  Widget build(BuildContext context) {
    //  FavoriteControllerImp controller =Get.put(FavoriteControllerImp());
       return 
        InkWell(
        onTap: () {
        //  controller.goToItemsDeletes(itemsModel);
        },
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(10),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
            Hero(
              tag:"${favoriteModel.itemsId!}image",
              child: CachedNetworkImage(
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
                imageUrl:"${Applink.imagesitems}/${favoriteModel.itemsImage}"),
            ),
          
            Text('${favoriteModel.itemsName}',style: const TextStyle(fontSize: 15,fontWeight: FontWeight.bold),textAlign: TextAlign.center,),
            const SizedBox(height: 10,),
     
             const Spacer(),
             Row(children: [
        Column(
                    children: [
                     
                          Text("${favoriteModel.itemsPrice} IQD",style: const TextStyle(color: AppColor.maincolor,fontFamily: "sans",fontWeight: FontWeight.bold),),
                 
                        if("${favoriteModel.itemsDiscount}" !="0")               Stack(
                           children: [
                            Text("${ int.parse(favoriteModel.itemsPrice.toString())  -int.parse(favoriteModel.itemsPrice.toString()) *int.parse(favoriteModel.itemsDiscount.toString()) /100 } IQD",
                            style: const TextStyle(color: AppColor.grey,fontFamily: "sans",fontWeight: FontWeight.bold),),
           
          
            Positioned(
              top: 7,
              child: Transform.rotate(
              angle: -15 * (math.pi / 180), // تحويل 15 درجة إلى راديان
              child: Container(
                width: 40,
                height: 2,
                color: AppColor.maincolor,
                child:const Center(child: Text("مائل", style: TextStyle(color: Colors.white))),
              ),
                         // تحويل 15 درجة إلى راديان
                     ),
            )  ,      
                           ],
                         ),
                       
                      ],
                  ),   const Spacer(),
             
           IconButton(
                color: AppColor.maincolor,
                iconSize: 30,
                onPressed:(){
 controller.deletFavs(favoriteModel.favoriteId.toString());
              
                }
               , icon:const Icon( Icons.delete_outline_outlined
               ),),
              const SizedBox(width: 5,),

             ],)

            ],),
          
          ), ),

      );
    
      
  }
}
