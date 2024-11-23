import 'package:flutter/material.dart';

class CustombuttomLang extends StatelessWidget {
  final String title;
  final void Function()? onPressedk;
  const CustombuttomLang({super.key, required this.title, this.onPressedk});
  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.amber,
      padding: const EdgeInsets.symmetric(horizontal: 50),
      //width: double.infinity,
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
