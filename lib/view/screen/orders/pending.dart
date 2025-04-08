import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/orders/pending_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';
import 'package:store313/view/widiget/orders/cardorderlist.dart';

class Pending extends StatelessWidget{
  const Pending({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(PendingController());
   return Scaffold(

    appBar:AppBar(title:const Text("Orders"),) ,
    body: Container(
      padding:const EdgeInsets.all(15),
      child:GetBuilder<PendingController>(builder: (controller)=>
     HandlingDataView(statusRequest: controller.statusRequest, widget:  ListView.builder(
        itemCount: controller.data.length,
        itemBuilder: (context,index){
        return CardOrderList(pendtingModel: controller.data[index]);
      }))
     )
    ),
   );
  }

}
