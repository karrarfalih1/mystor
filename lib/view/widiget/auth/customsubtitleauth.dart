
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:store313/core/constantk/color.dart';

class CustomTextSubTitleAuth extends StatelessWidget {
  final String subtitle;
  const CustomTextSubTitleAuth({super.key, required this.subtitle});
  @override
  Widget build(BuildContext context) {
    return   
  Container(
    margin:const EdgeInsets.symmetric(horizontal: 20),
    child: Text(subtitle.tr,style: Theme.of(context).textTheme.titleSmall!.copyWith(color:AppColor.grey ),
    textAlign: TextAlign.center,));
    
  }
}