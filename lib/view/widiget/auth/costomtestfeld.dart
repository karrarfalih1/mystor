
import 'package:flutter/material.dart';
import 'package:get/get.dart';
class Customtextfeld extends StatelessWidget {
  final String hintText;
  final String labeltext;
  final  IconData  iconss;
 final TextInputType? keyboardType;
 final bool obscureText ;
 final void Function()? onTap;
  final  TextEditingController? mycontroller;
  final void Function()? onPressedk;
  final String? Function(String?)? valid;
  Customtextfeld({
    this.obscureText=false,
    super.key,
     required this.hintText, 
     this.onPressedk,
     this.onTap,
   required this.labeltext,
    required this.iconss,
   required  this.mycontroller,
   required this.valid,
   this.keyboardType});
  @override
  Widget build(BuildContext context) {
   
    return Container(
      
      margin:const EdgeInsets.only(bottom: 15,top: 15),
      child: TextFormField(
      obscureText: obscureText,

        keyboardType: keyboardType,
        validator: valid,
        controller: mycontroller,
      decoration: InputDecoration(
       
        hintStyle: const TextStyle(fontSize: 14),
        hintText: hintText,
        //يجعل اللليبل ثابت في الالى دائما
      floatingLabelBehavior: FloatingLabelBehavior.always,
      suffixIcon:InkWell(onTap: onTap,child: Icon(iconss),),
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