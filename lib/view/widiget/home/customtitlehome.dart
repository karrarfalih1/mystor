import 'package:flutter/material.dart';

class Customtitlehome extends StatelessWidget {
  final String title;
  const Customtitlehome({super.key, required this.title,});
  @override
  Widget build(BuildContext context) {
    return   Container(
      margin:const EdgeInsets.symmetric(vertical: 10),
      child: Text(title,style: const TextStyle(fontSize: 20,fontWeight: FontWeight.bold),));
  }
}
