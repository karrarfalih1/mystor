
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/items_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/data/model/categoriesmodel.dart';

class ListCategoriesItems extends GetView<ItemsControllerImp> {

  
  const ListCategoriesItems( {super.key,});
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
              return Categories(
              i:index,
                
                categoriesmodel: Categoriesmodel.fromJson(controller.categories[index]),);
              }, ),);
 
  }
}





class Categories extends GetView<ItemsControllerImp>{
  final Categoriesmodel categoriesmodel;
  final int? i;
  const Categories({Key? key,required this.categoriesmodel,required this.i});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ItemsControllerImp>(builder: (controller)=>
    InkWell(
      onTap:(){
        controller.changeCat(i!,categoriesmodel.categoriesId.toString());
   //     controller.getItems(categoriesmodel.categoriesId.toString());
    
      },
      child: Column(children: [
             
        Container(
         
          padding: const EdgeInsets.only(bottom: 10),
           decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            border: controller.selectedCat==i?  const Border(
              
              bottom: BorderSide(width: 3,color: AppColor.maincolor)
            ):null
           ),
          child: Text("${categoriesmodel.categoriesName}",style: const TextStyle(color: Colors.black,fontSize: 23),)),
              ],),
    ));
  }
}




