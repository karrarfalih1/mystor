import 'package:flutter/material.dart';
import 'package:store313/core/constantk/color.dart';

class Custombouttomcoupon extends StatelessWidget {
  final String title;
  final void Function()? onPressedk;
  const Custombouttomcoupon({super.key, required this.title, this.onPressedk});
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
             color: AppColor.maincolor,
        borderRadius: BorderRadius.circular(10)
      ),
 
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
