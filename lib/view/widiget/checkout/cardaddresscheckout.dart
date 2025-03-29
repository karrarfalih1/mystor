import 'package:flutter/material.dart';
import 'package:store313/core/constantk/color.dart';

class Cardaddresscheckout extends StatelessWidget{
  final String title;
 final bool isActive;
 final String subtitle;
 final void Function() ontap;
  const Cardaddresscheckout({super.key,required this.title,required this.isActive, required this.subtitle, required this.ontap});

  @override
  Widget build(BuildContext context) {
    return
InkWell(
  onTap:ontap,
  child: Card(
    color:isActive? AppColor.maincolor:null,
    shape:RoundedRectangleBorder(
    borderRadius: BorderRadius.circular(10),
    
  ),
  child: ListTile(
    title: Text(title,style: TextStyle(color:isActive? Colors.white:AppColor.maincolor),),
    subtitle: Text(subtitle,style: TextStyle(color:isActive? Colors.white:AppColor.maincolor)),
  ),
  ),
);
  }

}