// اول صفحة ومن خلالها احدد اللغة

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/favorite_screen_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
import 'package:store313/data/model/favoritemodel.dart';
import 'package:store313/view/widiget/castomappbar.dart';
import 'package:store313/view/widiget/favorite/gridviewfavoritecoustom.dart';
class Favorite extends StatelessWidget{

  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    
  final controller= Get.lazyPut(()=> FavoriteScreenControllerImp(),fenix: true);
    return 
    Container(
      padding: EdgeInsets.all(10),
      child:     GetBuilder<FavoriteScreenControllerImp>(builder: (controller)=>
      ListView(
        children: [
               CustomAppBar(title:"6".tr ,onPressednotifcation: () {  }, onPressedSearsh: () {  },),
               SizedBox(height: 10,),

      HandlingDataView(statusRequest:controller.statusRequest, widget: 
     GridView.builder(
       itemCount: controller.data.length,
        //نستعملها من يكون عدنا اكثر من لست وحد ببطن الثانية
      shrinkWrap: true, 
      physics: const NeverScrollableScrollPhysics(), 
        gridDelegate:const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,childAspectRatio: 0.6), 
      itemBuilder:( context,index){
        return Gridviewfavoritecoustom(favoriteModel:controller.data[index]);}) ,) ],
      ))
    )
    ;

  }}