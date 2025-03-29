import 'package:flutter/material.dart';
import 'package:store313/core/constantk/color.dart';

class Cardpaymentmethod extends StatelessWidget{
  final String title;
 final bool isActive;
 final void Function()? ontap;
  const Cardpaymentmethod({super.key,required this.title,required this.isActive, this.ontap});

  @override
  Widget build(BuildContext context) {
    return
InkWell(
  onTap:ontap,
  child: Container(
      margin:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
      padding:const EdgeInsets.symmetric(horizontal: 10,vertical: 10),
  decoration: BoxDecoration(
    color:isActive? AppColor.maincolor:AppColor.maincolorm1,
    borderRadius: BorderRadius.circular(20)
  ),
      child: Text(title,
      
      style: TextStyle(fontWeight: FontWeight.bold,
      height: 1,
      color:isActive? Colors.white:Colors.grey[900]),
      ) ,),
);
  }

}