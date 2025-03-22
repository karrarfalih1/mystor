import 'package:flutter/material.dart';
import 'package:store313/core/constantk/color.dart';

class Custombuttomcart extends StatelessWidget {
  final String title;
  final void Function()? onPressedk;
  const Custombuttomcart({super.key, required this.title, this.onPressedk});
  @override
  Widget build(BuildContext context) {
    return Container(
   //   padding:const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
       color: AppColor.maincolor,
      margin: const EdgeInsets.symmetric(horizontal: 35,vertical: 10),
      width: double.infinity,
      child: MaterialButton(
       textColor: Colors.white,
        minWidth: double.infinity,
        color: Colors.blue,
        onPressed:onPressedk,
        child: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}
