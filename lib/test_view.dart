

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/test_controller.dart';
import 'package:store313/core/classk/statusRequest.dart';

class  TestView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
Get.put(TestController());
  return MaterialApp(

home:  Scaffold(
  appBar: AppBar(title:const Text("test"),),
  body:GetBuilder<TestController>(builder: (controller){
    if(controller.statusRequest==StatusRequest.loading){
      return const Center(child: Text("Loading"),);
    }else if(controller.statusRequest==StatusRequest.offlinefailure){
      return const Center(child: Text("Offline"),);
    }else if(controller.statusRequest==StatusRequest.serverfailure){
      return const Center(child: Text("serverfailru"),);
  }else{
    return ListView.builder(
      itemCount: controller.data.length,
      itemBuilder: (context,indext){
       return Text("${controller.data}");
      });
  }}
  )
),
  );
  }

}