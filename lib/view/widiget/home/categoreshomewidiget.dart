
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/data/model/categoriesmodel.dart';
import 'package:store313/linkapi.dart';

class ListCategorieshome extends GetView<HomeControllerImp> {
  
  
  const ListCategorieshome({super.key,});
  @override
  Widget build(BuildContext context) {
    return 
 SizedBox(
           
            height: 90,
            //من خلالها استطيع ان افصل بين عنصر وعنصر 
            child: ListView.separated(
              separatorBuilder: (BuildContext context, int index){
              return const SizedBox(width: 20,); },
            itemCount: controller.categories.length,
            scrollDirection: Axis.horizontal,

            itemBuilder:(context,int index){
            return Categories(categoriesmodel: Categoriesmodel.fromJson(controller.categories[index]),);
            }, ),);
  }
}





class Categories extends StatelessWidget{
  final Categoriesmodel categoriesmodel;

  const Categories({Key? key,required this.categoriesmodel});
  @override
  Widget build(BuildContext context) {
    return Column(children: [
              Container(
              padding:const EdgeInsets.symmetric(horizontal: 10
              ),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color:  AppColor.maincolorm1
              ),
              height: 70,
              width: 70,
              //ملاحضة نستعمل هذا النوع من الصور لاننا نستطيع التلاعب بالوانه 
              child:SvgPicture.network("${Applink.imagescatigores}/${categoriesmodel.categoriesImage}",
             colorFilter:const ColorFilter.mode(
    Colors.black,
    
    BlendMode.srcIn, // طريقة المزج
  ),)),
  Text("${categoriesmodel.categoriesName}",style: const TextStyle(color: Colors.black),)
            ],);
  }
}



