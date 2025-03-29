import 'package:flutter/material.dart';
import 'package:store313/core/constantk/color.dart';

class Custombuttomcart extends StatelessWidget {
  final String title;
  final void Function()? onPressedk;
  const Custombuttomcart({super.key, required this.title, this.onPressedk});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
         color: AppColor.maincolor,
   
        borderRadius: BorderRadius.circular(10)
      ),
   //   padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
         margin: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
      width: double.infinity,
      child: MaterialButton(
       textColor: Colors.white,
        minWidth: double.infinity,
     
        onPressed:onPressedk,
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
