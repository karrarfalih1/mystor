import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/controller/home/homescreen_controller.dart';
import 'package:store313/core/constantk/color.dart';

class Bootumappbarcastom extends GetView<HomeScreenControllerImp> {
  bool active=false;
  final IconData icon;
  final void Function()? onPressed;
   Bootumappbarcastom({super.key,this.onPressed ,required this.icon,required this.active});
  @override
  Widget build(BuildContext context) {
    return  SizedBox(
    width: 70,
    child: MaterialButton(
      onPressed:onPressed,
      child:Icon(icon,size: 25, color: active==true? AppColor.maincolor:Colors.black87),),
  );
  }
}
