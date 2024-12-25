// اول صفحة ومن خلالها احدد اللغة

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/localizationk/changelocal.dart';
import 'package:store313/linkapi.dart';
import 'package:store313/view/widiget/castomappbar.dart';
import 'package:store313/view/widiget/home/categoreshomewidiget.dart';
import 'package:store313/view/widiget/home/cuostomitemslisthome.dart';
import 'package:store313/view/widiget/home/customcardhome.dart';
import 'package:store313/view/widiget/home/customtitlehome.dart';

class Homepage extends GetView<LocaleController> {
  const Homepage({super.key});

  @override
  Widget build(BuildContext context) {
Get.put(HomeControllerImp());

    return GetBuilder<HomeControllerImp>(builder: (controller)=>
        HandlingDataView(statusRequest:controller.statusRequest, widget: 
        Container(
          padding: const EdgeInsets.symmetric(horizontal: 15),
      child: ListView(
        children: [
           CustomAppBar(title:"6".tr ,onPressednotifcation: () {  }, onPressedSearsh: () {  },),
           const Customcardhome(titlecard: 'A winer suprise', subtitlecard: 'Cashback20%',),
            const Customtitlehome(title: 'Categores'),
       
            const ListCategorieshome(),
         
           const Customtitlehome(title: 'Product for you'),
         
           const CustomListItemsHome(),
           const Customtitlehome(title: 'Offer'),
          
           const CustomListItemsHome()
        ],
      ),
    )));
  }
}
