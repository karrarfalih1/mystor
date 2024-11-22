
import 'package:flutter/material.dart';
class Customtextfeld extends StatelessWidget {
  final String hintText;
  final String labeltext;
  final  IconData  iconss;
  TextInputType? keyboardType;
  final  TextEditingController? mycontroller;
  final void Function()? onPressedk;
  final String? Function(String?)? valid;
  Customtextfeld({super.key, required this.hintText, this.onPressedk,
   required this.labeltext, required this.iconss,
   required  this.mycontroller,required this.valid,this.keyboardType});
  @override
  Widget build(BuildContext context) {
   
    return Container(
      
      margin:const EdgeInsets.only(bottom: 15,top: 15),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: valid,
        controller: mycontroller,
      decoration: InputDecoration(
       
        hintStyle: const TextStyle(fontSize: 14),
        hintText: hintText,
        //يجعل اللليبل ثابت في الالى دائما
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon: Icon(iconss,),
        label: Container(margin: const EdgeInsets.symmetric(horizontal: 9),child: Text(labeltext)),
        contentPadding:const EdgeInsets.symmetric(vertical: 5,horizontal: 20),
        border: OutlineInputBorder(
      
      borderRadius: BorderRadius.circular(16)
        ),

        focusedBorder: OutlineInputBorder(
          borderSide:const BorderSide(color:Colors.blue),
          borderRadius:BorderRadius.circular(20)
        
        ),
  
      ),
      ),
    );
  }
}