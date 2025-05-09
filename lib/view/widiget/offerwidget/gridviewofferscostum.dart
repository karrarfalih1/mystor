import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/favorite_controller.dart';
import 'package:store313/controller/offerview_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/constantk/imagesasset.dart';
import 'package:store313/data/model/itemsmodel.dart';
import 'package:store313/linkapi.dart';
import 'dart:math' as math;
class Gridviewofferscostum extends GetView<OfferviewControllerImp> {

  final ItemsModel itemsModel;
 
  final String? fav;
   const  Gridviewofferscostum({super.key, required this.itemsModel,required this.fav});
  @override
  Widget build(BuildContext context) {
  
       return InkWell(
        onTap: () {
          controller.goToItemsDeletes(itemsModel);
        },
        child: Card(
          child: Stack(
            children: [
              Padding(
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
              //  const SizedBox(height: 10,),
   
          
                 const Spacer(),
                 Row(children: [
                   const SizedBox(width: 5,),
                  Column(
                    children: [
                    
                      Text("${itemsModel.itemspricediscount} IQD",style: const TextStyle(color: AppColor.maincolor,fontFamily: "sans",fontWeight: FontWeight.bold),),
                 
           if("${itemsModel.itemsDiscount}" !="0")
           Stack(
                           children: [
                            Text("${itemsModel.itemsPrice} IQD",
                            style: const TextStyle(color: AppColor.grey,fontFamily: "sans",fontWeight: FontWeight.bold),),
           
          
            Positioned(
              top: 7,
              child: Transform.rotate(
              angle: -15 * (math.pi / 180), // تحويل 15 درجة إلى راديان
              child: Container(
                width: 40,
                height: 2,
                color: AppColor.maincolor,
              
              ),
                         // تحويل 15 درجة إلى راديان
                     ),
            )  ,      
                           ],
                         ),
                       
                      ],
                  ),
                  const Spacer(),
         GetBuilder<FavoriteControllerImp>(builder: (controllerf)=>
               IconButton(
                    color: AppColor.maincolor,
                    iconSize: 30,
                    onPressed:(){
              
                      if(controllerf.isFavorite[itemsModel.itemsId]==1){
                        controllerf.setFavorite(itemsModel.itemsId, 0);
                        controllerf.deletFav( itemsModel.itemsId.toString());
                      }else{
                           controllerf.setFavorite(itemsModel.itemsId,1);
                            controllerf.addFav( itemsModel.itemsId.toString());
                      }
                      
                    }
                   , icon: Icon( controllerf.isFavorite[itemsModel.itemsId]==0? Icons.favorite_outline: Icons.favorite
                  
                   ),),),
                  const SizedBox(width: 5,),
                  
              
                 ],)
              
                ],),
              
              ),
       if("${itemsModel.itemsDiscount}" !="0")
              Positioned(
                top: 5,

                child: Image.asset(AppImagesasset.sale,width: 40,))
            ],
          ),


        ),

      );
      
  }
}
