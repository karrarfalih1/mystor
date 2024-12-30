import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/favorite_screen_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/data/model/favoritemodel.dart';
import 'package:store313/linkapi.dart';

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
              Text("${favoriteModel.itemsPrice}\$",style: const TextStyle(color: AppColor.maincolor,fontFamily: "sans",fontWeight: FontWeight.bold),),
              const Spacer(),
             
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
