
import 'package:flutter/material.dart';
import 'package:store313/core/constantk/color.dart';

class Pricecostom extends StatelessWidget{
  final Function()? onpressedplus;
   final Function()? onpressedmains;
   final String? price;
   final String? count;
  const Pricecostom({Key?key,required this.onpressedplus,required this.onpressedmains,required this.price,required this.count});
  @override
  Widget build(BuildContext context) {
   return   Row(children: [
      
      Row(children: [
        IconButton(onPressed: onpressedmains, icon:const Icon(Icons.remove)),
        Container(
          padding: EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            border: Border.all(
              color: Colors.black
            )
          ),
          child: Text("$count",style:TextStyle(fontSize: 18,fontFamily: "sanse"))),
         IconButton(onPressed: onpressedplus, icon:const Icon(Icons.add))

      ],),
      Spacer(),
      Text("${price}\$",style:TextStyle(color: AppColor.maincolor,fontSize: 18,fontFamily: "sanse"),)
,
SizedBox(width: 10,)
    ],);
  }

}