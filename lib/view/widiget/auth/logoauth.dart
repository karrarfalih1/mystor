
import 'package:flutter/material.dart';
import 'package:store313/core/constantk/imagesasset.dart';

class CustomLogoAuth extends StatelessWidget {
  
  const CustomLogoAuth({super.key,});
  @override
  Widget build(BuildContext context) {
    return Image.asset(AppImagesasset.Logo,width: 80,height: 80,);
  
  }
}