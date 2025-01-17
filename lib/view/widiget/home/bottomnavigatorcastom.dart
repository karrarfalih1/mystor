import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/homescreen_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/view/widiget/home/bootumappbarcastom.dart';

class Bottomnavigatorcastom extends GetView<HomeScreenControllerImp> {
  
  const Bottomnavigatorcastom({super.key});
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
  color: AppColor.maincolorm1,
  shape: const CircularNotchedRectangle(),
  notchMargin: 10,
  height: 55,
  
  child: Row(children: [
    ...List.generate(controller.listwidget.length+1, (index){
      int i=index >2?index-1:index;
      return   index==2?const Spacer():
      
 Bootumappbarcastom(
 icon: controller.infoBootumAppBar[i],
 onPressed: (){
  controller.changePage(i);
 },active: controller.curentpage==i?true:false,);
 
    }
  
     )


],),);
  }
}
