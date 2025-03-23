import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/constantk/imagesasset.dart';
import 'package:store313/linkapi.dart';

class Customordercart extends StatelessWidget {
  final String title;
  final String price;
 final String count;
 final String  imagpahth;
 final void Function()? onAdd;
  final void Function()? ondelet;
  const Customordercart({super.key, required this.title,required this.ondelet, required this.price, required this.count, required this.imagpahth,required this.onAdd});
  @override
  Widget build(BuildContext context) {
    return      Card(
      
      child: Row(children: [
      Expanded(
        flex: 2,
        child:CachedNetworkImage(imageUrl: "${Applink.imagesitems}/${imagpahth}",fit:BoxFit.cover,height: 100,)),
       Expanded(
        flex: 3,
        child:ListTile(
          title :Text(title,style: const TextStyle(fontSize: 17),),
          subtitle:Text("$price\$",style: const TextStyle(fontFamily: "snas",color:AppColor.maincolor,fontSize: 17 ),) ,)),
      Expanded(child:
      Container(
        alignment: Alignment.centerRight,
        child:  Column(children: [
           SizedBox(
            height: 35,
            child:  IconButton(
              onPressed: onAdd,
              icon:const Icon(Icons.add)
             ),
          ),
          SizedBox(
            height: 30,
            child: Text(count,style: const TextStyle(fontFamily: "sans"),)),
               SizedBox(
            height: 25,
            child: IconButton(
              onPressed: ondelet,
              icon:const Icon(Icons.remove)
             ),
          )],),
      )),
      const SizedBox(width: 10,)
      
     ],));
  }
}
