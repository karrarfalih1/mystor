import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:store313/controller/homescreen_controller.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/view/widiget/home/bootumappbarcastom.dart';
import 'package:store313/view/widiget/home/bottomnavigatorcastom.dart';

class HomeScreen extends StatelessWidget {
  
  const HomeScreen({super.key,});
  @override
  Widget build(BuildContext context) {
    Get.put(HomeScreenControllerImp());
    return  GetBuilder<HomeScreenControllerImp>(builder: (controller)=>
    Scaffold(
      floatingActionButton: FloatingActionButton(
        
       shape: const CircleBorder(),
        backgroundColor: AppColor.maincolor,
        onPressed: (){},child: const Icon(Icons.shopping_cart,),),

      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
  bottomNavigationBar: Bottomnavigatorcastom(),
      body: controller.listwidget.elementAt(controller.curentpage)

    ));
  }
}
