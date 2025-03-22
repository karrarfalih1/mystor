

 import 'package:flutter/material.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/view/widiget/cart/buttomorder.dart';

class Custombottomnavigationpar  extends StatelessWidget{
  final String totalprice;
  final String  price;
  final String shapping;
  const Custombottomnavigationpar({super.key, required this.totalprice, required this.price, required this.shapping});

  @override
  Widget build(BuildContext context) {
   return SizedBox(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
         Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Container(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: const Text("Price",style: TextStyle(fontSize: 18),),),
  Container(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child:  Text(price,style: TextStyle(fontSize: 18,fontFamily: "snas"),),),
       
      ],)
        ,
         Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Container(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: const Text("Shapping",style: TextStyle(fontSize: 18),),),
  Container(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child:  Text(shapping,style: TextStyle(fontSize: 18,fontFamily: "snas"),),),
       
      ],)
        ,
        const Padding
        (padding: EdgeInsets.symmetric(horizontal: 10),
          child: Divider()),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
        Container(
          
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child: const Text("Total Price",style: TextStyle(fontSize: 18,color: AppColor.maincolor,fontWeight: FontWeight.bold),),),
  Container(
  padding: const EdgeInsets.symmetric(horizontal: 16),
  child:  Text(totalprice,style: TextStyle(fontSize: 18,fontFamily: "snas",color: AppColor.maincolor,fontWeight: FontWeight.bold),),),
       
      ],)

, const SizedBox(height: 10,),
        const Custombuttomcart(title: 'Place Order'),
      
     
    ],),
  );
  }

}