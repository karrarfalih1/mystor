import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:store313/core/constantk/color.dart';

class Carddeliverytype extends StatelessWidget{
  final String title;
 final bool isActive;
 final String lottie;
 final void Function()? ontap;
  const Carddeliverytype({super.key,required this.title,required this.isActive, required this.lottie,required this.ontap});

  @override
  Widget build(BuildContext context) {
    return
    InkWell(
      onTap: ontap,
      child: Container(
        height: 100,
        width: 100,
        decoration:BoxDecoration(
          color:isActive? AppColor.maincolor:null,
          border: Border.all(color: AppColor.maincolor),
          borderRadius: BorderRadius.circular(10)
        ),
      child:Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(lottie,width: 60,),
         const SizedBox(height: 10,),
          Text(title,style:  TextStyle(color:isActive? Colors.white:AppColor.maincolor,fontWeight: FontWeight.bold),)
      
      ],),
      ),
    );
  }

}