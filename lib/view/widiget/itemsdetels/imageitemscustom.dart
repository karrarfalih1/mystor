
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/itemsdetels_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/linkapi.dart';

class Imageitemscustom  extends GetView<ItemsdetelsControllerImp>{
  const Imageitemscustom({Key?key});
  @override
  Widget build(BuildContext context){
    return   Stack(
      clipBehavior:Clip.none ,
      children: [
         Container(
          height: 170,
          width: double.infinity,
          decoration:const BoxDecoration(
            borderRadius: BorderRadius.vertical(bottom: Radius.circular(40)),
            color: AppColor.maincolor
          ),
        ),
        Positioned(
          top: 20,
          right: 20,
          left: 20,
          child: Hero(
            tag: "${controller.itemsModel.itemsId!}image",
            child: CachedNetworkImage(
              fit: BoxFit.contain,
              height: 250,
              imageUrl:"${ Applink.imagesitems}/${controller.itemsModel.itemsImage}",),
          ),
        )
     ],);
   
  }


}
