import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/items_controller.dart';
import 'package:store313/controller/itemsdetels_controller.dart';
import 'package:store313/core/constantk/color.dart';

class Subitemsdetels extends GetView<ItemsdetelsControllerImp> {
 
  const Subitemsdetels({super.key});
  @override
  Widget build(BuildContext context) {
    return  Row(children: [

        ...List.generate(controller.subitemscolors.length, (index)=>
        Container(
            margin:EdgeInsets.only(
              right: controller.lang=="en"?10:0,
              left:  controller.lang=="ar"?10:0
            ),
          alignment: Alignment.center,
          height: 60,width: 80,
        decoration: BoxDecoration(
          color: controller.subitemscolors[index]["active"]=="1"? AppColor.maincolorblue :Colors.white,
          border: Border.all(color: AppColor.maincolorblue),
          borderRadius: BorderRadius.circular(10)
        
        ),
        child: Text(controller.subitemscolors[index]["name"],style: TextStyle(color: controller.subitemscolors[index]["active"]=="1"?Colors.white:Colors.black,fontWeight: FontWeight.bold),
        )),
        ),
      ],);
  }
}
