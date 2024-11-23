
import 'package:flutter/material.dart';
import 'package:store313/core/constantk/color.dart';

class CustomButtomAuth extends StatelessWidget {
  final String textbuttom;
 final void Function()? onPressed;
 const  CustomButtomAuth({super.key, required this.textbuttom,required this.onPressed});
  @override
  Widget build(BuildContext context) {
    return   
Container(
  margin:const EdgeInsets.only(top: 10),
  child: MaterialButton(
    textColor: Colors.white,
    //لعمل ريديوس
    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
    padding:const EdgeInsets.symmetric(vertical: 10),
    color:AppColor.maincolor,
    onPressed: onPressed,
  child: Text(textbuttom,style:const TextStyle(fontSize: 16),),),
);
    
  }
}