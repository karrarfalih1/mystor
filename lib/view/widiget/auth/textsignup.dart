
import 'package:flutter/material.dart';
import 'package:store313/core/constantk/color.dart';

class TextSignUpAndSignIn extends StatelessWidget {
  final String title;
    final String title2;
  final void Function()? onTap;
  const TextSignUpAndSignIn({super.key, required this.title, this.onTap, required this.title2});
  @override
  Widget build(BuildContext context) {
    return   
  Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children:[ Text(title2),
  InkWell(
    onTap:onTap ,

    child: Text(title,style: const TextStyle(color: AppColor.maincolor,fontWeight: FontWeight.bold),),)] );
  }
}