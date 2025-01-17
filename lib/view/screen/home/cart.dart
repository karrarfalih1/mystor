// اول صفحة ومن خلالها احدد اللغة

import 'package:flutter/material.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/constantk/imagesasset.dart';
import 'package:store313/test.dart';
class Cart extends StatelessWidget{

  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    
return Scaffold(
  bottomNavigationBar: Container(
    child: Column(
      mainAxisSize: MainAxisSize.min,
      children: [
      Text("karrar"),
    ],),
  ),
body: Container(
  
  padding:const EdgeInsets.all(10),
  child: ListView(
    children: [
      Container(child: Row(children: [
        Expanded(child: Container(
     alignment: Alignment.centerLeft,
          child: Icon(Icons.arrow_back_sharp))),
        Expanded(child: Text("My Cart",style: TextStyle(fontSize: 20),)),
        Expanded(child: Text(""))
      ],),),
     const SizedBox(height: 10,),
     Card(
      
      child: Row(children: [
      Expanded(
        flex: 2,
        child:Image.asset(AppImagesasset.Logo,height: 100,fit: BoxFit.cover,)),
      Expanded(
        flex: 3,
        child:ListTile(
          title :Text("Mac M1 Aer",style: TextStyle(fontSize: 17),),
          subtitle:Text("200.000\$",style: TextStyle(fontFamily: "snas",color:AppColor.maincolor,fontSize: 17 ),) ,)),
      Expanded(child:
      Container(
        alignment: Alignment.centerRight,
        child: Column(children: [
          Container(
            height: 35,
            child: Icon(
              Icons.add),
          ),
          Container(
            height: 30,
            child: Text("1",style: TextStyle(fontFamily: "sans"),)),
              Container(
            height: 25,
            child: Icon(
              Icons.remove),
          )],),
      )),
      SizedBox(width: 10,)
      
     ],))
    ],
  ),

),
);

  }}