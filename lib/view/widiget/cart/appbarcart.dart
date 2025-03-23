import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_core/src/get_main.dart';

class Appbarcart extends StatelessWidget {
  
  const Appbarcart({super.key,});
  @override
  Widget build(BuildContext context) {
    return    SizedBox(child: Row(children: [
        Expanded(child: Container(
     alignment: Alignment.centerLeft,
          child:  IconButton(
            onPressed: (){
              Get.back();
            },
icon:const Icon( Icons.arrow_back_sharp)
           ))),
         Expanded(child: Container(
          alignment: Alignment.center,
          child:const Text("My Cart",style: TextStyle(fontSize: 20),))),
        const Expanded(child: Text(""))
      ],),);
  }
}
