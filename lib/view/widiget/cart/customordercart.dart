import 'package:flutter/material.dart';
import 'package:store313/core/constantk/color.dart';
import 'package:store313/core/constantk/imagesasset.dart';

class Customordercart extends StatelessWidget {
  final String title;
  final String price;
 final String count;
  final void Function()? onPressedk;
  const Customordercart({super.key, required this.title, this.onPressedk, required this.price, required this.count});
  @override
  Widget build(BuildContext context) {
    return      Card(
      
      child: Row(children: [
      Expanded(
        flex: 2,
        child:Image.asset(AppImagesasset.Logo,height: 100,fit: BoxFit.cover,)),
       Expanded(
        flex: 3,
        child:ListTile(
          title :Text(title,style: const TextStyle(fontSize: 17),),
          subtitle:Text("$price\$",style: const TextStyle(fontFamily: "snas",color:AppColor.maincolor,fontSize: 17 ),) ,)),
      Expanded(child:
      Container(
        alignment: Alignment.centerRight,
        child:  Column(children: [
          const SizedBox(
            height: 35,
            child:  Icon(
              Icons.add),
          ),
          SizedBox(
            height: 30,
            child: Text(count,style: const TextStyle(fontFamily: "sans"),)),
              const SizedBox(
            height: 25,
            child: Icon(
              Icons.remove),
          )],),
      )),
      const SizedBox(width: 10,)
      
     ],));
  }
}
