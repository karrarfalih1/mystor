

import 'package:flutter/material.dart';
import 'package:store313/core/functionsk/checkinernet.dart';


void main(){
  runApp( const test());
}

class test extends StatefulWidget{
  const test({super.key});

  @override
  State<StatefulWidget> createState() => teststate();

}

class teststate extends State<test>{

var res;
initaldata()async{
  res=await checkInternet();
   print("------------------------------$res");
}

@override
  void initState(){
  initaldata();
 
    super.initState();

}

  @override
  Widget build(BuildContext context) {
    return MaterialApp(home:
 Scaffold(
      appBar: AppBar(title: const Text("karrar"),),

    )
    );
    
    
  }

}