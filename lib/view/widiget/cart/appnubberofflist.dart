import 'package:flutter/material.dart';
import 'package:store313/core/constantk/color.dart';

class Appnubberofflist extends StatelessWidget {
  final String title;
  const Appnubberofflist({super.key, required this.title, });
  @override
  Widget build(BuildContext context) {
    return      Container(
      margin: const EdgeInsets.symmetric(horizontal: 20),
      width: double.infinity,
     padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: AppColor.maincolorm1,
        borderRadius: BorderRadius.circular(13)
      ),
      child:  Center(child: Text(title)),
     );
  }
}
