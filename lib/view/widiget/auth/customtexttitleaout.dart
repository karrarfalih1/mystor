
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class CustomTextTitleAuth extends StatelessWidget {
  final String title;
  const CustomTextTitleAuth({super.key, required this.title});
  @override
  Widget build(BuildContext context) {
    return   Container(
      alignment: Alignment.center,
      child: Text(title.tr,style: Theme.of(context).textTheme.headlineMedium,));
  }
}