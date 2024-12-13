

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/test_controller.dart';
import 'package:store313/core/classk/handlingdataview.dart';

class  TestView extends StatelessWidget {
  const TestView({super.key});

  @override
  Widget build(BuildContext context) {
Get.put(TestController());
  return MaterialApp(

home:  Scaffold(
  appBar: AppBar(title:const Text("test"),),
  body:GetBuilder<TestController>(builder: (controller){
    return
HandlingDataView(statusRequest: controller.statusRequest,
widget: ListView.builder(
      itemCount: controller.data.length,
      itemBuilder: (context,indext){
       return Text("${controller.data}");
      }),);
  }
  )
),
  );
  }

}