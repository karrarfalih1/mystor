import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/orders/archiveorder_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
import 'package:store313/view/widiget/orders/archiveorderlist.dart';

class Archive extends StatelessWidget{
  const Archive({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ArchiveorderController());
   return Scaffold(

    appBar:AppBar(title:const Text("Orders"),) ,
    body: Container(
      padding:const EdgeInsets.all(15),
      child:GetBuilder<ArchiveorderController>(builder: (controller)=>
     HandlingDataView(statusRequest: controller.statusRequest, widget:  ListView.builder(
        itemCount: controller.data.length,
        itemBuilder: (context,index){
        return Archiveorderlist(pendtingModel: controller.data[index]);
      }))
     )
    ),
   );
  }

}
