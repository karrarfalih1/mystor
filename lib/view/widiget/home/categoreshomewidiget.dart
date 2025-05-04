
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/home_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/functionsk/translatdatabase.dart';
import 'package:store313/data/model/categoriesmodel.dart';
import 'package:store313/linkapi.dart';

class ListCategorieshome extends GetView<HomeControllerImp> {

  
  const ListCategorieshome( {super.key,});
  @override
  Widget build(BuildContext context) {
    return 

   SizedBox(
             
              height: 120,
              //من خلالها استطيع ان افصل بين عنصر وعنصر 
              child: ListView.separated(
                separatorBuilder: (BuildContext context, int index){
                return const SizedBox(width: 20,); },
              itemCount: controller.categories.length,
              scrollDirection: Axis.horizontal,
   
              itemBuilder:(context,int index){
              return Categories(
                i:index,
                categoriesmodel: Categoriesmodel.fromJson(controller.categories[index]),);
              }, ),);
 
  }
}
class Categories extends GetView<HomeControllerImp>{
  final Categoriesmodel categoriesmodel;
  final int? i;
  const Categories({super.key,required this.categoriesmodel,required this.i});
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap:(){
        controller.goToItems(
       controller.categories,i!,categoriesmodel.categoriesId.toString()
,categoriesmodel.categoriesImage.toString(),
categoriesmodel.categoriesName.toString()
        );
      },
      child: Column(children: [
        
                Container(
                padding:const EdgeInsets.symmetric(horizontal: 5,vertical: 5
                ),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                 // color:  AppColor.maincolorm1
                 gradient: const LinearGradient(colors:
                 [    AppColor.maincolor,
             
                  AppColor.maincolorm1,
                 ] 
                 
             

                 )
                ),
                height: 90,
                width: 90,
                //ملاحضة نستعمل هذا النوع من الصور لاننا نستطيع التلاعب بالوانه 
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: Hero(
                    tag: "${categoriesmodel.categoriesId}",
                    child: CachedNetworkImage(imageUrl: "${Applink.imagescatigores}/${categoriesmodel.categoriesImage}",fit:BoxFit.cover,height: 100,)))
     ,),
        Text("${translateDataBase(categoriesmodel.categoriesNameAr,categoriesmodel.categoriesName)}",style: const TextStyle(color: Colors.black),)
              ],),
    );
  }
}

