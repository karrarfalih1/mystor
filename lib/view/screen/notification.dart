import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:jiffy/jiffy.dart';
import 'package:store313/controller/notification_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';

class Notification extends StatelessWidget
{
  const Notification({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationController());
   return Scaffold(
    appBar: AppBar(title:const Text("Notification"),),
    body: GetBuilder<NotificationController>(builder:(controller)=>
    HandlingDataView(statusRequest:controller.statusRequest , widget:
    Container(child: ListView.builder(
      itemCount: controller.data.length,
      itemBuilder:(context,index){
      return 
        Container(
         
         
          padding:const EdgeInsets.symmetric(vertical: 3,horizontal: 10),
        child: Card(child: ListTile(title: Text("${controller.data[index]['notification_title']}"),
        subtitle: Text("${controller.data[index]['notification_bady']}",style: TextStyle(fontSize: 12),),
        trailing:   Container(
        
          child: Text(Jiffy.parse('${controller.data[index]['notification_time']}').fromNow(),style:TextStyle(color: Colors.grey[650]),)),
        
        
        ))
        ,);
      
    }),)
    )),
   );
  }
  
}