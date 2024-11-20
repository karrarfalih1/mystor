
import 'package:flutter/material.dart';

class Customtextfeld extends StatelessWidget {
  final String title;
  final void Function()? onPressedk;
  const Customtextfeld({super.key, required this.title, this.onPressedk});
  @override
  Widget build(BuildContext context) {
    return TextFormField(
decoration: InputDecoration(
  hintStyle: const TextStyle(fontSize: 14),
  hintText: "Enter your email",
  //يجعل اللليبل ثابت في الالى دائما
floatingLabelBehavior: FloatingLabelBehavior.always,
suffixIcon: const Icon(Icons.email_outlined),
  label: Container(margin: const EdgeInsets.symmetric(horizontal: 9),child: const Text("Email")),
  contentPadding:const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
  border: OutlineInputBorder(
    
    borderRadius: BorderRadius.circular(16)
  )
),
);
  }
}