
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_view.dart';
import 'package:store313/controller/items_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/linkapi.dart';

class Abbimageandtitle extends GetView<ItemsControllerImp> {

  
  const Abbimageandtitle( {super.key,});
  @override
  Widget build(BuildContext context) {
    return   Container(
          height: 100,
          width: double.infinity,
          decoration:const BoxDecoration(
            gradient:LinearGradient(
              colors: [
              AppColor.maincolor,
            
      
                        
              AppColor.maincolorm1
            ]) ,
      
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(20),bottomRight: Radius.circular(20)),
          ),
          child: Row(
            
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              
          const    Text("مطعم ",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),)
            ,
              Center(
                child: Container(
                  padding:const EdgeInsets.all(3),
                  width: 100,
                  child: ClipRRect(
                     borderRadius: BorderRadius.circular(40),
                  child:Hero(tag: "${controller.categoriesid}", child: 
                  CachedNetworkImage(imageUrl: "${Applink.imagescatigores}/${controller.categoryimage}",fit:BoxFit.cover)) ,
                  ),
                ),
              ),
            
              Text("${controller.categoryname}",style:const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
            ],
          ),
      
        );
  }}